From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v13 5/5] arm64: dt: hikey: Add optee node
Date: Fri, 18 Nov 2016 15:51:40 +0100
Message-ID: <1479480700-554-6-git-send-email-jens.wiklander@linaro.org>
References: <1479480700-554-1-git-send-email-jens.wiklander@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479480700-554-1-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, Wei Xu <xuwei5@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, broonie@kernel.org, Jerome Forissier <jerome.forissier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jerome Forissier <jerome.forissier@linaro.org>

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index dba3c13..89c1539 100644
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
1.9.1
