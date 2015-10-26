From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: sun8i: Add Allwinner A83T dtsi
Date: Mon, 26 Oct 2015 10:21:40 +0800
Message-ID: <CAGb2v65J-meF6AGR9Btjvr5DZtKoeYMi3Hj_e0-N95Z=O1vKHg@mail.gmail.com>
References: <1445557577-27383-1-git-send-email-vishnupatekar0510@gmail.com> <1445557577-27383-3-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1445557577-27383-3-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Linus Walleij <linus.walleij@linaro.org>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 7:46 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:
> Allwinner A83T is new octa-core cortex-a7 SOC.
> This adds the basic dtsi, the clocks differs from
> earlier sun8i SOCs.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 247 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-a83t.dtsi
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> new file mode 100644
> index 0000000..e85995f
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -0,0 +1,247 @@
> +               cpu@100 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <4>;
> +               };
> +
> +               cpu@101 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <5>;
> +               };
> +               cpu@102 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <6>;
> +               };
> +
> +               cpu@103 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <7>;
> +               };

The reg values are still wrong for the second cluster.

ChenYu
