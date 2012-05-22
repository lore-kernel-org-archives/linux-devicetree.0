From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Tue, 22 May 2012 12:56:52 +0300
Message-ID: <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com> <1337592237-5090-6-git-send-email-richard.zhao@freescale.com> <201205220630.57007.marex@denx.de> <20120522045120.GL6206@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120522045120.GL6206-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:

> On Tue, May 22, 2012 at 06:30:56AM +0200, Marek Vasut wrote:
>> Dear Richard Zhao,
>> 
>> > Just add host support.
>> 
>> Maybe rephrase it to something like "This patch supports only the host-mode 
>> functionality so far."
> Thanks.
>> 
>> > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>> > Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> > Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/usb/ci13xxx-imx.txt        |   20 ++
>> >  drivers/usb/chipidea/Makefile                      |    8 +
>> >  drivers/usb/chipidea/ci13xxx_imx.c                 |  191
>> > ++++++++++++++++++++ 3 files changed, 219 insertions(+), 0 deletions(-)
>> >  create mode 100644 Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
>> >  create mode 100644 drivers/usb/chipidea/ci13xxx_imx.c
>> > 
>> > diff --git a/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
>> > b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt new file mode
>> > 100644
>> > index 0000000..beb75d6
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/ci13xxx-imx.txt
>> > @@ -0,0 +1,20 @@
>> > +* Freescale i.MX ci13xxx usb controllers
>> > +
>> > +Required properties:
>> > +- compatible: Should be "fsl,imx31-usb"
>> > +- reg: Should contain registers location and length
>> > +- interrupts: Should contain controller interrupt
>> > +
>> > +Optional properties:
>> > +- fsl,usbphy: phandler of usb phy that connects to the only one port
>> > +- fsl,hub-reset-gpios: gpio used to reset on-board usb hub
>> > +- fsl,vbus-power-gpios: gpio used to set vbus power of the only one port
>> > +
>> > +Examples:
>> > +usb@02184000 { /* USB OTG */
>> > +	compatible = "fsl,imx6q-usb", "fsl,imx31-usb";
>> > +	reg = <0x02184000 0x200>;
>> > +	interrupts = <0 43 0x04>;
>> > +	fsl,usbphy = <&usbphy1>;
>> > +	fsl,vbus-power-gpios = <&gpio3 22 0>;
>> > +};
>> > diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
>> > index cc34937..ffa2f63 100644
>> > --- a/drivers/usb/chipidea/Makefile
>> > +++ b/drivers/usb/chipidea/Makefile
>> > @@ -12,3 +12,11 @@ endif
>> >  ifneq ($(CONFIG_ARCH_MSM),)
>> >  	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_msm.o
>> >  endif
>> > +
>> > +ifneq ($(CONFIG_ARCH_MXC),)
>> > +	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o
>> > +else
>> > +  ifneq ($(CONFIG_ARCH_MXS),)
>> > +	  obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_imx.o
>> > +  endif
>> > +endif
>> 
>> I think someone commented on these patches (my previous set of patches 
>> actually), that this should be fixed in a way that you can actually select which 
>> bindings you want to compile in (and not limit it via Makefile like it's now).
> Yes. I think you're right.
>
> Alexander,
>
> Do you think it's a good idea to let user select binding driver directly
> and the binding driver config depends on chipidea config?

I don't have a strong opinion on this, although I prefer it the way it
is now, because, imo:

  * in case of =m (and that's the only sane way of compiling it anyway),
    these all are compiled as modules, which you simply don't install if
    you don't want them;
  * all of them get compile-tested every time you change something in
    the driver, which is a good thing;
  * the fewer kconfig options the better.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
