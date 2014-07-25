From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 7/8] ARM: dts: add rk3288 evaluation board
Date: Fri, 25 Jul 2014 15:12:01 -0700
Message-ID: <CAD=FV=Xi8Zu-T+fEaigRRTOex2t_Zj7f6inmfWU8WMHfN-MSjA@mail.gmail.com>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
	<1406324980-2450-8-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-8-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Fri, Jul 25, 2014 at 2:49 PM, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> There exist 2 variants using either the act8846 or rk808 as pmic, while the
> rest of the board stays the same.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-evb-act8846.dts | 134 +++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/rk3288-evb-rk808.dts   |  18 +++++
>  arch/arm/boot/dts/rk3288-evb.dtsi        |  74 +++++++++++++++++
>  3 files changed, 226 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3288-evb-act8846.dts
>  create mode 100644 arch/arm/boot/dts/rk3288-evb-rk808.dts
>  create mode 100644 arch/arm/boot/dts/rk3288-evb.dtsi

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
