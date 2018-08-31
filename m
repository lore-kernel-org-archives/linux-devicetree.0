From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Fri, 31 Aug 2018 10:44:10 +0200
Message-ID: <CAMuHMdUL0Ck=6er8rvx_kCSi7KR9kjBqjNRiLOL41nxeJXQG-w@mail.gmail.com>
References: <1535034166-24798-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535034166-24798-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Biju Das <biju.das@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

On Thu, Aug 23, 2018 at 4:22 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> From: Chris Paterson <chris.paterson2@renesas.com>
>
> Add the device nodes for both RZ/G2M CAN channels.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>
> This patch depends on:
> https://lkml.org/lkml/2018/8/23/1049
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30550.html
>
>
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 5d0109a..cd204f5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -816,6 +816,30 @@
>                         status = "disabled";
>                 };
>
> +               can0: can@e6c30000 {
> +                       compatible = "renesas,can-r8a774a1",
> +                                    "renesas,rzg-gen2-can";

Please don't introduce "renesas,rzg-gen2-can", cfr. my comments in
https://lore.kernel.org/lkml/CAMuHMdWPuqfXOgh_-qp8q6wATU3Lj_WpX0bAOxPBX76SKvyXCQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
