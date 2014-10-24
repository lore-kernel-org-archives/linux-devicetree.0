From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: meson: add device tree bindings documentation
Date: Fri, 24 Oct 2014 13:53:28 +0200
Message-ID: <CACRpkdb4WLX+FeEAuh=YZteaNPzq0WMN0PTTpHnMWmwTts6=Bg@mail.gmail.com>
References: <1412717576-19737-1-git-send-email-b.galvani@gmail.com>
	<1412717576-19737-3-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412717576-19737-3-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Carlo Caione <carlo@caione.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jerry Cao <jerry.cao@amlogic.com>, Victor Wan <victor.wan@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 7, 2014 at 11:32 PM, Beniamino Galvani <b.galvani@gmail.com> wrote:

> Add device tree bindings documentation for Amlogic Meson pinmux and
> GPIO controller.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
(...)
> +Required properties for gpio sub-nodes:
> + - reg: should contain address and size for mux, pull-enable, pull and
> +   gpio register sets
> + - reg-names: an array of strings describing the "reg" entries. Must
> +   contain "mux", "pull" and "gpio". "pull-enable" is optional and
> +   when it is missing the "pull" registers are used instead

So it seems segmenting the registers is done to sort of control the
hardware versioning.

I think it's better to use the compatible string to indicate different
versions of the hardware and then have just have one big
regs to cover all registers.

> +Valid gpio sub-nodes name are:
> + - "banks" for the standard banks
> + - "ao-bank" for the AO bank which belong to the special always-on
> +   power domain

I think it's unnecessary to split up banks, the compatible property
should be enough to know how many banks this controller has
and where they are located in relation to the base offset.

> +Required properties for configuration nodes:
> + - pins: the name of a pin group. The list of all available groups can
> +   be found in driver sources.
> + - function: the name of a function to activate for the specified set
> +   of groups. The list of all available functions can be found in
> +   driver sources.

This is interesting. I have established that for controllers mapping
functions to groups we use
"function" and "groups".

So for per-pin configuration, "function" and "pins" would be
apropriate.

Yours,
Linus Walleij
