From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: add hdmi regulators for exynos5800 based
 peach-pi board
Date: Thu, 26 Jun 2014 09:41:37 +0200
Message-ID: <CABxcv=ncVTiFX+YYguyk0XJDC6WTYnvJeivzf-4wOLwETmzK9w@mail.gmail.com>
References: <1403760382-12533-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1403760382-12533-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, tomasz.figa@gmail.com, sunil joshi <joshi@samsung.com>, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

Hello Rahul,

On Thu, Jun 26, 2014 at 7:26 AM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Adding regulators for HDMI for exynos5800 based Peach-pi board.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> Based on Kukjin's for-next branch.
> Depends on:
> 1) PMIC addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg33166.html
> 2) tps65090 addition to Peach-pi: http://www.spinics.net/lists/linux-samsung-soc/msg32464.html
>
>  arch/arm/boot/dts/exynos5800-peach-pi.dts |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> index 2c2c137..30d1a26 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -127,6 +127,10 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&hdmi_hpd_irq>;
>         ddc = <&i2c_2>;
> +       hdmi-en-supply = <&tps65090_fet7>;
> +       vdd-supply = <&ldo8_reg>;
> +       vdd_osc-supply = <&ldo10_reg>;
> +       vdd_pll-supply = <&ldo8_reg>;

You had a line break between the ddc and the supplies on your patch
for Peach pit, can you please add it here as well?

I think that is more readable and also we may later factor out common
DTS fragments on these two boards in .dtsi include files so is better
to keep the diff as small as possible.

>  };
>
>  &hsi2c_7 {
> --
> 1.7.9.5
>

With that trivial change:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
