From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: Add vendor prefix for Voipac Technologies
 s.r.o.
Date: Thu, 31 Oct 2013 15:37:42 +0800
Message-ID: <20131031073738.GA23545@S2101-09.ap.freescale.net>
References: <1382651769-21238-1-git-send-email-lisovy@gmail.com>
 <1382651769-21238-2-git-send-email-lisovy@gmail.com>
 <20131025020213.GI14529@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131025020213.GI14529-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On Fri, Oct 25, 2013 at 10:02:16AM +0800, Shawn Guo wrote:
> Rob,
> 
> Can I have your ACK on this patch?

I just applied the patch on IMX tree.  Let me know if you have
objection.

Shawn

> 
> On Thu, Oct 24, 2013 at 11:56:07PM +0200, Rostislav Lisovy wrote:
> > Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 2956800..dc70ed0 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -69,6 +69,7 @@ ti	Texas Instruments
> >  toshiba	Toshiba Corporation
> >  v3	V3 Semiconductor
> >  via	VIA Technologies, Inc.
> > +voipac	Voipac Technologies s.r.o.
> >  wlf	Wolfson Microelectronics
> >  wm	Wondermedia Technologies, Inc.
> >  winbond Winbond Electronics corp.
> > -- 
> > 1.7.10.4
> > 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
