From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: dts: imx: ventana: dt cleanups
Date: Wed, 10 Sep 2014 14:26:04 +0800
Message-ID: <20140910062602.GB22579@dragon>
References: <1410242851-30765-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410242851-30765-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 08, 2014 at 11:07:25PM -0700, Tim Harvey wrote:
> This series contains several clean-ups for the Gateworks Ventana boards
> already in mainline largely based on conventions that have become standard
> since the patches were originally committed. The final patch also adds
> additional support for GW52xx CANbus that was not there previously but
> depends on the prior patches.
> 
> Tim Harvey (6):
>   ARM: dts: imx: ventana: remove unsupported dt nodes
>   ARM: dts: imx: ventana: remove unused aliases
>   ARM: dts: imx: ventana: use gpio constants
>   ARM: dts: imx: ventana: configure padconf for all pins
>   ARM: dts: imx: ventana: cleanup pinctrl groups
>   ARM: dts: imx: ventana: add canbus support for GW52xx

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
