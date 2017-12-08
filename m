From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm64: allwinner: axp803: Add drivevbus regulator
Date: Fri, 8 Dec 2017 10:52:11 +0800
Message-ID: <CAGb2v671Gra_Fq3Oa96zsQVeABxu0VKRyzVsiba93s5j+WqboA@mail.gmail.com>
References: <1512673460-7865-1-git-send-email-jagan@amarulasolutions.com> <1512673460-7865-2-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512673460-7865-2-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 3:04 AM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add reg_drivevbus regualtor for boards which are using
> external regulator to drive the OTG VBus through N_VBUSEN
> PMIC pin.
>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - New patch
>
>  arch/arm64/boot/dts/allwinner/axp803.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
> index ff8af52..e5eae8b 100644
> --- a/arch/arm64/boot/dts/allwinner/axp803.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
> @@ -146,5 +146,10 @@
>                         regulator-max-microvolt = <3000000>;
>                         regulator-name = "rtc-ldo";
>                 };
> +
> +               reg_drivevbus: drivevbus {

Could you keep the nodes in alphabetical order please?

Thanks
ChenYu

> +                       regulator-name = "drivevbus";
> +                       status = "disabled";
> +               };
>         };
>  };
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
