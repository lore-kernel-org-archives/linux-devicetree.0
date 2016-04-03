From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/16] arm64: dts: add sp804 timer node for Hi6220
Date: Sun, 3 Apr 2016 21:23:42 +0200
Message-ID: <CACRpkdbWuKx6=aF5xW=3EKfuUf-MYM_EEnovyhBnOGVOeHyCmQ@mail.gmail.com>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
	<1459589383-16914-3-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459589383-16914-3-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 2, 2016 at 11:29 AM, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Add sp804 timer for hi6220, so it can be used as broadcast timer.
>
> Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index ad1f1eb..82c4756 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -209,5 +209,14 @@
>                         clock-names = "uartclk", "apb_pclk";
>                         status = "disabled";
>                 };
> +
> +               dual_timer0: dual_timer@f8008000 {
> +                       compatible = "arm,sp804", "arm,primecell";
> +                       reg = <0x0 0xf8008000 0x0 0x1000>;
> +                       interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ao_ctrl 27>;
> +                       clock-names = "apb_pclk";

How can this work? You only give the apb_pclk for clocking the
bus to the timer.

Most platforms using this driver has something like this:

                timer01: timer@10104000 {
                        compatible = "arm,sp804", "arm,primecell";
                        reg = <0x10104000 0x1000>;
                        interrupt-parent = <&intc_dc1176>;
                        interrupts = <0 8 IRQ_TYPE_LEVEL_HIGH>, <0 9
IRQ_TYPE_LEVEL_HIGH>;
                        clocks = <&timclk>, <&timclk>, <&pclk>;
                        clock-names = "timer1", "timer2", "apb_pclk";
                };

It then reads the two clocks in the beginning of clocks() to
determine the frequency of each timer.

By chance the code in the driver will allow just one clock and
will then assume that both the bus to the timer and the timer
itself is clocked from the same clock. But I highly doubt that this
is the case.

Please verify what clocks actually goes into this timer, it should
nominally be three of them.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
