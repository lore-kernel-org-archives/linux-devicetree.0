From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 0/3] arm64: dts: add Synaptics AS370 SoC support
Date: Fri, 13 Jul 2018 17:17:12 +0800
Message-ID: <20180713171712.05f58a74@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Add initial dtsi file for Synaptics AS370 SoC.

patch1 moves berlin binding to syna.txt.
patch2 add dt-binding for the AS370 SoC.
patch3 add the initial dtsi file for the SoC.

Jisheng Zhang (3):
  dt-bindings: arm: move berlin binding documentation to syna.txt
  dt-bindings: arm: syna: add support for the AS370 SoC
  arm64: dts: synaptics: add dtsi file for Synaptics AS370 SoC

 .../{marvell/marvell,berlin.txt => syna.txt}  |   6 +-
 arch/arm64/boot/dts/synaptics/as370.dtsi      | 177 ++++++++++++++++++
 2 files changed, 182 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/arm/{marvell/marvell,berlin.txt => syna.txt} (94%)
 create mode 100644 arch/arm64/boot/dts/synaptics/as370.dtsi

-- 
2.18.0
