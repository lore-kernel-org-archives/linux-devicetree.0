From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2][UPDATE] ARM: dts: replace gpio-key,wakeup with
 wakeup-source property
Date: Tue, 13 Oct 2015 20:38:41 +0530
Message-ID: <20151013150841.GZ5386@linux>
References: <1444743164-17735-2-git-send-email-sudeep.holla@arm.com>
 <1444747133-22671-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444747133-22671-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13-10-15, 15:38, Sudeep Holla wrote:
> Keyboard driver for GPIO buttons(gpio-keys) checks for the legacy
> "gpio-key,wakeup" boolean property to enable gpio buttons as wakeup
> source.
> 
> Few dts files assign value "1" to gpio-key,wakeup and in one instance a
> value "0" is assigned probably assuming it won't be enabled as a wakeup
> source. Since the presence of the boolean property indicates it is
> enabled, value of "0" have no value.
> 
> This patch replaces the legacy "gpio-key,wakeup" with the unified
> "wakeup-source" property which inturn fixes the above mentioned issue.
> 
> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/spear1310-evb.dts         | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts         | 2 +-
>  arch/arm/boot/dts/spear320-hmi.dts          | 4 ++--

Reviewed-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
