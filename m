From: <dinguyen@opensource.altera.com>
Subject: [PATCH RESEND] Documentation: DT bindings: add doc for Altera's SoCFPGA platform
Date: Mon, 20 Apr 2015 09:55:47 -0500
Message-ID: <1429541747-20479-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: dinh.linux@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Document "altr,socfpga-cyclone5", "altr,socfpga-arria5", and
"altr,socfpga-arria10".

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 Documentation/devicetree/bindings/arm/altera.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/altera.txt

diff --git a/Documentation/devicetree/bindings/arm/altera.txt b/Documentation/devicetree/bindings/arm/altera.txt
new file mode 100644
index 0000000..558735a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera.txt
@@ -0,0 +1,14 @@
+Altera's SoCFPGA platform device tree bindings
+---------------------------------------------
+
+Boards with Cyclone 5 SoC:
+Required root node properties:
+compatible = "altr,socfpga-cyclone5", "altr,socfpga";
+
+Boards with Arria 5 SoC:
+Required root node properties:
+compatible = "altr,socfpga-arria5", "altr,socfpga";
+
+Boards with Arria 10 SoC:
+Required root node properties:
+compatible = "altr,socfpga-arria10", "altr,socfpga";
-- 
2.2.1
