From: fu.wei@linaro.org
Subject: [PATCH 2/6] ARM64: add SBSA Generic Watchdog device node in foundation-v8.dts
Date: Fri, 15 May 2015 19:08:06 +0800
Message-ID: <1431688090-2145-3-git-send-email-fu.wei@linaro.org>
References: <=fu.wei@linaro.org>
 <1431688090-2145-1-git-send-email-fu.wei@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431688090-2145-1-git-send-email-fu.wei@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Suravee.Suthikulpanit@amd.com, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, hanjun.guo@linaro.org, timur@codeaurora.org, ashwin.chaugule@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, Fu Wei <fu.wei@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Fu Wei <fu.wei@linaro.org>

This can be a example of adding SBSA Generic Watchdog device node
into some dts files for the Soc which contains SBSA Generic Watchdog

Signed-off-by: Fu Wei <fu.wei@linaro.org>
---
 arch/arm64/boot/dts/arm/foundation-v8.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
index 4eac8dc..e3fae16 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dts
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
@@ -237,4 +237,14 @@
 			};
 		};
 	};
+	watchdog0: watchdog@2a450000 {
+		compatible = "arm,sbsa-gwdt";
+		reg = <0x0 0x2a450000 0 0x10000>,
+			<0x0 0x2a440000 0 0x10000>;
+		reg-names = "refresh",
+			"control";
+		interrupts = <0 27 4>;
+		interrupt-names = "ws0";
+		timeout-sec = <10 5>;
+	};
 };
-- 
1.9.1
