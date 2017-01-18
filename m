From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v14 5/5] arm64: dt: hikey: Add optee node
Date: Wed, 18 Jan 2017 13:58:16 +0100
Message-ID: <1484744296-30003-6-git-send-email-jens.wiklander@linaro.org>
References: <1484744296-30003-1-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484744296-30003-1-git-send-email-jens.wiklander@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, Wei Xu <xuwei5@hisilicon.com>
Cc: valentin.manea@huawei.com, devicetree@vger.kernel.org, javier@javigon.com, emmanuel.michel@st.com, Jerome Forissier <jerome.forissier@linaro.org>, scott.branden@broadcom.com, Nishanth Menon <nm@ti.com>, broonie@kernel.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, jean-michel.delorme@st.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>, Jens Wiklander <jens.wiklander@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Andrew F . Davis" <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jerome Forissier <jerome.forissier@linaro.org>

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
