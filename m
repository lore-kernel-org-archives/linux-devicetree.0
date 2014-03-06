From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [RESEND Patch 1/2] DT: Vendor: Add prefixes used by Kirkwood
 devices
Date: Thu, 6 Mar 2014 13:39:32 +0100
Message-ID: <20140306123932.GG4780@lunn.ch>
References: <1394054474-4310-1-git-send-email-andrew@lunn.ch>
 <1394054474-4310-2-git-send-email-andrew@lunn.ch>
 <8738ivy0uo.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8738ivy0uo.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 06, 2014 at 01:21:03PM +0100, Arnaud Ebalard wrote:
> Hi Andrew,
> 
> Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> writes:
> 
> > Add a number of vendor prefixes by kirkwood devices. These are not all
> > stock tickers, but have been in use for a while so changing would not
> > be easy.
> >
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index c73b435f58f5..860c467374fe 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -20,2 +20,3 @@ bosch	Bosch Sensortec GmbH
> >  brcm	Broadcom Corporation
> > +buffalo	Buffalo, Inc.
> >  capella	Capella Microsystems, Inc
> > @@ -30,2 +31,3 @@ davicom	DAVICOM Semiconductor, Inc.
> >  denx	Denx Software Engineering
> > +dlink	D-Link Corporation
> >  edt	Emerging Display Technologies
> > @@ -35,2 +37,3 @@ epson	Seiko Epson Corp.
> >  est	ESTeem Wireless Modems
> > +excito	Excito
> >  fsl	Freescale Semiconductor
> > @@ -39,2 +42,3 @@ gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
> >  gmt	Global Mixed-mode Technology, Inc.
> > +globalscale	GlobalScale Technologies, Inc.
> >  gumstix	Gumstix, Inc.
> > @@ -45,2 +49,3 @@ ibm	International Business Machines (IBM)
> >  idt	Integrated Device Technologies, Inc.
> > +iom	Iomega Corporation
> >  img	Imagination Technologies Ltd.
> > @@ -49,2 +54,4 @@ isl	Intersil
> >  karo	Ka-Ro electronics GmbH
> > +keymile	Keymile GmbH
> > +lacie	LaCie
> >  lg	LG Corporation
> > @@ -56,3 +63,5 @@ microchip	Microchip Technology Inc.
> >  mosaixtech	Mosaix Technologies, Inc.
> > +mpl	MPL AG
> >  national	National Semiconductor
> > +netgear	Netgear, Inc.
> 
> I do not have a strong opinion on it but I think I read on LAKML there
> was some kind of rule to use ticker symbol for a given vendor if it
> exists e.g. ntgr for netgear (like fsl for freescale, brcm for broadcom,
> etc).

What you say is true, we try to use stock tickers. However, in the
changelog i say:

    Add a number of vendor prefixes by kirkwood devices. These are not
    all stock tickers, but have been in use for a while so changing
    would not be easy.

We have the problem that we have DTs in the field making use of these
vendor prefixes. They have effectively become part of the ABI. We have
to support them. Even if we do change to stock tickers, we still need
to support the old vendor prefix as well. So since it is just a rule
of thumb to use the stock ticker, not a strict rule, i've kept with
what we have.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
