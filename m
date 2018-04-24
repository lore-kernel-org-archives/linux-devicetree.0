From: yannick fertre <yannick.fertre@st.com>
Subject: [PATCH v1 0/2] Add ltdc & dsi support on stm32mp157c
Date: Tue, 24 Apr 2018 09:54:46 +0200
Message-ID: <1524556488-5404-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This patch-set adds display controller & DSI controller support to 
stm32mp157c SOC.

Version 1:
- Initial commit

yannick fertre (2):
  ARM: dts: stm32: add ltdc support on stm32mp157c
  ARM: dts: stm32: add dsi support on stm32mp157c

 arch/arm/boot/dts/stm32mp157c.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
1.9.1
