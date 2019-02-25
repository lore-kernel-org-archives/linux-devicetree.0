From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator: add dummy 2nd port to
 rcar_sound
Date: Mon, 25 Feb 2019 10:49:04 +0100
Message-ID: <CAMuHMdX-U_y7axw9AHYt7Omj5LzE69FTNy6PNUy4TBbxs3CtRA@mail.gmail.com>
References: <20190225093604.25753-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190225093604.25753-1-horms+renesas@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms+renesas@verge.net.au>, rob+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CC DT

On Mon, Feb 25, 2019 at 10:37 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add dummy 2nd port node to rcar_sound ports node to satisfy dtc
> recommendation that #address-cells / #size-cells is only needed.
>
> This addresses the following warning:
>
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>
> This change should not have any run-time effect.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> ---
> Build tested against renesas-devel-20190214-v5.0-rc6
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index a225c2457274..20b35991bc17 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -716,6 +716,15 @@
>                                 capture  = <&ssi1 &src1 &dvc1>;
>                         };
>                 };
> +
> +               /* Dummy node to be overriden by board DT
> +                * Satisfies dtc recommendation that
> +                * #address-cells / #size-cells is only needed
> +                * for graph nodes with multiple child nodes.
> +                */
> +               rsnd_port1: port@1 {
> +                       reg = <1>;
> +               };
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
