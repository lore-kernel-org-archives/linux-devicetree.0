From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: rskrza1: initial device tree
Date: Mon, 29 Aug 2016 15:34:57 +0200
Message-ID: <CAMuHMdXmJPcgDcLkeVuF5YVfpwxRkJpACHGwtbNab18gK-nBbQ@mail.gmail.com>
References: <20160825153115.15291-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160825153115.15291-1-chris.brandt@renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Aug 25, 2016 at 5:31 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Add the initial device tree for the RZ/A1 based development board (RSK).

Thanks for your patch!

> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts

> +       compatible = "renesas,rskrza1", "renesas,r7s72100";

scripts/checkpatch.pl says:

    DT compatible string "renesas,rskrza1" appears un-documented --
check ./Documentation/devicetree/bindings/

Please send a follow-up patch to add this compatible value to
Documentation/devicetree/bindings/arm/shmobile.txt.

> +&scif2 {
> +       status = "okay";
> +};
> +

Please drop the trailing empty line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
