From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] Add support for the eukrea-cpuimx28.
Date: Mon, 9 Dec 2013 11:31:57 +0800
Message-ID: <20131209033150.GA6265@S2101-09.ap.freescale.net>
References: <1386250086-4666-1-git-send-email-denis@eukrea.com>
 <1386250086-4666-3-git-send-email-denis@eukrea.com>
 <20131209032530.GC825@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131209032530.GC825-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 09, 2013 at 11:25:32AM +0800, Shawn Guo wrote:
> > diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
> > index 02b17f7..3b5f57e 100644
> > --- a/arch/arm/mach-mxs/mach-mxs.c
> > +++ b/arch/arm/mach-mxs/mach-mxs.c
> > @@ -448,6 +448,12 @@ static int __init mxs_restart_init(void)
> >  	return 0;
> >  }
> >  
> > +static void __init eukrea_mbmx283lc_init(void)
> > +{
> > +	enable_clk_enet_out();
> 
> This shouldn't be needed since commit daa7d39 (net: freescale: fec: add
> support for optional enet_out clk) and commit (f231a9f ARM: dts: mxs:
> add enet_out clock to devicetree)

I just fixed it up and apply the patch.  Please test it and report back
if it does not work for you.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
