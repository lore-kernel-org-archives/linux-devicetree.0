From: Bich HEMON <bich.hemon@st.com>
Subject: [PATCH 0/3] CAN fix for stm32mp157c
Date: Thu, 15 Nov 2018 08:52:28 +0000
Message-ID: <1542271942-28130-1-git-send-email-bich.hemon@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

This patchset changes the CAN RAM mapping and adds CAN sleep pins.

Bich Hemon (3):
  ARM: dts: stm32: change CAN RAM mapping on stm32mp157c
  ARM: dts: stm32: add can1 sleep pins muxing
  ARM: dts: stm32: add can1 sleep pins muxing on stm32mp157c-ev1 board

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 7 +++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 3 ++-
 arch/arm/boot/dts/stm32mp157c.dtsi        | 4 ++--
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
1.9.1
