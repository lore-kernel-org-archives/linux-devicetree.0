From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCHv6 2/2] dt/bindings: Add the DT binding documentation for
 endianness
Date: Wed, 20 Aug 2014 09:14:02 +0000
Message-ID: <10ad24319e6a486db77c31a5a911140e@BN1PR0301MB0609.namprd03.prod.outlook.com>
References: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
 <1405398183-31345-3-git-send-email-Li.Xiubo@freescale.com>
 <20140820080549.GA15414@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140820080549.GA15414@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCHv6 2/2] dt/bindings: Add the DT binding documentation for
> endianness
> 
> On Tue, Jul 15, 2014 at 12:23:03PM +0800, Xiubo Li wrote:
> > Device-Tree binding for device endianness
> > Index     Device     Endianness properties
> > ---------------------------------------------------
> > 1         BE         'big-endian'
> > 2         LE         'little-endian'
> >
> > For one device driver, which will run in different scenarios above
> > on different SoCs using the devicetree, we need one way to simplify
> > this.
> >
> > Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  .../devicetree/bindings/regmap/regmap.txt          | 47
> ++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt
> 
> Sorry for jumping in so late. I think this binding documentation needs
> to be moved somewhere else. regmap is a Linux kernel specific
> implementation detail and therefore has no place in device tree binding
> descriptions. Furthermore the endianness properties described herein do
> apply to drivers that don't use regmap.
> 
> Perhaps we need some top-level file that describes generic properties
> such as this?
> 
> Thierry

Yes, I do agree.
And there are many devices that have the endian issue without using the
Regmap in our LS* SoCs.

And I also think one generic binding description of this will be much
better.

Where should we place it? In Documentation/devicetree/bindings/, or...?


Thanks,

BRs
Xiubo


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
