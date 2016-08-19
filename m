From: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
Subject: Re: [PATCH v3 1/3] devicetree: Sort vendor prefixes in alphabetical
 order
Date: Fri, 19 Aug 2016 07:16:46 +0200
Message-ID: <20160819051645.2lcid73kdy2hwdwk@vip.cybercity.dk>
References: <54da74da3f60ede0bf8fb789ffee584703e81a29.1471553094.git.ccc94453@vip.cybercity.dk>
 <20160818230237.GA22939@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160818230237.GA22939-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 01:02:37AM +0200, Andrew Lunn wrote:
> > @@ -54,8 +54,8 @@ chipone		ChipOne
> >  chipspark	ChipSPARK
> >  chrp	Common Hardware Reference Platform
> >  chunghwa	Chunghwa Picture Tubes Ltd.
> > -ciaa	Computadora Industrial Abierta Argentina
> >  cirrus	Cirrus Logic, Inc.
> > +ciaa	Computadora Industrial Abierta Argentina
> 
> ciaa comes after cirrus?

It does with LC_COLLATE=da_DK :-(
I'm sorry about that. I'll post v4 this afternoon.

-- 
Rask Ingemann Lambertsen
Danish law requires addresses in e-mail to be logged and stored for a year
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
