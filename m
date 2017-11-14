From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Tue, 14 Nov 2017 09:44:54 +0100
Message-ID: <CAMuHMdWCj=CjA_zyC1GKr=KEk2CNMAtwvREw25R1uJktZucY4w@mail.gmail.com>
References: <20171110200714.406365231@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171110200714.406365231@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Nov 10, 2017 at 9:02 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the (previously omitted) EtherAVB pin data to the Eagle board's
> device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -34,6 +34,9 @@
>  };
>
>  &avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +
>         renesas,no-ether-link;
>         phy-handle = <&phy0>;
>         status = "okay";
> @@ -53,6 +56,11 @@
>  };
>
>  &pfc {
> +       avb_pins: avb {
> +               groups = "avb0_mdio", "avb0_mii";

Oh no, its'called "avb0_mdio" here, but "avb(0)_mdc" on all other
R-Car Gen3 SoCs?

What about "avb0_link", which is connected through "L_LNK"?

> +               function = "avb0";
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
