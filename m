From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] arm: dts: berlin: enable all dw_wdt nodes
 unconditionally
Date: Wed, 6 Jul 2016 19:58:56 +0200
Message-ID: <577D46E0.7040404@gmail.com>
References: <1467787301-3728-1-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467787301-3728-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06.07.2016 08:41, Jisheng Zhang wrote:
> When we add watchdog dt nodes into berlin dtsi, the dw_wdt driver can't
> support multiple variants, so we have to keep one enabled and others
> disabled. After commit f29a72c24ad4 ("watchdog: dw_wdt: Convert to use
> watchdog infrastructure"), the dw_wdt driver can support multiple
> variants, so we can unconditionally enable all dw_wdt nodes now.
> 
> Jisheng Zhang (3):
>   arm: dts: berlin2: enable all wdt nodes unconditionally
>   arm: dts: berlin2q: enable all wdt nodes unconditionally
>   arm64: dts: berlin4ct: enable all wdt nodes unconditionally

Applied all three to berlin/dt and berlin64/dt respectively.

Thanks!

Sebastian

>  arch/arm/boot/dts/berlin2.dtsi             | 2 --
>  arch/arm/boot/dts/berlin2q.dtsi            | 2 --
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 2 --
>  3 files changed, 6 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
