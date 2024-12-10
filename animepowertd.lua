local args = {
    [1] = "5007",
    [2] = 0/0 
}

game:GetService("ReplicatedStorage").Modules.Packages.Knit.Services.ShopService.RF.PurchasePortalItem:InvokeServer(unpack(args))

wait(1)

local args = {
    [1] = "1",
    [2] = math.huge
}

game:GetService("ReplicatedStorage").Modules.Packages.Knit.Services.ShopService.RF.PurchaseMerchantItem:InvokeServer(unpack(args))

wait(1)

local args = {
    [1] = "ActivateCode",
    [2] = "demoncity!"
}

game:GetService("ReplicatedStorage").Events.Settings:FireServer(unpack(args))

wait(1)

local args = {
    [1] = "3049",
    [2] = 0/0
}

game:GetService("ReplicatedStorage").Modules.Packages.Knit.Services.ShopService.RF.PurchasePortalItem:InvokeServer(unpack(args))

wait(1)

local args = {
    [1] = "3029",
    [2] = math.huge
}

game:GetService("ReplicatedStorage").Modules.Packages.Knit.Services.ShopService.RF.PurchasePortalItem:InvokeServer(unpack(args))
