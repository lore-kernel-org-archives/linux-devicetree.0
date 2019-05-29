From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH] usb: dwc3: Enable the USB snooping
Date: Wed, 29 May 2019 13:24:37 +0300
Message-ID: <874l5dr21m.fsf@linux.intel.com>
References: <20171115060459.45375-1-ran.wang_1@nxp.com> <87ineb9b5v.fsf@linux.intel.com> <VI1PR04MB1504776EF3D4D8C374F0C069F1290@VI1PR04MB1504.eurprd04.prod.outlook.com> <87shdfet90.fsf@linux.intel.com> <AM5PR0402MB28654EBE2D431CC2F8061CF8F11E0@AM5PR0402MB2865.eurprd04.prod.outlook.com> <87k1eaanjw.fsf@linux.intel.com> <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0402MB2865AB6C2A50851B7EA4E653F11F0@AM5PR0402MB2865.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Hi,

Ran Wang <ran.wang_1@nxp.com> writes:
>> >> >> c) WHAT does this mean for PCI devices?
>
> According to DWC3 data book, I think this (PCI) mean to the case of 'master bus type = Native'
> The data book describes this feature as 'system bus DMA option for the master bus,
> which may be configured as AHB, AXI, or Native.' On Table 6-5, it says when MBUS_TYPE
> is Native, the definition of 4 transfer types control bits [3-0] is 'Same as AXI'.
>
> However, as to the code implementation to be generic to both PCI and AXI,
> I admit I don't have a perfect solution so far, only 2 proposals with concerns:
>
> a. Create another module driver like dwc3-exynos.c (arch/arm/boot/dts/wxynos54xx.dtsi)
>     to contain above programming code. However, it will touch the same reg range of DWC3
>     I think this is not good.

I'd prefer avoiding another glue :-)

> b. Add #ifdef CONFIG_ARCH_LAYERSCAPE in drivers/usb/dwc3/core.c to constrain hacking code
>    can only take effect for Layerscape (AXI case). I know it look ugly.
>
> Do you have any better advice on this (besides changed power on default value from HW perspective)?

Maybe we don't need to care, actually. Since this property will only be
needed for RTL instantiation that didn't configure these defaults
properly during coreConsultant.

>> >> >> Another question is: Why wasn't this setup properly during
>> >> >> coreConsultant instantiation of the RTL? Do you have devices on
>> >> >> the market already that need this or is this some early FPGA model
>> >> >> or test-only
>> >> ASIC?
>
> Several Layerscape platforms like LS1043ARDB, LS1046ARDB, etc. are already on
> the market and have this issue. So I have to work out a SW patch to fix them.

Thank you, now I'm certain that this is not some temporary solution :-)

Thanks for going through this again. Please refresh the patch so we can
try to get it merged.

-- 
balbi
