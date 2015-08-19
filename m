From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: correct regulator power states
 for suspend
Date: Thu, 20 Aug 2015 01:36:46 +0200
Message-ID: <CABxcv=mpz7yJFiR=1NQxsbmbVCVGYpgZYS1rEWi58aSUQaELcw@mail.gmail.com>
References: <1440022721-73712-1-git-send-email-briannorris@chromium.org>
	<1440022721-73712-3-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440022721-73712-3-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Brian,

On Thu, Aug 20, 2015 at 12:18 AM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> When getting translated from a downstream device tree that used slightly
> different DT bindings, these regulators got labeled with the
> "on-in-suspend" state, when they were actually supposed to be turned off
> for S3 suspend. This was harmless, but not intentional, AFAICT.
>
> Let's turn them off to get the optimal power state.
>
> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> New in v2. Tested jaq.
>
>  arch/arm/boot/dts/rk3288-veyron-jerry.dts  | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-pinky.dts  | 2 +-
>  arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
