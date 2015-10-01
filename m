From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: [PATCH 0/4] Enable Ethernet on StiH407 family boards
Date: Thu, 1 Oct 2015 17:56:18 +0200
Message-ID: <1443714982-16251-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, peter.griffin@linaro.org, lee.jones@linaro.org, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: maxime.coquelin@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series enables Ethernet support on STiH407 family reference design
boards.

These boards use the RTL8367 Switch as PHY.
As it is previously configured by the bootloader, we declare it as a fixed
link.

Maxime Coquelin (4):
  ARM: dts: Fix RGMII pinctrl timings
  ARM: dts: Add Ethernet node to STiH407 family
  ARM: dts: Enable Ethernet on STi's B2120 boards
  ARM: dts: Enable Ethernet on STi's B2199 board

 arch/arm/boot/dts/stih407-b2120.dts    |  1 +
 arch/arm/boot/dts/stih407-family.dtsi  | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/stih407-pinctrl.dtsi |  4 ++--
 arch/arm/boot/dts/stih410-b2120.dts    |  1 +
 arch/arm/boot/dts/stih418-b2199.dts    |  8 ++++++++
 arch/arm/boot/dts/stihxxx-b2120.dtsi   |  6 ++++++
 6 files changed, 45 insertions(+), 2 deletions(-)

-- 
1.9.1
