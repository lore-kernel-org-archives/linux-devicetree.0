From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V4 2/5] clocksource/drivers/sysctr: Add clock-frequency property
Date: Tue, 9 Jul 2019 14:30:53 -0600
Message-ID: <CAL_JsqKeu-b8mbMJBtnNn1vL=RSvUXbo+g40haZnjXTW11CJ6w@mail.gmail.com>
References: <20190701093826.5472-1-Anson.Huang@nxp.com> <20190701093826.5472-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701093826.5472-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Bai Ping <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Carlo Caione <ccaione@baylibre.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 1, 2019 at 3:47 AM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>

'dt-bindings: timer: ...' for the subject.

>
> Systems which use platform driver model for clock driver require the
> clock frequency to be supplied via device tree when system counter
> driver is enabled.

This is a DT binding. What's a platform driver?

>
> This is necessary as in the platform driver model the of_clk operations
> do not work correctly because system counter driver is initialized in
> early phase of system boot up, and clock driver using platform driver
> model is NOT ready at that time, it will cause system counter driver
> initialization failed.
>
> Add clock-frequency property to the device tree bindings of the NXP
> system counter, so the driver can tell timer-of driver to get clock
> frequency from DT directly instead of doing of_clk operations via
> clk APIs.

While you've now given a good explanation why you need this, it all
sounds like linux specific issues and a DT change should not be
necessary.

Presumably, 'clocks' points to a fixed-clock node, right? Just parse
the 'clocks' phandle and fetch the frequency from that node if you
need to get the frequency 'early'.

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change.
> ---
>  .../devicetree/bindings/timer/nxp,sysctr-timer.txt        | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> index d576599..7088a0e 100644
> --- a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> @@ -11,15 +11,18 @@ Required properties:
>  - reg :             Specifies the base physical address and size of the comapre
>                      frame and the counter control, read & compare.
>  - interrupts :      should be the first compare frames' interrupt
> -- clocks :         Specifies the counter clock.
> -- clock-names:             Specifies the clock's name of this module
> +- clocks :          Specifies the counter clock, mutually exclusive with clock-frequency.
> +- clock-names :     Specifies the clock's name of this module, mutually exclusive with
> +                   clock-frequency.
> +- clock-frequency : Specifies system counter clock frequency, mutually exclusive with
> +                   clocks/clock-names.

It doesn't really work to say one or the other is needed unless you
make the OS support both cases.

Rob
