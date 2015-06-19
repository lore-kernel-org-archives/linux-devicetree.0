From: Nicolae Rosia <nicolae.rosia@gmail.com>
Subject: Re: [PATCH v2 6/8] ARM: dts: imx: add imx6ul and imx6ul evk board support
Date: Fri, 19 Jun 2015 20:05:22 +0300
Message-ID: <CAH=tA9G_x=6wNTOWbOc2FGGARTxioikUSwqyENKk74wL=7uzaw@mail.gmail.com>
References: <1434727951-4852-1-git-send-email-Frank.Li@freescale.com>
	<1434727951-4852-7-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1434727951-4852-7-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Frank Li <Frank.Li@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Anson Huang <b20788@freescale.com>, Fugang Duan <B38611@freescale.com>, Fancy Fang <chen.fang@freescale.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jun 19, 2015 at 6:32 PM,  <Frank.Li@freescale.com> wrote:
> From: Frank Li <Frank.Li@freescale.com>
[...]
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       compatible = "arm,cortex-a7";
> +                       device_type = "cpu";
> +                       reg = <0>;
> +                       clock-latency = <61036>; /* two CLK32 periods */
> +                       operating-points = <
> +                               /* kHz  uV */
> +                               528000  1250000
> +                               396000  1150000
> +                               198000  1150000
> +                       >;
> +                       fsl,soc-operating-points = <
> +                               /* KHz  uV */
> +                               528000  1250000
> +                               396000  1150000
> +                               198000  1150000
> +                       >;
Why is this necessary? Can't you adapt the driver to use operating-points?
I have looked through other imx dts and saw that some had different
values in these two tables.

Best regards,
Nicolae Rosia
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
