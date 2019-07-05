From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RESEND PATCH next v2 0/6] ARM: keystone: update dt and enable cpts support
Date: Fri, 5 Jul 2019 18:12:41 +0300
Message-ID: <20190705151247.30422-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Santosh,

This series is set of platform changes required to enable NETCP CPTS reference
clock selection and final patch to enable CPTS for Keystone 66AK2E/L/HK SoCs.

Those patches were posted already [1] together with driver's changes, so this
is re-send of DT/platform specific changes only, as driver's changes have
been merged already.

Patches 1-5: CPTS DT nodes update for TI Keystone 2 66AK2HK/E/L SoCs.
Patch 6: enables CPTS for TI Keystone 2 66AK2HK/E/L SoCs.

[1] https://patchwork.kernel.org/cover/10980037/

Grygorii Strashko (6):
  ARM: dts: keystone-clocks: add input fixed clocks
  ARM: dts: k2e-clocks: add input ext. fixed clocks tsipclka/b
  ARM: dts: k2e-netcp: add cpts refclk_mux node
  ARM: dts: k2hk-netcp: add cpts refclk_mux node
  ARM: dts: k2l-netcp: add cpts refclk_mux node
  ARM: configs: keystone: enable cpts

 arch/arm/boot/dts/keystone-clocks.dtsi     | 27 ++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2e-clocks.dtsi | 20 ++++++++++++++++
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi  | 21 +++++++++++++++--
 arch/arm/boot/dts/keystone-k2hk-netcp.dtsi | 20 ++++++++++++++--
 arch/arm/boot/dts/keystone-k2l-netcp.dtsi  | 20 ++++++++++++++--
 arch/arm/configs/keystone_defconfig        |  1 +
 6 files changed, 103 insertions(+), 6 deletions(-)

-- 
2.17.1
