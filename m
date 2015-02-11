From: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [resend PATCH v3 4/4] usb: phy: add phy-hi6220-usb
Date: Wed, 11 Feb 2015 01:30:53 +0000
Message-ID: <BN3PR0301MB0849FB28B1DAF7BEB5F3BE7881250@BN3PR0301MB0849.namprd03.prod.outlook.com>
References: <1423559404-13058-1-git-send-email-zhangfei.gao@linaro.org>
 <1423559404-13058-5-git-send-email-zhangfei.gao@linaro.org>
 <20150210144807.GC16711@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150210144807.GC16711-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> > Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/usb/phy/Kconfig          |   9 ++
> >  drivers/usb/phy/Makefile         |   1 +
> >  drivers/usb/phy/phy-hi6220-usb.c | 306
> > +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 316 insertions(+)
> >  create mode 100644 drivers/usb/phy/phy-hi6220-usb.c
> >
> > diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig index
> > c6d0c8e..405a3d0 100644
> > --- a/drivers/usb/phy/Kconfig
> > +++ b/drivers/usb/phy/Kconfig
> > @@ -173,6 +173,15 @@ config USB_MXS_PHY
> >
> >  	  MXS Phy is used by some of the i.MX SoCs, for example imx23/28/6x.
> >
> > +config USB_HI6220_PHY
> > +	tristate "hi6220 USB PHY support"
> > +	select USB_PHY
> > +	select MFD_SYSCON
> > +	help
> > +	  Enable this to support the HISILICON HI6220 USB PHY.
> > +
> > +	  To compile this driver as a module, choose M here.
> > +
> >  config USB_RCAR_PHY
> >  	tristate "Renesas R-Car USB PHY support"
> >  	depends on USB || USB_GADGET
> > diff --git a/drivers/usb/phy/Makefile b/drivers/usb/phy/Makefile index
> > 75f2bba..00172d3 100644
> > --- a/drivers/usb/phy/Makefile
> > +++ b/drivers/usb/phy/Makefile
> > @@ -18,6 +18,7 @@ obj-$(CONFIG_SAMSUNG_USBPHY)		+= phy-
> samsung-usb.o
> >  obj-$(CONFIG_TWL6030_USB)		+= phy-twl6030-usb.o
> >  obj-$(CONFIG_USB_EHCI_TEGRA)		+= phy-tegra-usb.o
> >  obj-$(CONFIG_USB_GPIO_VBUS)		+= phy-gpio-vbus-usb.o
> > +obj-$(CONFIG_USB_HI6220_PHY)		+= phy-hi6220-usb.o
> 
> new drivers only on drivers/phy/, sorry.
> 

This driver has many USB dependencies, like otg, gadget. I don't know it
can use generic phy currently.

Peter
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
