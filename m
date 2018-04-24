From: yannick fertre <yannick.fertre@st.com>
Subject: [PATCH v1 0/3] Enable CEC on stm32mp157c-ev1 board
Date: Tue, 24 Apr 2018 09:54:06 +0200
Message-ID: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This patch-set enables CEC (Consumer Electronics Control) on stm32mp157c
eval board.

yannick fertre (3):
  ARM: dts: stm32: add cec support on stm32mp157c
  ARM: dts: stm32: add cec pins to stm32mp157c
  ARM: dts: stm32: add cec support on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 9 +++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 6 ++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 9 +++++++++
 3 files changed, 24 insertions(+)

-- 
1.9.1
