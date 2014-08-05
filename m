From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: where to add imx-udc-mx27 in device tree
Date: Tue, 5 Aug 2014 09:20:39 -0300
Message-ID: <CAOMZO5AqZrnn8ww1oM998NwRXVw6MM6TKkbD6rNZ1bZMKEx0tQ@mail.gmail.com>
References: <E70AF999396FDF4EAE40E195B84709611F847DDE@SPMDEGHN001.CADCON.INTERN>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E70AF999396FDF4EAE40E195B84709611F847DDE-VHQhki0MIenpQFNhCJRnZ0Yy6alPw7Wn0MAMd6zgKLc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Priebe, Sebastian" <Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 5, 2014 at 9:06 AM, Priebe, Sebastian
<Sebastian.Priebe-hnW+OuB6jW6zQB+pC5nmwQ@public.gmane.org> wrote:
> Hello,
>
> I am trying to add an USB gadget to my device tree and I am using modules for my gadgets (serial and mass-storage).
> &usbotg {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_usbotg>;
>         dr_mode = "peripheral";
>         phy_type = "utmi_wide";
>         status = "okay";
> };

Take a look at arch/arm/boot/dts/imx27-eukrea-cpuimx27.dtsi for an example.

The udc driver is CONFIG_USB_CHIPIDEA_UDC=y.

There is also the commit below in linux-next (not in 3.16) that select
the gadget driver for imx_v4_v5_defconfig.

Author: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Date:   Wed Jun 25 17:28:53 2014 -0300

    ARM: imx_v4_v5_defconfig: Add USB device options

    Allow USB device to work by default.

    Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
    Signed-off-by: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_d
index 68abce9..090de01 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -159,6 +159,8 @@ CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
