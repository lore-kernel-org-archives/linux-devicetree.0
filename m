From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 3/4] arm/versatile: Add the uart as the stdout device.
Date: Wed, 18 Jun 2014 21:54:33 +0100
Message-ID: <1403124874-19929-4-git-send-email-grant.likely@linaro.org>
References: <1403124874-19929-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403124874-19929-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, olof@lixom.net, benh@kernel.crashing.org
Cc: Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Add a stdout-path property to the Versatile devicetree so that automatic
console selection works without needing a console= line on the kernel
command line.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 arch/arm/boot/dts/versatile-ab.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
index e01e5a081def..88e94c5506a1 100644
--- a/arch/arm/boot/dts/versatile-ab.dts
+++ b/arch/arm/boot/dts/versatile-ab.dts
@@ -15,6 +15,10 @@
 		i2c0 = &i2c0;
 	};
 
+	chosen {
+		stdout-path = &uart0;
+	};
+
 	memory {
 		reg = <0x0 0x08000000>;
 	};
-- 
1.9.1
