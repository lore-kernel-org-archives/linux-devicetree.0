From: yannick fertre <yannick.fertre@st.com>
Subject: [PATCH v1 3/3] ARM: dts: stm32: add cec support on stm32mp157c-ev1
Date: Tue, 24 Apr 2018 09:54:09 +0200
Message-ID: <1524556449-5262-4-git-send-email-yannick.fertre@st.com>
References: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524556449-5262-1-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Cornu <philippe.cornu@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Gerald Baeza <gerald.baeza@st.com>, Patrice Chotard <patrice.chotard@st.com>, Kamel Kholti <kamel.kholti@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables cec node on stm32mp157c-ev1 board

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 57e6dbc..e2a583b 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -19,3 +19,9 @@
 		serial0 = &uart4;
 	};
 };
+
+&cec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cec_pins_a>;
+	status = "okay";
+};
-- 
1.9.1
