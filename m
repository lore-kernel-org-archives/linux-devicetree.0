From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH 0/2] Enable the I2C nodes for Allwinner H6 CPU
Date: Sun, 11 Aug 2019 14:35:01 +0530
Message-ID: <20190811090503.32396-1-bshah@kde.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhushan Shah <bshah@kde.org>
List-Id: devicetree@vger.kernel.org

This patch series adds device-tree nodes for i2c nodes in the H6 dtsi,
and enables it for the Pine H64.

Bhushan Shah (2):
  arm64: allwinner: h6: add I2C nodes
  arm64: allwinner: h6: enable i2c0 in PineH64

 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 54 +++++++++++++++++++
 2 files changed, 58 insertions(+)

-- 
2.17.1
