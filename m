From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH v2 3/4] ARM: dts: stm32: enable USBPHYC on stm32mp157c-ev1
Date: Tue, 24 Apr 2018 11:41:44 +0200
Message-ID: <1524562905-19361-4-git-send-email-amelie.delaunay@st.com>
References: <1524562905-19361-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524562905-19361-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch enables USBPHYC (USB PHY Controller) on stm32mp157c-ev1.
This enables the two usbphyc usb2 ports.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ev1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 57e6dbc..070cdad 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -19,3 +19,8 @@
 		serial0 = &uart4;
 	};
 };
+
+&usbphyc {
+	status = "okay";
+};
+
-- 
2.7.4
