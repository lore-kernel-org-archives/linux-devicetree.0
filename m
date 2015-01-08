From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2 8/8] ARM: devicetree: document supported Conexant Digicolor SoC
Date: Thu,  8 Jan 2015 21:40:04 +0200
Message-ID: <3c8928ba0d9c8257bd4dfcf68105f277d6507740.1420744369.git.baruch@tkos.co.il>
References: <cover.1420744368.git.baruch@tkos.co.il>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1420744368.git.baruch@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/devicetree/bindings/arm/digicolor.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/digicolor.txt

diff --git a/Documentation/devicetree/bindings/arm/digicolor.txt b/Documentation/devicetree/bindings/arm/digicolor.txt
new file mode 100644
index 000000000000..658553f40b23
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/digicolor.txt
@@ -0,0 +1,6 @@
+Conexant Digicolor Platforms Device Tree Bindings
+
+Each device tree must specify which Conexant Digicolor SoC it uses.
+Must be the following compatible string:
+
+  cnxt,cx92755
-- 
2.1.4
