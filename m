From: Raphael Poggi <poggi.raph@gmail.com>
Subject: [PATCH] dt-bindings: ak4554: extension should be .txt
Date: Fri,  6 Nov 2015 13:51:47 -0800
Message-ID: <1446846707-40752-1-git-send-email-poggi.raph@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk
Cc: linux-kernel@vger.kernel.org, Raphael Poggi <poggi.raph@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rapha=C3=ABl Poggi <poggi.raph@gmail.com>
---
 Documentation/devicetree/bindings/sound/ak4554.c   | 11 -----------
 Documentation/devicetree/bindings/sound/ak4554.txt | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ak4554.c
 create mode 100644 Documentation/devicetree/bindings/sound/ak4554.txt

diff --git a/Documentation/devicetree/bindings/sound/ak4554.c b/Documen=
tation/devicetree/bindings/sound/ak4554.c
deleted file mode 100644
index 934fa02..0000000
--- a/Documentation/devicetree/bindings/sound/ak4554.c
+++ /dev/null
@@ -1,11 +0,0 @@
-AK4554 ADC/DAC
-
-Required properties:
-
-  - compatible : "asahi-kasei,ak4554"
-
-Example:
-
-ak4554-adc-dac {
-	compatible =3D "asahi-kasei,ak4554";
-};
diff --git a/Documentation/devicetree/bindings/sound/ak4554.txt b/Docum=
entation/devicetree/bindings/sound/ak4554.txt
new file mode 100644
index 0000000..934fa02
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ak4554.txt
@@ -0,0 +1,11 @@
+AK4554 ADC/DAC
+
+Required properties:
+
+  - compatible : "asahi-kasei,ak4554"
+
+Example:
+
+ak4554-adc-dac {
+	compatible =3D "asahi-kasei,ak4554";
+};
--=20
2.0.2
