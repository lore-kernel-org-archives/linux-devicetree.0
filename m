From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a77965: Add "reg" properties
Date: Fri, 23 Feb 2018 10:19:21 +0100
Message-ID: <CAMuHMdWGYpeOMJQKcT8=wm1YzQoB+vpK5H99Kg_pJ_HeBUw8Sw@mail.gmail.com>
References: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519326370-15805-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519326370-15805-2-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Thu, Feb 22, 2018 at 8:06 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add "reg" properties to place-holder nodes with unit address defined for
> R-Car M3-N SoC.
>
> This silences the following DTC compiler warning:
> Warning (unit_address_vs_reg): Node /soc/... has a unit name,
> but no reg property
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

A few minor nits below...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi

> @@ -520,130 +521,163 @@
>                 };
>
>                 avb: ethernet@e6800000 {
> +                       reg = <0 0xe6800000 0 0x800>, <0 0xe6a00000 0 0x10000>;

The first reg part would be sufficient for a placeholder.
I think even setting the size to zero would work...

>                 du: display@feb00000 {
> +                       reg = <0 0xfeb00000 0 0x70000>,

Unlike M3-W, the M3-N DU has a third channel, so the size is too small.

> +                             <0 0xfeb90000 0 0x14>;
>                         /* placeholder */

> @@ -703,38 +745,47 @@
>                 };
>
>                 usb2_phy1: usb-phy@ee0a0200 {
> +                       reg = <0 0xee0a0200 0 0x700>;
>                         /* placeholder */
>                 };

To be moved up, next to the other usb2 devices?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
