From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: r8a7743: add IIC cores to dtsi
Date: Wed, 30 Aug 2017 09:32:14 +0200
Message-ID: <20170830073214.GL10398@verge.net.au>
References: <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <1502704398-28378-1-git-send-email-biju.das@bp.renesas.com>
 <TY1PR06MB07027D9A55FBFE2D591CEDCFB7840@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <b7434757-b151-5971-2b5f-525eeaf11467@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b7434757-b151-5971-2b5f-525eeaf11467-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 03:23:39PM +0300, Sergei Shtylyov wrote:
> On 08/22/2017 12:10 PM, Chris Paterson wrote:
> 
> >>From: Biju Das [mailto:biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org]
> >>Sent: 14 August 2017 10:53
> >>
> >>Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> >>---
> >>v1-->v2
> >>    Corrected the resets property for i2c6 device node.
> >
> >Are you happy with this version of the patch?
> >
> >Or is the discussion for moving to 'iic' still alive?
> 
>    Yes, appears so. I'd like the labels to be named iic<n>.

Chirs, I'm marking this as "Changes Requested" and expecting to see iic
in v3 when you are ready.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
