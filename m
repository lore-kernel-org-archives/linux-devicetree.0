From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 6 Feb 2014 17:50:03 +0100
Message-ID: <20140206165003.GJ29860@lunn.ch>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <1391634309-3123-5-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net>
 <1391704765.2162.7.camel@kazak.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391704765.2162.7.camel-ommiHX4a84BXesXXhkcM7miJhflN2719@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 04:39:25PM +0000, Ian Campbell wrote:
> On Thu, 2014-02-06 at 10:39 -0500, Jason Cooper wrote:
> > 
> > > +                     pmx_fan_33: pmx-fan-33 {
> > > +                             marvell,pins = "mpp33";
> > > +                             marvell,function = "gpo";
> > > +                     }; 
> 
> Typo I think.

Hi Ian

drivers/pinctrl/mvebu/pinctrl-kirkwood.c:

        MPP_MODE(33,
                MPP_VAR_FUNCTION(0x0, "gpo", NULL,       V(0, 1, 1, 1, 1, 0)),
                MPP_VAR_FUNCTION(0x2, "tdm", "dtx",      V(0, 0, 1, 1, 1, 0)),
                MPP_VAR_FUNCTION(0x3, "ge1", "txctl",    V(0, 1, 1, 1, 1, 0)),
                MPP_VAR_FUNCTION(0xb, "lcd", "d13",      V(0, 0, 0, 0, 1, 0))),
        MPP_MODE(34,

It is output only.

I actually had the opposite bug in v1, setup two gpo's as gpio's.

  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
