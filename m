From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v2 1/2] arm64: dts: hikey: extend default cma size to 128MB
Date: Thu, 25 Aug 2016 11:00:40 +0800
Message-ID: <1472094041-5357-1-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, rob.herring@linaro.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, xinliang.liu@linaro.org, linux-kernel@vger.kernel.org, jh80.chung@samsung.com, john.stultz@linaro.org, fathi.boudra@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

To support display in Debian on HiKey, cma heap is used to allocate
graphic buffers. The default size of CMA is 16 MB which is not enough.

Increase the default CMA size to 128 MB.

cc: Fathi Boudra <fathi.boudra@linaro.org>
cc: John Stultz <john.stultz@linaro.org>
cc: Xinliang Liu <xinliang.liu@linaro.org>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 9e4e06a..dba3c13 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -57,8 +57,15 @@
 			console-size	= <0x00020000>;
 			ftrace-size	= <0x00020000>;
 		};
-	};
 
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00000000 0x08000000>;
+			linux,cma-default;
+		};
+	};
 
 	reboot-mode-syscon@5f01000 {
 		compatible = "syscon", "simple-mfd";
-- 
1.9.1
