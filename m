From: Olivier Moysan <olivier.moysan@st.com>
Subject: [Linux-stm32][PATCH 0/4] ARM: dts: stm32: add i2s and sai support on stm32mp157c
Date: Thu, 25 Apr 2019 16:10:36 +0200
Message-ID: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

This patchset adds support of STM32 SAI and I2S on stm32mp157c

Olivier Moysan (4):
  ARM: dts: stm32: add sai support on stm32mp157c
  ARM: dts: stm32: add sai pins muxing on stm32mp157
  ARM: dts: stm32: add i2s support on stm32mp157c
  ARM: dts: stm32: add i2s pins muxing on stm32mp157

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi |  92 +++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 158 ++++++++++++++++++++++++++++++
 2 files changed, 250 insertions(+)

-- 
2.7.4
