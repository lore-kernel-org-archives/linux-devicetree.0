From: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: meson: Add status LED for Odroid-C1
Date: Fri, 30 Oct 2015 17:55:24 +0000
Message-ID: <20151030175524.GD21307@codethink.co.uk>
References: <1444401430-4396-1-git-send-email-edward.cragg@codethink.co.uk>
 <1444401430-4396-2-git-send-email-edward.cragg@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444401430-4396-2-git-send-email-edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 03:37:10PM +0100, Edward Cragg wrote:
> Add the blue status LED to the Hardkernel Odroid C1 board DTS.
> This is the only programmable LED on the board.
> 
> Signed-off-by: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Hi, has anyone had a chance to have a look at this yet?

I originally forgot to add that this patch is dependent on:

[PATCH v2 0/4] Add support for Amlogic Meson8b and couple of boards

which has already been accepted.

Ed
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
