From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH v3 3/8] arm64: dts: Fix the base address of the Broadcom iProc mdio mux
Date: Wed,  1 Aug 2018 10:56:21 -0700
Message-ID: <1533146186-8374-4-git-send-email-arun.parameswaran@broadcom.com>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Modify the base address of the mdio mux driver to point to the
start of the mdio mux block's register address space.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi    | 4 ++--
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 4057197..1a406a7 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -482,9 +482,9 @@
 			status = "disabled";
 		};
 
-		mdio_mux_iproc: mdio-mux@6602023c {
+		mdio_mux_iproc: mdio-mux@66020000 {
 			compatible = "brcm,mdio-mux-iproc";
-			reg = <0x6602023c 0x14>;
+			reg = <0x66020000 0x250>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index b203152..a70e8dd 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -278,9 +278,9 @@
 
 		#include "stingray-pinctrl.dtsi"
 
-		mdio_mux_iproc: mdio-mux@2023c {
+		mdio_mux_iproc: mdio-mux@20000 {
 			compatible = "brcm,mdio-mux-iproc";
-			reg = <0x0002023c 0x14>;
+			reg = <0x00020000 0x250>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
1.9.1
