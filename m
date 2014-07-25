From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/7] ARM: rockchip: clarify usability of
 DEBUG_RK3X_UART debug_ll options
Date: Thu, 24 Jul 2014 20:49:50 -0700
Message-ID: <CAD=FV=XUgBkcO6J4gUaV+EV6hU0f+qgbUTZ5+y+9ostM7Z7Wzw@mail.gmail.com>
References: <4868343.UFgjaXesOn@diego>
	<1722917.h37akzFaqW@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1722917.h37akzFaqW@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Thu, Jul 17, 2014 at 5:19 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> The debug uart settings from the DEBUG_RK3X_UART options are usable o=
n
> all Rockchip SoCs from the rk30xx and rk31xx series but not on the
> new rk3288 SoCs. Thus clarify their use to prevent confusion.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, this helps.

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
