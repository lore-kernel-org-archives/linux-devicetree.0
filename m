Return-Path: <SRS0=ysr4=P5=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Mon, 21 Jan 2019 17:38:31 +0000
Subject: [git:media_tree/master] media: dt-bindings: media: video-i2c: add melexis mlx90640 documentation
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1gleat-0000E8-UZ@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dt-bindings: media: video-i2c: add melexis mlx90640 documentation
Author:  Matt Ranostay <matt.ranostay@konsulko.com>
Date:    Tue Dec 11 13:17:00 2018 -0200

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../bindings/media/i2c/melexis,mlx90640.txt          | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

---

diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
new file mode 100644
index 000000000000..060d2b7a5893
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
@@ -0,0 +1,20 @@
+* Melexis MLX90640 FIR Sensor
+
+Melexis MLX90640 FIR sensor support which allows recording of thermal data
+with 32x24 resolution excluding 2 lines of coefficient data that is used by
+userspace to render processed frames.
+
+Required Properties:
+ - compatible : Must be "melexis,mlx90640"
+ - reg : i2c address of the device
+
+Example:
+
+	i2c0@1c22000 {
+		...
+		mlx90640@33 {
+			compatible = "melexis,mlx90640";
+			reg = <0x33>;
+		};
+		...
+	};
