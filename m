From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LPCHC)
Date: Fri, 18 Nov 2016 18:45:35 +0000
Message-ID: <20161118184535.GE19884@dell.home>
References: <1478097481-14895-1-git-send-email-andrew@aj.id.au>
 <1478097481-14895-4-git-send-email-andrew@aj.id.au>
 <20161118184437.GD19884@dell.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161118184437.GD19884-Re9dqnLqz4GzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Sending Arnd this time!]

> Arnd,
> 
> Do you have a preference?
> 
> > The Aspeed LPC Host Controller is presented as a syscon device to
> > arbitrate access by LPC and pinmux drivers. LPC pinmux configuration on
> > fifth generation SoCs depends on bits in both the System Control Unit
> > and the LPC Host Controller.
> > 
> > Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt | 17 +++++++++++++++++
> 
> Create a new directory in bindings/mfd called 'syscon'.
> 
> Or perhaps 'bindings/syscon'.
> 
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > new file mode 100644
> > index 000000000000..792651488c3d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpchc.txt
> > @@ -0,0 +1,17 @@
> > +* Device tree bindings for the Aspeed LPC Host Controller (LPCHC)
> > +
> > +The LPCHC registers configure LPC behaviour between the BMC and the host
> > +system. The LPCHC also participates in pinmux requests on g5 SoCs and is
> > +therefore considered a syscon device.
> > +
> > +Required properties:
> > +- compatible:		"aspeed,ast2500-lpchc", "syscon"
> > +- reg:			contains offset/length value of the LPCHC memory
> > +			region.
> 
> Why not just use a single tab, then you don't have to linewrap?
> 
> > +Example:
> > +
> > +lpchc: lpchc@1e7890a0 {
> > +	compatible = "aspeed,ast2500-lpchc", "syscon";
> > +	reg = <0x1e7890a0 0xc4>;
> > +};
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
