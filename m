From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: pxa: fix the rtc controller
Date: Tue, 26 Jun 2018 12:22:54 -0600
Message-ID: <CAL_JsqLo5ntGLLZzssCJo7g--WWvgZLkX0vTV0VOT7a5H0QLFg@mail.gmail.com>
References: <20180626164701.1034-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626164701.1034-1-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 10:47 AM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> The RTC controller is fed by an external fixed 32kHz clock. Yet the
> driver wants to acquire this clock, even though it doesn't make any use
> of it, ie. doesn't get the rate to make calculation.
>
> Therefore, add the dummy clock in the PXA clock tree to make the driver
> happy and working.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  arch/arm/boot/dts/pxa25x.dtsi | 4 ++++
>  arch/arm/boot/dts/pxa27x.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/pxa25x.dtsi b/arch/arm/boot/dts/pxa25x.dtsi
> index 95d59be97213..c6ca07e4626b 100644
> --- a/arch/arm/boot/dts/pxa25x.dtsi
> +++ b/arch/arm/boot/dts/pxa25x.dtsi
> @@ -80,6 +80,10 @@
>                         #pwm-cells = <1>;
>                         clocks = <&clks CLK_PWM1>;
>                 };
> +
> +               rtc@40900000 {
> +                       clocks = <&clks CLK_NONE>;

Don't add fake clocks. Either add a real clock or fix the driver to
not require a clock.

Rob
