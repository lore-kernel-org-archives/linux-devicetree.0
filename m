From: Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH 0/3] ARM: dts: stm32: Add display support on stm32f469-disco
Date: Thu, 15 Feb 2018 09:20:11 +0100
Message-ID: <20180215082014.30383-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org

This serie adds the mipi dsi support to stm32f469 and enables it 
on the stm32f469-disco board.

Philippe CORNU (1):
  ARM: dts: stm32: Add display support on stm32f469-disco

Philippe Cornu (2):
  ARM: dts: stm32: Add dt-bindings gpio.h include on stm32f469-disco
  ARM: dts: stm32: Add new stm32f469 dtsi file with mipi dsi

 arch/arm/boot/dts/stm32f469-disco.dts | 54 +++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/stm32f469.dtsi      | 19 ++++++++++++
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/stm32f469.dtsi

-- 
2.15.1
