From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] pinctrl: asm9260: add pinctrl add device tree
 bindings documentation
Date: Tue, 5 May 2015 16:46:25 +0200
Message-ID: <CACRpkdbAipNWY+Vn77x88apchnbjKpCtWPAZU2uHM0ZsEQOjkA@mail.gmail.com>
References: <1428306169.634.51.camel@x220>
	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>
	<1428311043-12012-3-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428311043-12012-3-git-send-email-linux@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 6, 2015 at 11:04 AM, Oleksij Rempel <linux@rempel-privat.de> wrote:

> Add device tree bindings documentation for Alphascale asm9260 pin controller
>
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

(...)
> +* Alphascale ASM9260 SoC pinctrl core driver
> +
> +The pinctrl driver enables Alphascale ASM9260 to configure pin multiplexing
> +to a specific function.
> +
> +Required properties for pinctrl driver:
> +- compatible: "alphascale,asm9260-pinctrl"
> +- reg: Register base of the MPP block and length.
> +- clocks: clock ids.
> +- clock-names:
> +       * 1 "ahb" : AHB gating clock.

This clock is usually called pclock, "apb_pclk" (amba peripheral bus
p clock, don't know what P is...) what name does this have on your
data sheet?

> +The following generic properties as defined in pinctrl-bindings.txt are valid
> +to specify in a pin configuration subnode:
> +pins                   - the list of pins that properties in the node
> +                         apply to (either this or "groups" has to be
> +                         specified)
> +function               - the mux function to select
> +bias-disable           - disable any pin bias
> +bias-pull-up           - pull up the pin. Supported only on GPIO0_* pins.
> +bias-pull-down         - pull down the pin. Supported on all pins except of GPIO0_*.

Generic bindings, nice. Put a reference to the file pinctrl-bindings.txt
to point this out.

Yours,
Linus Walleij
