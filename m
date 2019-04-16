From: Patrick Venture <venture@google.com>
Subject: [PATCH 1/3] ARM: dts: aspeed: zaius: add Infineon and Intersil regulators
Date: Tue, 16 Apr 2019 09:21:49 -0700
Message-ID: <20190416162150.150154-2-venture@google.com>
References: <20190416162150.150154-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416162150.150154-1-venture@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: venture@google.com, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au
Cc: Maxim Sloyko <maxims@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Robert Lippert <rlippert@google.com>
List-Id: devicetree@vger.kernel.org

From: Maxim Sloyko <maxims@google.com>

Add the nodes for the ir38064 and isl68137 devices on the Zaius board.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 2c5aa90a546d7..63e892f16d050 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -296,6 +296,32 @@
 				reg = <0x54>;
 			};
 		};
+
+	};
+
+	vrm@64 {
+		compatible = "isil,isl68137";
+		reg = <0x64>;
+	};
+
+	vrm@40 {
+		compatible = "isil,isl68137";
+		reg = <0x40>;
+	};
+
+	vrm@60 {
+		compatible = "isil,isl68137";
+		reg = <0x60>;
+	};
+
+	vrm@43 {
+		compatible = "infineon,ir38064";
+		reg = <0x43>;
+	};
+
+	vrm@41 {
+		compatible = "isil,isl68137";
+		reg = <0x41>;
 	};
 
 	/* Master selector PCA9541A @70h (other master: CPU0)
@@ -311,18 +337,47 @@
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
 	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
 	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
-	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
+	/* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
 	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
+	/* Master selector PCA9541A @70h (other master: CPU0)
+	 *   LM5066I PMBUS @10h
+	 */
+	/* 12V SMPS Q54SH12050NNDH @61h */
 };
 
 &i2c8 {
 	status = "okay";
 
-	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
-	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
-	/* CPU1 VR ISL68137 0.8V PMBUS @61h */
+	vrm@64 {
+		compatible = "isil,isl68137";
+		reg = <0x64>;
+	};
+
+	vrm@40 {
+		compatible = "isil,isl68137";
+		reg = <0x40>;
+	};
+
+	vrm@41 {
+		compatible = "isil,isl68137";
+		reg = <0x41>;
+	};
+
+	vrm@42 {
+		compatible = "infineon,ir38064";
+		reg = <0x42>;
+	};
+
+	vrm@60 {
+		compatible = "isil,isl68137";
+		reg = <0x60>;
+	};
+
+	/* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
+	/* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
+	/* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
 	/* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
-	/* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
+	/* CPU1 VR ISL68137 0.8V PMBUS @60h */
 };
 
 
-- 
2.21.0.392.gf8f6787159e-goog
