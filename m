From: megous@megous.com
Subject: [PATCH 0/6] Add ethernet support for Orange Pi 3
Date: Tue, 20 Aug 2019 16:53:37 +0200
Message-ID: <20190820145343.29108-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Ondrej Jirman <megous@megous.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This series implements ethernet support for Xunlong Orange Pi 3 board, by:

- making small cleanups of existing dwmac-sun8i code
- adding DT bindings docummentation
- adding support for phy-io-supply to dwmac-sun8i code
- adding DT configuration for Orange Pi 3 board

For some people, ethernet doesn't work after reboot because u-boot doesn't
support AXP805 PMIC, and will not turn off the etherent PHY regulators.
So the regulator controlled by gpio will be shut down, but the other one
controlled by the AXP PMIC will not.

This is a problem only when running with a builtin driver. This needs
to be fixed in u-boot and should not prevent these patches from being
merged.

This evolved out of the Orange Pi 3 patches series, as I didn't want
to stretch that out any longer.

Please take a look.

thank you and regards,
  Ondrej Jirman

Ondrej Jirman (6):
  dt-bindings: net: sun8i-a83t-emac: Add phy-supply property
  dt-bindings: net: sun8i-a83t-emac: Add phy-io-supply property
  net: stmmac: sun8i: Use devm_regulator_get for PHY regulator
  net: stmmac: sun8i: Rename PHY regulator variable to regulator_phy
  net: stmmac: sun8i: Add support for enabling a regulator for PHY I/O
    pins
  arm64: dts: allwinner: orange-pi-3: Enable ethernet

 .../net/allwinner,sun8i-a83t-emac.yaml        |  8 ++
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 40 ++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 74 ++++++++++++-------
 3 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.22.1
