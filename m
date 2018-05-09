From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] ARM: dts: renesas: Add PMU device nodes
Date: Wed, 9 May 2018 16:39:19 +0200
Message-ID: <CAMuHMdWLoQ+SnD29NLbmVWt3z3YJf-4BGsUx9Yog8VQg3r4J=Q@mail.gmail.com>
References: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525701427-12914-1-git-send-email-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 7, 2018 at 3:56 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series enables support for the ARM Performance Monitor Units
> in Cortex-A7, Cortex-A9, and Cortex-A15 CPU cores on Renesas RZ/A1,
> R-Car Gen2, and RZ/G1 SoCs.  This allows for better performance analysis
> using the "perf" tool.

[...]

> This has been tested on r8a7791/koelsch, and boot-tested on
> r7s72100/genmai, r8a7790/lager, r8a7792/blanche, and r8a7794/silk.

... and r8a7793/gose and r8a7794/alt.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
