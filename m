From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH 0/6] Zap SCIF2 DMA configuration in R-Car Gen3 DTS
Date: Sat,  4 May 2019 02:42:52 +0200
Message-ID: <20190504004258.23574-1-erosca@de.adit-jv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "George G . Davis" <george_davis@mentor.com>, Andy Lowe <andy_lowe@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
List-Id: devicetree@vger.kernel.org

This series is triggered by a regression on M3 targets caused by
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=703db5d1b175
("arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"), when applied
on top of rcar-3.9.x Renesas official kernel.

This collection of patches attempts to consistently propagate the fix
across the existing R-Car3 DTS. Full story is placed into
commit ("Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"").

While debugging drivers/tty/serial/sh-sci.c, a minor update avoiding
__ptrval__ in dev_dbg() is included here as well.

Tested using v5.1-rc7-131-gea9866793d1e on:
 - H3-ES2.0-ULCB
 - M3N-ES1.1-ULCB
 - M3-ES1.1-Salvator-XS

Eugeniu Rosca (6):
  serial: sh-sci: Reveal ptrval in dev_dbg
  Revert "arm64: dts: renesas: r8a7796: Enable DMA for SCIF2"
  arm64: dts: renesas: r8a7795: zap dma configuration in scif2
  Revert "arm64: dts: renesas: r8a77965: Enable DMA for SCIF2"
  Revert "arm64: dts: renesas: r8a77990: Enable DMA for SCIF2"
  Revert "arm64: dts: renesas: r8a77995: add DMA for SCIF2"

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 3 ---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 3 ---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 3 ---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 +---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 3 ---
 drivers/tty/serial/sh-sci.c               | 8 ++++----
 6 files changed, 5 insertions(+), 19 deletions(-)

-- 
2.21.0
