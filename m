From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 3/5] arm64: dts: salvator-x: enable USB 2.0 Host channel 0
Date: Thu, 21 Jul 2016 19:46:59 +0900
Message-ID: <1469098021-7692-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

We have to set SW15 to pin 2-3 side on the board before we use CN9
as USB host or peripheral.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 8c8bfdc..c0e6e8f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -407,6 +407,10 @@
 	status = "okay";
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -415,6 +419,10 @@
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &ohci1 {
 	status = "okay";
 };
-- 
1.9.1
