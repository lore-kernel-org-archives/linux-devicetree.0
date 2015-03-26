From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v1] Mediatek SCPSYS power domain support
Date: Thu, 26 Mar 2015 10:45:41 +0100
Message-ID: <20150326094541.GD4946@pengutronix.de>
References: <1426002063-25713-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426002063-25713-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Kevin,

since you have reviewed the first version of this series, could you give
a reviewed-by or acked-by?

Thanks
 Sascha

On Tue, Mar 10, 2015 at 04:40:59PM +0100, Sascha Hauer wrote:
> This series adds support for the MediaTek SCPSYS unit.
> 
> The SCPSYS unit handles several power management related tasks such
> as thermal measurement, DVFS, interrupt filter and low level sleep
> control.
> 
> The initial support only contains the generic power domain handling.
> This is needed to turn on power to the different power domains.
> 
> The driver is quite straight forward now. Due to the lack of a better
> place I have put it to drivers/soc/mediatek. As the SCPSYS unit has
> several other tasks that also do not fit into some specific subsystem
> this probably is a good place for this driver.
> 
> Please review, any input welcome.
> 
> Sascha
> 
> changes since RFC:
> 
> - add a commit log to driver patch
> - drop manipulating infracfg registers for now, can be added (properly)
>   later
> - Add warning messages when errors occur
> - add NULL pointer check for kmalloc
> - Enable all power domains when PM is disabled to allow consumers to work
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
