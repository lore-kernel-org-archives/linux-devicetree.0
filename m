From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] of: Add vendor prefix for Dialog Semiconductor Plc
Date: Mon, 07 Jul 2014 10:06:56 +0200
Message-ID: <1404720416.3567.2.camel@paszta.hi.pengutronix.de>
References: <1404470603-30394-1-git-send-email-p.zabel@pengutronix.de>
	 <6ED8E3B22081A4459DAC7699F3695FB7D0B238B5@SW-EX-MBX02.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6ED8E3B22081A4459DAC7699F3695FB7D0B238B5-68WUHU125fLzLL1Oxlh9IgLouzNaz+3S@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Opensource [Steve Twiss]" <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steve,

Am Freitag, den 04.07.2014, 12:52 +0000 schrieb Opensource [Steve
Twiss]:
> >Subject: [PATCH] of: Add vendor prefix for Dialog Semiconductor Plc
> >Add Dialog Semiconductor Plc to the list of device tree vendor prefixes.
> >Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >---
> > Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> > 1 file changed, 1 insertion(+)
> >diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >index 9ab11e0..be47d1a 100644
> >--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> >@@ -38,6 +38,7 @@ dallas	Maxim Integrated Products (formerly Dallas
> >Semiconductor)
> > davicom	DAVICOM Semiconductor, Inc.
> > denx	Denx Software Engineering
> > digi	Digi International Inc.
> >+dlgnf	Dialog Semiconductor Plc
> 
> This discussion has been in progress for a while now.
> There are already pending changes for the vendor prefix Dialog Semiconductor.
> 
> Please see the conversations here with Rob Herring:
> https://lkml.org/lkml/2014/6/11/262
> https://lkml.org/lkml/2014/6/11/199

Thank you, I haven't seen those. So is it going to be 'dlg' then?
Is this already queued somewhere? It doesn't seem to have made it
into linux-next yet.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
