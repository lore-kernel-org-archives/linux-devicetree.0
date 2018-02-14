From: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 14 Feb 2018 16:05:41 +0000
Message-ID: <20180214160541.bm4vwwafla4agavb@localhost.localdomain>
References: <20180214155512.17218-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180214155512.17218-1-ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 03:55:11PM +0000, Charles Keepax wrote:
> Now GPIOD has support for both pdata systems and for non-standard DT
> bindings the Arizona reset GPIO can be converted to use it.
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
> ---

Very sorry I forgot to add this email based these two patches on
v4.16-rc1 since the public mfd for-next branch is still a little
behind and they depend on stuff merged through GPIO in v4.16.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
