From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mrvl,mmp-timer: add clock
Date: Mon, 10 Sep 2018 10:21:50 -0500
Message-ID: <CAL_JsqKgJFZnpuv7rW6ovxMKi4Q2AngWxKa=CMR_Y+xD5Oh3GA@mail.gmail.com>
References: <20180910113031.42634-1-lkundrak@v3.sk> <20180910113031.42634-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910113031.42634-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: lkundrak@v3.sk
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 6:30 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
>
> The timer needs the timer clock to be enabled, otherwise it stops
> ticking.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
> index 9a6e251462e7..a2ede0bd12ca 100644
> --- a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
> @@ -4,10 +4,12 @@ Required properties:
>  - compatible : Should be "mrvl,mmp-timer".
>  - reg : Address and length of the register set of timer controller.
>  - interrupts : Should be the interrupt number.
> +- clocks : Should contain a single entry describing the clock input.

So now pxa910 and pxa168 dts files have errors because they are
missing a required clock. Plus somehow other MMP2 platforms either
worked without a clock or have been broken.

You can't add new required properties to a binding. That breaks
backward compatibility.

Rob
>
>  Example:
>         timer0: timer@d4014000 {
>                 compatible = "mrvl,mmp-timer";
>                 reg = <0xd4014000 0x100>;
>                 interrupts = <13>;
> +               clocks = <&coreclk 2>;
>         };
> --
> 2.17.1
>
