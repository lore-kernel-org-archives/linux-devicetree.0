From: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM:dts:imx6:phyFLEX: Enable gpmi in module file
Date: Mon, 17 Nov 2014 09:27:37 +0100
Message-ID: <3652599.ahZEGyuIxZ@lws-hemp>
References: <1415971946-48975-1-git-send-email-c.hemp@phytec.de> <1415971946-48975-3-git-send-email-c.hemp@phytec.de> <1445555.ZBLGLeHvnl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445555.ZBLGLeHvnl@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

Am Freitag, 14. November 2014, 15:55:11 schrieb Arnd Bergmann:
> On Friday 14 November 2014 14:32:23 Christian Hemp wrote:
> > --- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> > @@ -91,7 +91,7 @@
> > 
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&pinctrl_gpmi_nand>;
> >         nand-on-flash-bbt;
> > 
> > -       status = "disabled";
> > +       status = "okay";
> > 
> >  };
> 
> No need for the property unless you are overriding a 'status="disabled"'
> from another file. Just remove this property here.

the status is disabled in 'arch/arm/boot/dts/imx6qdl.dtsi'. 
That why I enabled it in the 'arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi'.

	Christian

> 
> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
