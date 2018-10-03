From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/3] ARM: dts: stm32: don't use timers dmas on stm32mp157c-ed1
Date: Wed, 3 Oct 2018 17:11:04 +0200
Message-ID: <1538579465-7854-3-git-send-email-fabrice.gasnier@st.com>
References: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.torgue@st.com
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Spare dmas when using timer6 on stm32mp157c-ed1.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index f77bea4..c3ecb1e 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -72,6 +72,9 @@
 
 &timers6 {
 	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	timer@5 {
 		status = "okay";
 	};
-- 
1.9.1
