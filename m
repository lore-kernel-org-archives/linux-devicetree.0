Return-Path: <SRS0=/m8V=TD=gmail.com=philippe.mathieu.daude@kernel.org>
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11dc70cb-114b-fb40-1b5e-fd71b8ced1af@amsat.org>
Date: Fri, 3 May 2019 16:36:16 +0200
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Jonas,

On 5/2/19 2:26 PM, Jonas Gorski wrote:
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.

I'd have ordered this patch after the #2 of this series, or eventually
squashed both together. It is weird to document an unexistant feature
then implement it, while the opposite looks more natural.
(If you agree, maybe Paul can invert those when applying this series).

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> new file mode 100644
> index 000000000000..3041657e2f96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> @@ -0,0 +1,22 @@
> +Gated Clock Controller Bindings for MIPS based BCM63XX SoCs
> +
> +Required properties:
> +- compatible: must be one of:
> +	 "brcm,bcm3368-clocks"
> +	 "brcm,bcm6328-clocks"
> +	 "brcm,bcm6358-clocks"
> +	 "brcm,bcm6362-clocks"
> +	 "brcm,bcm6368-clocks"
> +	 "brcm,bcm63268-clocks"
> +
> +- reg: Address and length of the register set
> +- #clock-cells: must be <1>
> +
> +
> +Example:
> +
> +clkctl: clock-controller@10000004 {
> +	compatible = "brcm,bcm6328-clocks";
> +	reg = <0x10000004 0x4>;
> +	#clock-cells = <1>;
> +};
> 
