From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: spear: replace gpio-key,wakeup with
 wakeup-source property
Date: Wed, 24 Feb 2016 12:20:35 -0800
Message-ID: <20160224202035.GE10126@localhost>
References: <1454968535-11994-1-git-send-email-sudeep.holla@arm.com>
 <1455032699-3086-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455032699-3086-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2016 at 03:44:59PM +0000, Sudeep Holla wrote:
> Keyboard driver for GPIO buttons(gpio-keys) checks for the legacy
> "gpio-key,wakeup" boolean property to enable gpio buttons as wakeup
> source.
> 
> Few dts files assign value "1" to gpio-key,wakeup which is incorrect.
> Since the presence of the boolean property indicates it is enabled,
> value of "0" or "1" have no significance.
> 
> This patch replaces the legacy "gpio-key,wakeup" with the unified
> "wakeup-source" property which inturn fixes the above mentioned issue.
> 
> Reviewed-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/spear1310-evb.dts | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/spear320-hmi.dts  | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> (this time adding arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org correctly)
> 
> Hi ARM-SoC guys,
> 
> This is the only platform which doesn't have regular pull request,
> Viresh has acked it already. Can you pick this up directly for v4.6 ?

Thanks, applied.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
