From: Jiada Wang <jiada_wang@mentor.com>
Subject: [PATCH v3 0/3] rsnd: dts: change to use extended audio dmac register
Date: Tue, 19 Mar 2019 14:57:02 +0900
Message-ID: <20190319055705.24115-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com, geert@linux-m68k.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

According to user reference manual for R-CAR H3, M3-W and M3-N SoCs,
in order to access busif4 ~ busif7, extended audio dmac registers
(PDMASAREn, PDMADAREn, PDMACHCREn)
need to be used, rather than basic audio dmac registers
(PDMASARn, PDMADARn, PDMACHCRn)

Now DT bindings has stated that extended Audio dmac register set need
to be used when available with patch
https://patchwork.kernel.org/patch/10856905/

This patch set updates H3 (= r8a7795), M3-W (= r8a7796) and M3-N (=r8a77965)
to use extended audio dmac register set.

---
v3: update H3 (= r8a7795), M3-W (= r8a7796) and M3-N (=r8a77965) to point
    point to extended audio dmac register set in DT

v2: update rsnd driver to use extended register set when available
    rename R-CAR E3 audio dmac regisetr

v1: initial version

Jiada Wang (3):
  arm64: dts: renesas: r8a7795: use extended audio dmac register
  arm64: dts: renesas: r8a7796: use extended audio dmac register
  arm64: dts: renesas: r8a77965: use extended audio dmac register

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.19.2
