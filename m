From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: ventana: Add ext watchdog reset
Date: Mon, 8 Aug 2016 15:30:08 +0800
Message-ID: <20160808073008.GC4678@tiger>
References: <1467207063-4774-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467207063-4774-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 29, 2016 at 06:31:03AM -0700, Tim Harvey wrote:
> bc677ff42e81bbf78308a7b66cf7b63b0f5c26b0 adds a device-tree property
> to specify that an external watchdog reset is used to reset other
> portions of the board and not just the IMX6 SoC.
> 
> This adds the property to the proper watchdog as well as the pinmux for
> the Gateworks Ventana boards that use this external watchdog reset to
> reset the PMIC which will reset all the PMIC power rails and not just
> a chip-level IMX6 reset. This helps to work around various system issues
> that can cause a hang when coming out of reset.
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
