From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/3] ARM: dts: aspeed: swift: Change power supplies to version 2
Date: Fri, 30 Aug 2019 11:09:44 -0500
Message-ID: <1567181385-22129-3-git-send-email-eajames@linux.ibm.com>
References: <1567181385-22129-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567181385-22129-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux@roeck-us.net, andrew@aj.id.au, joel@jms.id.au, mark.rutland@arm.com, robh+dt@kernel.org, jdelvare@suse.com, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Swift power supplies are version 2 of the IBM CFFPS. Make it so in the
devicetree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index f14f745..815b865 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -494,7 +494,7 @@
 	};
 
 	power-supply@68 {
-		compatible = "ibm,cffps1";
+		compatible = "ibm,cffps2";
 		reg = <0x68>;
 	};
 
@@ -504,7 +504,7 @@
 	};
 
 	power-supply@69 {
-		compatible = "ibm,cffps1";
+		compatible = "ibm,cffps2";
 		reg = <0x69>;
 	};
 
-- 
1.8.3.1
