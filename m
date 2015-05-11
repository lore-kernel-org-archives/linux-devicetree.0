From: Matthias Brugger_0 <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] Mediatek SCPSYS power domain support
Date: Mon, 11 May 2015 18:05:20 +0200
Message-ID: <2471388.4xC5mv0cE3@ubix>
References: <1431349882-12260-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431349882-12260-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, May 11, 2015 03:11:18 PM Sascha Hauer wrote:
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
> changes since v1:
> - make MFG_ASYNC a subdomain of MFG_2D and MFG_2D a subdomain of MFG
> - Add (now hopefully properly) infracfg register handling again
> - Add clock handling
> - Fix on/off mixup in error message
> - Make readonly data const
> - Fix MODULE_LICENSE to GPL v2

I can't find this changes. It looks like you send the wrong patches. 
Please resend.

Cheers,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
