From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ARM: dts: gr-peach: Add ETHER pin group
Date: Thu, 5 Oct 2017 11:09:40 +0200
Message-ID: <CAMuHMdWLt9EYp21YiMp7uEGWgjEO_VztbDOyvhr+RxkrAKRYYA@mail.gmail.com>
References: <1507193900-23801-1-git-send-email-jacopo+renesas@jmondi.org> <1507193900-23801-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507193900-23801-4-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Thu, Oct 5, 2017 at 10:58 AM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add pin configuration subnode for ETHER pin group and enable the interface.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
> +++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts

> @@ -88,3 +110,19 @@
>
>         status = "okay";
>  };
> +
> +&ether {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&ether_pins>;
> +
> +       status = "okay";
> +
> +       reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
> +       reset-delay-us = <5>;

I'm afraid the PHY people (not CCed ;-) will want you to move these reset
properties to the phy subnode these days, despite
Documentation/devicetree/bindings/net/mdio.txt...

> +
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
