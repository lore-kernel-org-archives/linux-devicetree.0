From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Phytec phyFLEX-i.MX6 : Added USB_OTG Support
Date: Wed, 19 Feb 2014 13:58:29 +0800
Message-ID: <20140219055824.GB3010@S2101-09.ap.freescale.net>
References: <1392731185-4885-1-git-send-email-ashutosh.s@phytec.in>
 <20140219022307.GL15716@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140219022307.GL15716-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 10:23:09AM +0800, Shawn Guo wrote:
> > @@ -18,6 +18,14 @@
> >  	memory {
> >  		reg = <0x10000000 0x80000000>;
> >  	};
> > +
> > +	reg_usb_otg_vbus: regulator@0 {
> 
> You do not have a 'reg' property in the node, so you shouldn't have
> '@num' in node name.  You may want to name it 'regulator-0'.

I just saw the talk between Stephen and Mark [1], and I'm with Stephen
that neither regulator-0 nor regulator_0 is a good name.  Since Mark is
giving up the argument on the container, please follow the way we do in
other IMX dts today.

Shawn

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/61894/focus=62405

> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "usb_otg_vbus";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&gpio4 15 0>;
> > +	};
> >  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
