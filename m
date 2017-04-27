From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
Date: Thu, 27 Apr 2017 11:56:35 +0200
Message-ID: <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org> <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:
> Add pin configuration subnode for ETHER ethernet controller.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/r7s72100-genmai.dts

> @@ -77,6 +105,19 @@
>         status = "okay";
>  };
>
> +&ether {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&ether_pins>;
> +
> +       status = "okay";
> +
> +       renesas,no-ether-link;
> +       phy-handle = <&phy0>;
> +       phy0: ethernet-phy@0 {
> +               reg = <0>;

Shouldn't the interrupt (connected to P1_15) be described?

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
