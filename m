From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv6 2/2] dt/bindings: Add the DT binding documentation for
 endianness
Date: Tue, 15 Jul 2014 05:36:54 +0000
Message-ID: <54b4550212bb402f957f75bded781e5e@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
 <1405398183-31345-3-git-send-email-Li.Xiubo@freescale.com>
 <53C4BD24.9000503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53C4BD24.9000503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +For one device driver, which will run in different scenarios above
> > +on different SoCs using the devicetree, we need one way to simplify
> > +this.
> > +
> > +Required properties:
> > +- {big,little}-endian: these are boolean properties, if absent
> > +  meaning that the CPU and the Device are in the same endianness mode,
> > +  these properties are for register values and all the buffers only.
> > +
> 
> It would be more readable if its like this:
> Required properties:
> - {big,little}-endian:	These are boolean properties, if absent meaning
> 			that the CPU and the Device are in the same
> 			endianness mode, these propperties are for
> 			values and all the buffers only.
> 

Yes, it is.

See the next verison.

Thanks,

BRs
Xiubo



> > +Examples:
> > +Scenario 1 : CPU in LE mode & device in LE mode.
> > +dev: dev@40031000 {
> > +	      compatible = "name";
> > +	      reg = <0x40031000 0x1000>;
> > +	      ...
> > +};
> > +
> > +Scenario 2 : CPU in LE mode & device in BE mode.
> > +dev: dev@40031000 {
> > +	      compatible = "name";
> > +	      reg = <0x40031000 0x1000>;
> > +	      ...
> > +	      big-endian;
> > +};
> > +
> > +Scenario 3 : CPU in BE mode & device in BE mode.
> > +dev: dev@40031000 {
> > +	      compatible = "name";
> > +	      reg = <0x40031000 0x1000>;
> > +	      ...
> > +};
> > +
> > +Scenario 4 : CPU in BE mode & device in LE mode.
> > +dev: dev@40031000 {
> > +	      compatible = "name";
> > +	      reg = <0x40031000 0x1000>;
> > +	      ...
> > +	      little-endian;
> > +};
> 
> 
> --
> Regards,
> Varka Bhadram.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
