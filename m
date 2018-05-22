From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add GEther support
Date: Tue, 22 May 2018 13:48:06 +0200
Message-ID: <CAMuHMdW9UzOGV_zh3NxugYrj0j0qszX+NFoZtFvZRD9CNMHt+w@mail.gmail.com>
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
 <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, May 18, 2018 at 9:45 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Define the generic R8A77980 part of the GEther device node.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

With the below addressed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -417,6 +417,17 @@
>                         dma-channels = <16>;
>                 };
>
> +               gether: ethernet@e7400000 {
> +                       compatible = "renesas,gether-r8a77980";
> +                       reg = <0 0xe7400000 0 0x1000>;
> +                       interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 813>;
> +                       power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;

resets = <&cpg 813>;

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";

Any default phy-mode needed?

> +               };
> +
>                 mmc0: mmc@ee140000 {
>                         compatible = "renesas,sdhi-r8a77980",
>                                      "renesas,rcar-gen3-sdhi";


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
