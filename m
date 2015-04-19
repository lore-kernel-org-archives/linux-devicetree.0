From: Alban Bedel <albeu@free.fr>
Subject: [PATCH v2 01/12] devicetree: Add bindings for the SoC of the ATH79 familly
Date: Sun, 19 Apr 2015 14:57:57 +0200
Message-ID: <1429448288-20742-2-git-send-email-albeu@free.fr>
References: <1429448288-20742-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429448288-20742-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 .../devicetree/bindings/mips/ath79-soc.txt          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/ath79-soc.txt

diff --git a/Documentation/devicetree/bindings/mips/ath79-soc.txt b/Documentation/devicetree/bindings/mips/ath79-soc.txt
new file mode 100644
index 0000000..88a12a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/ath79-soc.txt
@@ -0,0 +1,21 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX SoC
+
+Each device tree must specify a compatible value for the AR SoC
+it uses in the compatible property of the root node. The compatible
+value must be one of the following values:
+
+- qca,ar7130
+- qca,ar7141
+- qca,ar7161
+- qca,ar7240
+- qca,ar7241
+- qca,ar7242
+- qca,ar9130
+- qca,ar9132
+- qca,ar9330
+- qca,ar9331
+- qca,ar9341
+- qca,ar9342
+- qca,ar9344
+- qca,qca9556
+- qca,qca9558
-- 
2.0.0
