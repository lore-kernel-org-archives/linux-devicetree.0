From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/7] arm64: allwinner: h6: Add RTC clock to
 phandle 32kHz external oscillator
Date: Thu, 1 Nov 2018 10:57:58 +0800
Message-ID: <CAGb2v67jZvZx38Y2_k37raQ85D7aCpvmEBqgU_Dqv6qET1VZhg@mail.gmail.com>
References: <20181031183634.29640-1-jagan@amarulasolutions.com> <20181031183634.29640-6-jagan@amarulasolutions.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBROX5HPAKGQECKEBKGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181031183634.29640-6-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 1, 2018 at 2:37 AM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
>
> Outside of SOC few chips need external clock source through RTC example
> Wifi chip. So H6 RTC clock node need to phandle 32kHz external oscillator
> like A64 RTC.
>
> Add support for it.

This should be part of the previous patch.

> prefix rtc- with clock-output-names defined in dt-binding to avoid
> confusion with existing osc32k name.

Unfortunately we have a not so documented requirement that the actual
LOSC be named "osc32k", which is why you see all the previous dtsi files
with RTC clock outputs having the external 32k crystal named "ext-osc32k".

ChenYu

> Signed-off-by: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index c8d2fe76da7e..028ec286aa0a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -271,6 +271,9 @@
>                         reg = <0x7000000 0x400>;
>                         interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> +                       clock-output-names = "rtc-osc32k", "rtc-osc32k-out";
> +                       clocks = <&osc32k>;
> +                       #clock-cells = <1>;
>                 };
>
>                 r_ccu: clock@7010000 {
> --
> 2.18.0.321.gffc6fa0e3
>
