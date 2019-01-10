From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v3 3/4] ARM: dts: dps650ab: add power supply
Date: Thu, 10 Jan 2019 10:29:13 +0800
Message-ID: <a7b5fa54198e7fd0def33de3e7db36239a2e3da7.1546918172.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@roeck-us.net
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com, Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

Add Delta Electronics power supply DPS-650-AB.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v3:
  Modify patch subject and commit message.
  Add delta to compatible property.
---
v2:
  No change.
---
 arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
index bdfd8c9f3a7c..521afbea2c5b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
@@ -173,6 +173,16 @@
 			};
 		};
 	};
+
+	dps650ab@58 {
+		compatible = "delta,dps650ab";
+		reg = <0x58>;
+	};
+
+	dps650ab@59 {
+		compatible = "delta,dps650ab";
+		reg = <0x59>;
+	};
 };
 
 &i2c9 {
-- 
1.8.3.1
