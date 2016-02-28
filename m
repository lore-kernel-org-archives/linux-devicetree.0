From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM64: dts: add LS1043a-QDS board support
Date: Sun, 28 Feb 2016 10:38:18 +0800
Message-ID: <20160228023818.GB22051@tiger>
References: <1450948298-33238-1-git-send-email-Zhiqiang.Hou@freescale.com>
 <1450948298-33238-2-git-send-email-Zhiqiang.Hou@freescale.com>
 <20160219032830.GG6756@tiger>
 <HE1PR04MB0906707F686591B374AA364F84A00@HE1PR04MB0906.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <HE1PR04MB0906707F686591B374AA364F84A00-6LN7OEpIatWBkn9woE/rDM9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiqiang Hou <zhiqiang.hou-3arQi8VN3Tc@public.gmane.org>
Cc: Zhiqiang Hou <Zhiqiang.Hou-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 19, 2016 at 10:10:04AM +0000, Zhiqiang Hou wrote:

<snip>

> > > +	pca9547@77 {
> > > +		compatible = "philips,pca9547";
> > 
> > I cannot find this compatible string in either binding docs or driver code.
> > 
> 
> See the file below.
> ./drivers/i2c/muxes/i2c-mux-pca954x.c:115:	{ "pca9547", pca_9547 },
> Perhaps the vender name should be updated to nxp.

Yes, if you look at Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt,
"nxp,pca9547" is the one you should use here.

<snip>

> > > +			eeprom@56 {
> > > +				compatible = "at24,24c512";
> > 
> > Unsupported/undocumented compatible?
> 
> Will change it to "atmel, 24c512".

Yes, but without the space in the middle.

> 
> > 
> > > +				reg = <0x56>;
> > > +			};
> > > +
> > > +			eeprom@57 {
> > > +				compatible = "at24,24c512";
> > > +				reg = <0x57>;
> > > +			};
> > > +
> > > +			adt7461a@4c {
> > 
> > temp-sensor should be a better node name, if I understand the device correctly.
> > 
> 
> I didn't find a reference in kernel, so what name should be better, do you have any advice?

"temp-sensor" is what I see from the example in
Documentation/devicetree/bindings/hwmon/lm90.txt.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
