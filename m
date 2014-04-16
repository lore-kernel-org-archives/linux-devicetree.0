From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/4] reset: add driver for socfpga
Date: Wed, 16 Apr 2014 09:13:50 +0200
Message-ID: <20140416071350.GI16054@pengutronix.de>
References: <1397548592-6384-1-git-send-email-s.trumtrar@pengutronix.de>
 <1397602483.3330.2.camel@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397602483.3330.2.camel@linux-builds1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 15, 2014 at 05:54:43PM -0500, Dinh Nguyen wrote:
> On Tue, 2014-04-15 at 09:56 +0200, Steffen Trumtrar wrote:
> > Add a reset-controller driver for the socfpga platform.
> > The reset-controller has four banks with up to 32 entries all encapsulated in
> > one module block.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > 
> > Notes:
> >     Changes since v2:
> >     	- remove superfluous ret in probe function
> >     	- add Acked-by
> >     
> >     Changes since v1:
> >     	- use BITS_PER_LONG everywhere instead of MAX_BANK_WIDTH
> >     	- print pdev->dev.of_node->full_name on error
> >     	- use proper IS_ERR/PTR_ERR
> > 
> 
> I've applied this series to rocketboards linux-socfpga-next/drivers and
> linux-socfpga-next/next-dt.
> 

\o/

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
