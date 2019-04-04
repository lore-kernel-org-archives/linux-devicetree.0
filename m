From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [RESEND 0/2] nvmem: sunxi-sid: add SID controller support for H6
Date: Thu,  4 Apr 2019 12:57:24 -0400
Message-ID: <20190404165726.13149-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Add SID's support for H6.

Yangtao Li (2):
  nvmem: sunxi_sid: Support SID on H6
  arm64: dts: sunxi: h6: Add device node for SID

 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 5 +++++
 drivers/nvmem/sunxi_sid.c                    | 6 ++++++
 2 files changed, 11 insertions(+)

-- 
2.17.0
