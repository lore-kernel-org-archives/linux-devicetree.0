From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 2/7] arm64: dts: hi3660: add L2 cache topology
Date: Mon,  7 Aug 2017 16:13:20 +0800
Message-ID: <20170807081325.11406-3-guodong.xu@linaro.org>
References: <20170807081325.11406-1-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170807081325.11406-1-guodong.xu@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

This patch adds the L2 cache topology on 96boards Hikey960.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 8921310..1cdd03b 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -58,6 +58,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
@@ -66,6 +67,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
@@ -74,6 +76,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
@@ -82,6 +85,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP_0>;
 		};
 
@@ -90,6 +94,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			next-level-cache = <&A73_L2>;
 			cpu-idle-states = <
 					&CPU_NAP
 					&CPU_SLEEP
@@ -102,6 +107,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			next-level-cache = <&A73_L2>;
 			cpu-idle-states = <
 					&CPU_NAP
 					&CPU_SLEEP
@@ -114,6 +120,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			next-level-cache = <&A73_L2>;
 			cpu-idle-states = <
 					&CPU_NAP
 					&CPU_SLEEP
@@ -126,6 +133,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			next-level-cache = <&A73_L2>;
 			cpu-idle-states = <
 					&CPU_NAP
 					&CPU_SLEEP
@@ -171,6 +179,14 @@
 				min-residency-us = <20000>;
 			};
 		};
+
+		A53_L2: l2-cache0 {
+			compatible = "cache";
+		};
+
+		A73_L2: l2-cache1 {
+			compatible = "cache";
+		};
 	};
 
 	gic: interrupt-controller@e82b0000 {
-- 
2.10.2
