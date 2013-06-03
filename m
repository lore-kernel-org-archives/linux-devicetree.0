From: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 4/7] USB chipidea: introduce dual role mode pdata flags
Date: Mon, 03 Jun 2013 15:37:13 +0300
Message-ID: <87zjv7id52.fsf@ashishki-desk.ger.corp.intel.com>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de> <1370025529-7414-5-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370025529-7414-5-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>
> Even if a chipidea core is otg capable the board may not. This allows

"may not be"

> to explicitly set the core to host/peripheral mode. Without these
> flags the driver falls back to the old behaviour.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---

[snip]

> +	if (!ci->platdata->dr_mode)
> +		ci->platdata->dr_mode = of_usb_get_dr_mode(dev->of_node);

same as previous one, let's keep it in the platform.

Regards,
--
Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
