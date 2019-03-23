From: qiaozhou <qiaozhou@asrmicro.com>
Subject: [PATCH 1/7] dt-bindings: arm: asr: add ASR8751C bindings
Date: Sat, 23 Mar 2019 22:01:22 +0800
Message-ID: <1553349688-1946-2-git-send-email-qiaozhou@asrmicro.com>
References: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553349688-1946-1-git-send-email-qiaozhou@asrmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Qiao Zhou <qiaozhou@asrmicro.com>
List-Id: devicetree@vger.kernel.org

From: Qiao Zhou <qiaozhou@asrmicro.com>

Add new vendor for ASR and add binding document for ASR8751C SoC and initial
board: aquilac-evb

Signed-off-by: qiaozhou <qiaozhou@asrmicro.com>
---
 Documentation/devicetree/bindings/arm/asr/asr-8751c.txt | 9 +++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt   | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/asr/asr-8751c.txt

diff --git a/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt b/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
new file mode 100644
index 0000000..af7f816
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/asr/asr-8751c.txt
@@ -0,0 +1,9 @@
+ASR 8751C Platforms Device Tree Bindings
+----------------------------------------------------
+ASR 8751C SoC
+Required root node properties:
+	- compatible = ""asr,8751c";
+
+ASR 8751C AquilaC EVB Board
+Required root node properties:
+	- compatible = "asr,aquilac-evb", "asr,8751c";
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8162b0e..3e10f13 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -43,6 +43,7 @@ arrow	Arrow Electronics
 artesyn	Artesyn Embedded Technologies Inc.
 asahi-kasei	Asahi Kasei Corp.
 aspeed	ASPEED Technology Inc.
+asr	ASR Microelectronics(Shanghai) Co., Ltd
 asus	AsusTek Computer Inc.
 atlas	Atlas Scientific LLC
 atmel	Atmel Corporation
-- 
2.7.4
