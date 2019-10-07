From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 3/4] ARM: dts: stm32: remove usb phy-names entries on stm32mp157c-ev1
Date: Mon, 7 Oct 2019 16:34:01 +0200
Message-ID: <20191007143402.13266-4-alexandre.torgue@st.com>
References: <20191007143402.13266-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007143402.13266-1-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

"phy-names" entries are not used. To be compliant with DT validation
tool, those entries have to be remove.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
index 6287db532e7d..2baae5f25e2c 100644
--- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
@@ -343,14 +343,12 @@
 
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
 &usbotg_hs {
 	dr_mode = "peripheral";
 	phys = <&usbphyc_port1 0>;
-	phy-names = "usb2-phy";
 	status = "okay";
 };
 
-- 
2.17.1
