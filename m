From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] ARM: dts: renesas: Remove skeleton.dtsi inclusion
Date: Fri, 21 Oct 2016 11:16:05 +0200
Message-ID: <1477041370-22778-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

	Hi Simon, Magnus,

As of commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
as deprecated"), including skeleton.dtsi is deprecated.
Hence this series removes its use for all Renesas 32-bit ARM SoCs.

This fixes the following warning seen with W=1:

    Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: dts: emev2: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7778: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7779: Remove skeleton.dtsi inclusion
  ARM: dts: r8a7740: Remove skeleton.dtsi inclusion
  ARM: dts: sh73a0: Remove skeleton.dtsi inclusion

 arch/arm/boot/dts/emev2.dtsi   | 3 ++-
 arch/arm/boot/dts/r8a7740.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7778.dtsi | 4 ++--
 arch/arm/boot/dts/r8a7779.dtsi | 4 ++--
 arch/arm/boot/dts/sh73a0.dtsi  | 4 ++--
 5 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
