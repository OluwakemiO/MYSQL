-- CLEANING DATA IN SQL QUERIES


---------------------------------------------------------------------------
---STANDARDIZED DATA FORMART

SELECT*
FROM NashvilleHousing2

SELECT SALEDATE
FROM NashvilleHousing2

SELECT Saledate,CONVERT(DATE,SALEDATE)
FROM NashvilleHousing2

ALTER TABLE NashvilleHousing2
ADD SaleDConverted DATE

UPDATE NashvilleHousing2
SET SaleDConverted=CONVERT(DATE,SALEDATE)




---------------------------------------------------------------------------
---POPULATE PROPERTY ADDRESS DATA
SELECT *
FROM NashvilleHousing2
WHERE PropertyAddress IS NULL


SELECT *
FROM NashvilleHousing2
ORDER BY ParcelID


SELECT *
FROM NashvilleHousing2 Nash21
JOIN NashvilleHousing2 Nash22
ON NASH21.ParcelID=NASH22.ParcelID
AND NASH21.UniqueID<>Nash22.UniqueID

SELECT Nash21.ParcelID,Nash21.PropertyAddress,Nash22.ParcelID,Nash22.PropertyAddress
FROM NashvilleHousing2 Nash21
JOIN NashvilleHousing2 Nash22
ON NASH21.ParcelID=NASH22.ParcelID
AND NASH21.UniqueID<>Nash22.UniqueID

SELECT Nash21.ParcelID,Nash21.PropertyAddress,Nash22.ParcelID,Nash22.PropertyAddress
FROM NashvilleHousing2 Nash21
JOIN NashvilleHousing2 Nash22
ON NASH21.ParcelID=NASH22.ParcelID
AND NASH21.UniqueID<>Nash22.UniqueID
WHERE Nash21.PropertyAddress IS NULL

SELECT Nash21.ParcelID,Nash21.PropertyAddress,Nash22.ParcelID,Nash22.PropertyAddress, ISNULL(Nash21.PropertyAddress,Nash22.PropertyAddress)
FROM NashvilleHousing2 Nash21
JOIN NashvilleHousing2 Nash22
ON NASH21.ParcelID=NASH22.ParcelID
AND NASH21.UniqueID<>Nash22.UniqueID
WHERE Nash21.PropertyAddress IS NULL

UPDATE Nash21
SET Nash21.PropertyAddress=ISNULL(Nash21.PropertyAddress,Nash22.PropertyAddress)
FROM NashvilleHousing2 Nash21
JOIN NashvilleHousing2 Nash22
ON NASH21.ParcelID=NASH22.ParcelID
AND NASH21.UniqueID<>Nash22.UniqueID
WHERE Nash21.PropertyAddress IS NULL



---------------------------------------------------------------------------
---BREAKING OUT ADDRESS INTO INDIVIDUAL COLUMNS(ADDRESS, CITY, STATE)

SELECT PropertyAddress
From NashvilleHousing2

SELECT
PARSENAME(REPLACE(PropertyAddress,',','.'),2),
PARSENAME(REPLACE(PropertyAddress,',','.'),1)
From NashvilleHousing2

ALTER TABLE NashvilleHousing2
ADD SplitPPtyAddress NVARCHAR (255)

ALTER TABLE NashvilleHousing2
ADD SplitPPtyCity NVARCHAR (255)

UPDATE NashvilleHousing2
SET SplitPPtyAddress=PARSENAME(REPLACE(PropertyAddress,',','.'),2)

UPDATE NashvilleHousing2
SET SplitPPtyCity=PARSENAME(REPLACE(PropertyAddress,',','.'),1)

--FOR OWNERADDRESS:
SELECT OwnerAddress
FROM NashvilleHousing2

SELECT
PARSENAME(REPLACE(Owneraddress,',','.'),3),
PARSENAME(REPLACE(Owneraddress,',','.'),2),
PARSENAME(REPLACE(Owneraddress,',','.'),1)
FROM NashvilleHousing2


ALTER TABLE NashvilleHousing2
ADD SplitOwnerAddress NVARCHAR(255)

ALTER TABLE NashvilleHousing2
ADD SplitOwnerCityAddress NVARCHAR(255)

ALTER TABLE NashvilleHousing2
ADD SplitOwnerStateAddress NVARCHAR(255)

UPDATE NashvilleHousing2
SET SplitOwnerAddress=PARSENAME(REPLACE(Owneraddress,',','.'),3)

UPDATE NashvilleHousing2
SET SplitOwnerCityAddress=PARSENAME(REPLACE(Owneraddress,',','.'),2)

UPDATE NashvilleHousing2
SET SplitOwnerStateAddress=PARSENAME(REPLACE(Owneraddress,',','.'),1)

SELECT*
FROM NashvilleHousing2


---------------------------------------------------------------------------
---CHANGE Y AND N INTO YES AND NO IN THE 'SOLD AS VACANT' FIELD

SELECT DISTINCT(SoldAsVacant)
FROM NashvilleHousing2

SELECT DISTINCT(SoldAsVacant),COUNT(SoldAsVacant)
FROM NashvilleHousing2
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant,
CASE
WHEN SoldAsVacant='Y' THEN 'YES'
WHEN SoldAsVacant='N' THEN 'NO'
ELSE SoldAsVacant
END
FROM NashvilleHousing2

UPDATE NashvilleHousing2
SET SoldAsVacant=CASE
WHEN SoldAsVacant='Y' THEN 'YES'
WHEN SoldAsVacant='N' THEN 'NO'
ELSE SoldAsVacant
END

SELECT*
FROM NashvilleHousing2



---------------------------------------------------------------------------
---REMOVE DUPLICATES
SELECT*,
ROW_NUMBER()OVER(
PARTITION BY ParcelID,PropertyAddress,SaleDate,SalePrice,LegalReference
ORDER BY UniqueID
)ROW_NUM
FROM NashvilleHousing2
ORDER BY ParcelID


WITH RowNumCTE AS(
SELECT*,
ROW_NUMBER()OVER(
PARTITION BY ParcelID,PropertyAddress,SaleDate,SalePrice,LegalReference
ORDER BY UniqueID
)ROW_NUM
FROM NashvilleHousing2
---ORDER BY ParcelID
)
SELECT*
FROM RowNumCTE
WHERE ROW_NUM>1
ORDER BY PropertyAddress

WITH RowNumCTE AS(
SELECT*,
ROW_NUMBER()OVER(
PARTITION BY ParcelID,PropertyAddress,SaleDate,SalePrice,LegalReference
ORDER BY UniqueID
)ROW_NUM
FROM NashvilleHousing2
---ORDER BY ParcelID
)
DELETE
FROM RowNumCTE
WHERE ROW_NUM>1
---ORDER BY PropertyAddress

WITH RowNumCTE AS(
SELECT*,
ROW_NUMBER()OVER(
PARTITION BY ParcelID,PropertyAddress,SaleDate,SalePrice,LegalReference
ORDER BY UniqueID
)ROW_NUM
FROM NashvilleHousing2
---ORDER BY ParcelID
)
SELECT*
FROM RowNumCTE
WHERE ROW_NUM>1
ORDER BY PropertyAddress





---------------------------------------------------------------------------
---DELETE UNUSED COLUMNS

SELECT *
FROM NashvilleHousing2

ALTER TABLE NASHVILLEHOUSING2
DROP COLUMN PropertyAddress,SaleDate,OwnerAddress,TaxDistrict








---------------------------------------------------------------------------
---------------------------------------------------------------------------
--- Importing Data using OPENROWSET and BULK INSERT	

--  More advanced and looks cooler, but have to configure server appropriately to do correctly
--  Wanted to provide this in case you wanted to try it


--sp_configure 'show advanced options', 1;
--RECONFIGURE;
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;
--GO


--USE PortfolioProject 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 

--GO 


---- Using BULK INSERT

--USE PortfolioProject;
--GO
--BULK INSERT nashvilleHousing FROM 'C:\Temp\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv'
--   WITH (
--      FIELDTERMINATOR = ',',
--      ROWTERMINATOR = '\n'
--);
--GO


---- Using OPENROWSET
--USE PortfolioProject;
--GO
--SELECT * INTO nashvilleHousing
--FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--    'Excel 12.0; Database=C:\Users\alexf\OneDrive\Documents\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv', [Sheet1$]);
--GO






