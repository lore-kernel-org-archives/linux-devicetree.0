From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 0/2] ARM: dts: stm32: add spdifrx support on stm32mp157c
Date: Fri, 29 Mar 2019 11:12:43 +0100
Message-ID: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patchset adds support of STM32 SPDFIRX on stm32mp157c

Olivier Moysan (2):
  ARM: dts: stm32: add spdifrx support on stm32mp157c
  ARM: dts: stm32: add spdfirx pins to stm32mp157c

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 13 +++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.7.4
