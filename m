Return-Path: <SRS0=Z3Sa=WS=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
 <20190822091248.GD23873@ulmo>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <f48e97e5-4ceb-7c83-de6a-4f29cf1945cf@nvidia.com>
Date: Thu, 22 Aug 2019 16:05:30 +0530
MIME-Version: 1.0
In-Reply-To: <20190822091248.GD23873@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 22-08-2019 14:42, Thierry Reding wrote:
> On Thu, Aug 08, 2019 at 03:07:25PM +0530, Nagarjuna Kristam wrote:
>> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
>> XUSB device mode controller supports SS, HS and FS modes
>>
>> Based on work by:
>>   Mark Kuo <mkuo@nvidia.com>
>>   Hui Fu <hfu@nvidia.com>
>>   Andrew Bresticker <abrestic@chromium.org>
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/usb/gadget/udc/Kconfig      |   11 +
>>  drivers/usb/gadget/udc/Makefile     |    1 +
>>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 3820 insertions(+)
>>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>>
>> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
>> index ef0259a..fe6028e 100644
>> --- a/drivers/usb/gadget/udc/Kconfig
>> +++ b/drivers/usb/gadget/udc/Kconfig
>> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>>  	  dynamically linked module called "udc-xilinx" and force all
>>  	  gadget drivers to also be dynamically linked.
>>  
>> +config USB_TEGRA_XUDC
>> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
>> +	depends on ARCH_TEGRA
>> +	select USB_ROLE_SWITCH
>> +	help
>> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
>> +
>> +	 Say "y" to link the driver statically, or "m" to build a
>> +	 dynamically linked module called "tegra_xudc" and force all
>> +	 gadget drivers to also be dynamically linked.
>> +
>>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
>>  
>>  #
>> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
>> index 897f648..1c55c96 100644
>> --- a/drivers/usb/gadget/udc/Makefile
>> +++ b/drivers/usb/gadget/udc/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_BCM63XX_UDC)	+= bcm63xx_udc.o
>>  obj-$(CONFIG_USB_FSL_USB2)	+= fsl_usb2_udc.o
>>  fsl_usb2_udc-y			:= fsl_udc_core.o
>>  fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+= fsl_mxc_udc.o
>> +obj-$(CONFIG_USB_TEGRA_XUDC)	+= tegra_xudc.o
> 
> Nit: I have a slight preference for tegra-xudc.o over tegra_xudc.o. We
> use dashes rather than underscores pretty consistently on Tegra, so it
> would be good to keep the same pattern here, unless somebody feels
> strongly about the underscore.
> 
> It doesn't matter that much because module utilities treat them the same
> way I think, so the Acked-by remains valid either way.
> 
> Thierry
> 

Thierry,
Reason to keep tegra_xudc.c instead of tegra-xudc.c is to inline with local file naming.
I will use tegra-xudc.c name in next version, to be inline with other tegra files across
kernel.

Thanks,
Nagarjuna
