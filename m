From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/9] RZ/G2E basic device tree
Date: Fri, 14 Dec 2018 09:10:04 +0000
Message-ID: <1544778613-24279-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Dear All,

this series adds a basic dtsi for the RZ/G2E (a.k.a. r8a774c0).

Thanks,
Fab

Fabrizio Castro (9):
  arm64: dts: renesas: Initial device tree for r8a774c0
  arm64: dts: renesas: r8a774c0: Add SYS-DMAC controller nodes
  arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes
  arm64: dts: renesas: r8a774c0: Add INTC-EX device node
  arm64: dts: renesas: r8a774c0: Add PFC support
  arm64: dts: renesas: r8a774c0: Add GPIO device nodes
  arm64: dts: renesas: r8a774c0: Add Ethernet AVB node
  arm64: dts: renesas: r8a774c0: Add watchdog support
  arm64: dts: renesas: r8a774c0: Add secondary CA53 CPU core

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 649 ++++++++++++++++++++++++++++++
 1 file changed, 649 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0.dtsi

-- 
2.7.4
