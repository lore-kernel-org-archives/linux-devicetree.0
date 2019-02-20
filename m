From: Jiada Wang <jiada_wang@mentor.com>
Subject: [PATCH v1 0/2] rsnd: dts: change to use extended audio dmac register
Date: Wed, 20 Feb 2019 14:24:33 +0900
Message-ID: <20190220052435.20508-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, kuninori.morimoto.gx@renesas.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

According to user reference manual for R-CAR H3 and M3-W SoCs,
in order to access busif4 ~ busif7, extended audio dmac registers
(PDMASAREn, PDMADAREn, PDMACHCREn)
need to be used, rather than basic audio dmac registers
(PDMASARn, PDMADARn, PDMACHCRn)

This patch set updates H3 (= r8a7795) and M3-W (= r8a7796) 
to use extended audio dmac registers

Jiada Wang (2):
  arm64: dts: renesas: r8a7795: use extended audio dmac register
  arm64: dts: renesas: r8a7796: use extended audio dmac register

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.19.2
