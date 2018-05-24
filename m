From: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 0/3] Dts nodes for Keystone2 hw_rng driver
Date: Thu, 24 May 2018 09:12:15 -0400
Message-ID: <1527167538-29837-1-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ssantosh@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: vitalya@ti.com, m-karicheri2@ti.com
List-Id: devicetree@vger.kernel.org

This series adds dts nodes for Keystone2 hw_rng driver

Vitaly Andrianov (3):
  ARM: dts: k2hk: add dts node for k2hk hw_rng driver
  ARM: dts: k2l: add dts node for k2l hw_rng driver
  ARM: dts: k2e: add dts node for k2e hw_rng driver

 arch/arm/boot/dts/keystone-k2e-netcp.dtsi  | 20 ++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi | 20 ++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi  | 20 ++++++++++++++++++++
 3 files changed, 60 insertions(+)

-- 
2.7.4
