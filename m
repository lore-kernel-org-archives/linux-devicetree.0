From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 3/4] dt-bindings: pps: pps-gpio PPS ECHO implementation
Date: Mon, 26 Nov 2018 13:42:20 -0600
Message-ID: <CAL_JsqJ6fM3+pcC3b-eXEex=j_ft6Z=vukhLK9wULfWJqOTN-A@mail.gmail.com>
References: <20181122094602.5156-1-tom@aussec.com> <20181122094602.5156-2-tom@aussec.com>
 <20181122094602.5156-3-tom@aussec.com> <20181122094602.5156-4-tom@aussec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122094602.5156-4-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Burkart <tom@aussec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, lukas@fridolin.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2018 at 3:49 AM Tom Burkart <tom@aussec.com> wrote:
>
> This patch implements the device tree changes required for the pps
> echo functionality for pps-gpio, that sysfs claims is available
> already.
>
> This patch was originally written by Lukas Senger as part of a masters
> thesis project and modified for inclusion into the linux kernel by Tom
> Burkart.
>
> Signed-off-by: Lukas Senger <lukas@fridolin.com>
> Signed-off-by: Tom Burkart <tom@aussec.com>
> ---
>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
> index 1155d49c2699..e09f6f2405c5 100644
> --- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
> @@ -7,10 +7,15 @@ Required properties:
>  - compatible: should be "pps-gpio"
>  - gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
>
> +Additional required properties for the PPS ECHO functionality:
> +- echo-gpios: one PPS ECHO GPIO in the format described by ../gpio/gpio.txt
> +- echo-active-ms: duration in ms of the active portion of the echo pulse
> +
>  Optional properties:
>  - assert-falling-edge: when present, assert is indicated by a falling edge
>                         (instead of by a rising edge)
>  - capture-clear: when present, also capture the PPS clear event
> +- invert-pps-echo: when present, invert the PPS ECHO pulse

Why do you need this? Can't you just make the echo gpio GPIO_ACTIVE_LOW?

BTW, using the flag probably should have been done for
'assert-falling-edge' as well.

Rob
