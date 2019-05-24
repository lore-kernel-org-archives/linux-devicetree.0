Return-Path: <SRS0=iqOF=TY=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V3 8/8] arm64: defconfig: Enable tegra XUDC driver
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
 <20190523103042.GH30331@ulmo>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <0b7508f4-584e-0193-6415-bbe4d9a4db42@nvidia.com>
Date: Fri, 24 May 2019 13:31:19 +0530
MIME-Version: 1.0
In-Reply-To: <20190523103042.GH30331@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 23-05-2019 16:00, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:32PM +0530, Nagarjuna Kristam wrote:
>> Enable support for Nvidia XUSB device mode controller driver.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b605b7f..bf1437c 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -575,6 +575,7 @@ CONFIG_USB_ULPI=y
>>  CONFIG_USB_GADGET=y
>>  CONFIG_USB_RENESAS_USBHS_UDC=m
>>  CONFIG_USB_RENESAS_USB3=m
>> +CONFIG_USB_TEGRA_XUDC=y
> 
> This driver is fairly large, do we really want to make it built-in by
> default? Are there any downsides to making this a loadable module?
> 
> Thierry
> 
 No downsides to make it as a module, will update change to mark it as module.
