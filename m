From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 8/9] arm64: dts: hi6220: register debug module
Date: Tue, 23 May 2017 10:29:36 -0600
Message-ID: <CANLsYkwbjT38KhkOLJTBbubnDi4JOsGSK0rVuYuRbs3xsmWj0A@mail.gmail.com>
References: <1495548980-30432-1-git-send-email-leo.yan@linaro.org> <1495548980-30432-9-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495548980-30432-9-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 May 2017 at 08:16, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Bind debug module driver for Hi6220.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Wei and Mark,

I think it makes sense to have this go through the coresight tree
along with the rest of the driver.  Please have a look and let me
know.

Thanks,
Mathieu

> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 1e5129b..21805b9 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -916,5 +916,69 @@
>                                 };
>                         };
>                 };
> +
> +               debug@f6590000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf6590000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu0>;
> +               };
> +
> +               debug@f6592000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf6592000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu1>;
> +               };
> +
> +               debug@f6594000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf6594000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu2>;
> +               };
> +
> +               debug@f6596000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf6596000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu3>;
> +               };
> +
> +               debug@f65d0000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf65d0000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu4>;
> +               };
> +
> +               debug@f65d2000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf65d2000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu5>;
> +               };
> +
> +               debug@f65d4000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf65d4000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu6>;
> +               };
> +
> +               debug@f65d6000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0 0xf65d6000 0 0x1000>;
> +                       clocks = <&sys_ctrl HI6220_DAPB_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&cpu7>;
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
