From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: Add Pistachio SoC pin control binding document
Date: Fri, 6 Mar 2015 12:37:09 +0100
Message-ID: <CACRpkdbCavYLk-Uo8hjTrGcGLJe6NEB9dVPVNm_fyd3eGccnEw@mail.gmail.com>
References: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
	<1424744104-14151-2-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424744104-14151-2-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 24, 2015 at 3:15 AM, Andrew Bresticker
<abrestic@chromium.org> wrote:

> Add a device-tree binding document for the pin controller present
> on the IMG Pistachio SoC.
>
> Signed-off-by: Damien Horsley <Damien.Horsley@imgtec.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
(...)
> +Note that the GPIO bank sub-nodes *must* be listed in order.

Usually we use aliases to mark the order of things. e.g.:

        aliases {
                gpio0 = &gpio0;
                gpio1 = &gpio1;
                gpio2 = &gpio2;
                ethernet0 = &eth0;
                ethernet1 = &eth1;
        };

(arch/arm/boot/dts/armada-375.dtsi)

> +Required properties for pin configuration sub-nodes:
> +----------------------------------------------------
> + - pins: List of pins to which the configuration applies. See below for a
> +   list of possible pins.
> +
> +Optional properties for pin configuration sub-nodes:
> +----------------------------------------------------
> + - function: Mux function for the specified pins. This is not applicable for
> +   non-MFIO pins. See below for a list of valid functions for each pin.
> + - bias-high-impedance: Enable high-impedance mode.
> + - bias-pull-up: Enable weak pull-up.
> + - bias-pull-down: Enable weak pull-down.
> + - bias-bus-hold: Enable bus-keeper mode.
> + - drive-strength: Drive strength in mA. Supported values: 2, 4, 8, 12.
> + - input-schmitt-enable: Enable Schmitt trigger.
> + - input-schmitt-disable: Disable Schmitt trigger.
> + - slew-rate: Slew rate control. 0 for slow, 1 for fast.

We actually haven't specified that function+pins is a valid pattern,
a lot of drivers just started doing that :(

function+groups is documented for muxing.

group + config opts is documented for config.

Please consider patching the generic bindings to reflect this
mux use of pins... We need to discuss it.

Yours,
Linus Walleij
