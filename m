From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: power: supply: Max17040: Add low
 level SOC alert threshold
Date: Wed, 29 May 2019 16:40:15 +0200
Message-ID: <CAJKOXPcigVQEzR3xQMcc9hcSXn0VVCvNR+U2F0the62orR98qw@mail.gmail.com>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br> <20190527022258.32748-3-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527022258.32748-3-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 May 2019 at 04:45, Matheus Castello <matheus@castello.eng.br> wrote:
>
> For configure low level state of charge threshold alert signaled from
> max17040 we add "maxim,alert-low-soc-level" property.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  .../power/supply/max17040_battery.txt         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/max17040_battery.txt
>
> diff --git a/Documentation/devicetree/bindings/power/supply/max17040_battery.txt b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
> new file mode 100644
> index 000000000000..a13e8d50ff7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/max17040_battery.txt
> @@ -0,0 +1,28 @@
> +max17040_battery
> +~~~~~~~~~~~~~~~~
> +
> +Required properties :
> + - compatible : "maxim,max17040" or "maxim,max77836-battery"
> +
> +Optional properties :
> +- maxim,alert-low-soc-level :  The alert threshold that sets the state of
> +                               charge level (%) where an interrupt is
> +                               generated. Can be configured from 1 up to 32
> +                               (%). If skipped the power up default value of
> +                               4 (%) will be used.
> +- interrupts :                         Interrupt line see Documentation/devicetree/
> +                               bindings/interrupt-controller/interrupts.txt

Based on driver's behavior, I understand that these two properties
come in pair so maxim,alert-low-soc-level (or its default value) will
be used if and only if interrupts property is present. Maybe mention
this? In general looks fine to me:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> +- wakeup-source :              This device has wakeup capabilities. Use this
> +                               property to use alert low SOC level interrupt
> +                               as wake up source.
> +
> +Example:
> +
> +       battery-fuel-gauge@36 {
> +               compatible = "maxim,max17040";
> +               reg = <0x36>;
> +               maxim,alert-low-soc-level = <10>;
> +               interrupt-parent = <&gpio7>;
> +               interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
> +               wakeup-source;
> +       };
> --
> 2.20.1
>
