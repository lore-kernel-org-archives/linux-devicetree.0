From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v16 5/5] arm64: dt: hikey: Add optee node
Date: Fri, 10 Mar 2017 16:11:43 +0100
Message-ID: <1489158703-22241-6-git-send-email-jens.wiklander@linaro.org>
References: <1489158703-22241-1-git-send-email-jens.wiklander@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489158703-22241-1-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Nishanth Menon <nm@ti.com>, "Andrew F . Davis" <afd@ti.com>, broonie@kernel.org, scott.branden@broadcom.com, Loic PALLARDY <loic.pallardy@st.com>, Etienne CARRIERE <etienne.carriere@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrice CHOTARD <patrice.chotard@st.com>, Christophe PRIOUZEAU <christophe.priouzeau@st.com>, Eric FINCO <eric.finco@st.com>, Franc
List-Id: devicetree@vger.kernel.org

From: Jerome Forissier <jerome.forissier@linaro.org>

Acked-by: Wei Xu <xuwei5@hisilicon.com>
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index dba3c131c62c..89c15399bec2 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -406,6 +406,13 @@
 			};
 		};
 	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &uart2 {
-- 
2.7.4
