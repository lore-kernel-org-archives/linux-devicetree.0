From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: condor: add EtherAVB pins
Date: Fri, 9 Mar 2018 13:44:57 +0100
Message-ID: <CAMuHMdVJkRuEvzmAJf2pWd9E+XVgmO122-2mHSgw7Y4aLXdfYA@mail.gmail.com>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
 <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <82c33f37-bfbb-e515-f996-83333cd26171@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Mar 9, 2018 at 1:09 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the (previously omitted) EtherAVB pin data to the Condor board's
> device tree.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

According to the Condor schematics, the KSZ9031RNXVB is wired to
GEther by default. So I guess you are using a modified board?

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -30,6 +30,9 @@
>  };
>
>  &avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +
>         phy-mode = "rgmii-id";
>         phy-handle = <&phy0>;
>         renesas,no-ether-link;
> @@ -50,6 +53,11 @@
>  };
>
>  &pfc {
> +       avb_pins: avb {
> +               groups = "avb_mdio", "avb_rgmii";
> +               function = "avb";
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
