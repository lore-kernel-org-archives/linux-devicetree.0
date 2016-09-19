From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC 8/8] ARM: dts: sk-rzg1m: initial device tree
Date: Mon, 19 Sep 2016 10:42:53 +0200
Message-ID: <CAMuHMdU8qb8P9p3dHRwSJY4ZUgnEjcdfGfte2naQ+WA3XyEiAA@mail.gmail.com>
References: <3533019.Wim1Kuh1ic@wasted.cogentembedded.com>
 <2097453.1xPZsJcFmC@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2097453.1xPZsJcFmC@wasted.cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 16, 2016 at 3:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the initial device  tree for the R8A7743 SoC based SK-RZG1M board.
> The board has one debug serial port (SCIF0); include support for it, so
> that  the serial  console  can work.
>
> Based on the original (and large) patch by Dmitry Shifrin
> <dmitry.shifrin@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ renesas/arch/arm/boot/dts/r8a7743-sk-rzg1m.dts
> @@ -0,0 +1,44 @@

> +       compatible = "renesas,sk-rzg1m", "renesas,r8a7743";

To be documented in Documentation/devicetree/bindings/arm/shmobile.txt

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
