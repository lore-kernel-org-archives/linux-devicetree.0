Return-Path: <SRS0=gzwM=HX=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Fri, 04 May 2018 10:34:22 +0000
Subject: [git:media_tree/master] media: dt-bindings: Add bindings for panasonic,amg88xx
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1fEaes-0003q2-6E@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Hans Verkuil <hansverk@cisco.com>, devicetree@vger.kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dt-bindings: Add bindings for panasonic,amg88xx
Author:  Matt Ranostay <matt.ranostay@konsulko.com>
Date:    Fri Apr 6 18:52:30 2018 -0400

Define the device tree bindings for the panasonic,amg88xx i2c
video driver.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Signed-off-by: Hans Verkuil <hansverk@cisco.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../bindings/media/i2c/panasonic,amg88xx.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

---

diff --git a/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt b/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt
new file mode 100644
index 000000000000..4a3181a3dd7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt
@@ -0,0 +1,19 @@
+* Panasonic AMG88xx
+
+The Panasonic family of AMG88xx Grid-Eye sensors allow recording
+8x8 10Hz video which consists of thermal datapoints
+
+Required Properties:
+ - compatible : Must be "panasonic,amg88xx"
+ - reg : i2c address of the device
+
+Example:
+
+	i2c0@1c22000 {
+		...
+		amg88xx@69 {
+			compatible = "panasonic,amg88xx";
+			reg = <0x69>;
+		};
+		...
+	};
