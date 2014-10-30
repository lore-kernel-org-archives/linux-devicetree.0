From: Johannes Pointner <johannes.pointner@gmail.com>
Subject: Re: [PATCH v3 2/2] dt: bindings: tps65217: add compatible property
 for backlight subnode
Date: Thu, 30 Oct 2014 07:43:02 +0100
Message-ID: <CAJKbBDDPU5mysMPB78oQtkH8B=2q1pSH0yJBxu_qr3Zo=xhx3Q@mail.gmail.com>
References: <4202809.cQlU8Tr5kS@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4202809.cQlU8Tr5kS@lenovobook>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ping

2014-10-08 23:20 GMT+02:00 Johannes Pointner <johannes.pointner@gmail.com>:
> Add documentation for compatible property of backlight subnode.
>
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ---
> Changes since v2:
> 1. Removed the pmic part of the patch.
> 2. Added newline before subnode in the example.
> ---
>  .../devicetree/bindings/video/backlight/tps65217-backlight.txt | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
> index 5fb9279..63ef699 100644
> --- a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
> +++ b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
> @@ -6,19 +6,23 @@ used to drive LEDs for use as backlights.
>  Required properties:
>  - compatible: "ti,tps65217"
>  - reg: I2C slave address
> -- backlight: node for specifying WLED1 and WLED2 lines in TPS65217
> +- backlight: subnode for specifying WLED1 and WLED2 lines in TPS65217
> +
> +Required subnode properties:
> +- compatible: "ti,tps65217-bl"
>  - isel: selection bit, valid values: 1 for ISEL1 (low-level) and 2 for ISEL2 (high-level)
>  - fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
>  - default-brightness: valid values: 0-100
>
> -Each regulator is defined using the standard binding for regulators.
>
>  Example:
>
>         tps: tps@24 {
>                 reg = <0x24>;
>                 compatible = "ti,tps65217";
> -               backlight {
> +
> +               tps_bl: backlight {
> +                       compatible = "ti,tps65217-bl";
>                         isel = <1>;  /* 1 - ISET1, 2 ISET2 */
>                         fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
>                         default-brightness = <50>;
> --
> 2.1.2
