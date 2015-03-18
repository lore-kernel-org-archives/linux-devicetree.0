From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: vexpress: Add unified-cache Device Tree property
Date: Wed, 18 Mar 2015 10:29:42 +0100
Message-ID: <20150318092942.GQ8272@pengutronix.de>
References: <1426617084-1583-1-git-send-email-r.schwebel@pengutronix.de>
 <5509437E.6060806@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5509437E.6060806-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 09:21:02AM +0000, Sudeep Holla wrote:
> On 17/03/15 18:31, Robert Schwebel wrote:
> >Without this propergy, we get this boot warning:
> >
>              ^^property

Uh, sorry, will fix.

> >"L2C: device tree omits to specify unified cache"
> >
> >Signed-off-by: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Thanks.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
