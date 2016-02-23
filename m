From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] [media] tvp5150: remove signal generator as input from the DT binding
Date: Tue, 23 Feb 2016 13:09:58 -0300
Message-ID: <1456243798-12453-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, devicetree@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: devicetree@vger.kernel.org

The chip internal signal generator was modelled as an input connector
and represented as a media entity but isn't really a connector so the
driver was changed to use the V4L2_CID_TEST_PATTERN control instead.

Remove the signal generator input from the list of connectors in the
tvp5150 DT binding document as well since isn't a connector anymore.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
Hello,

I think is OK to change this DT binding because is only in the media tree
for now and not in mainline yet and also is expected to change more since
there are still discussions about how input connectors will be supported
by the Media Controller framework in the media subsystem.

Best regards,
Javier

 Documentation/devicetree/bindings/media/i2c/tvp5150.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
index daa20e43a8e3..d13f8b8e235d 100644
--- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
@@ -30,9 +30,6 @@ The possible values for the "input" property are:
 	1: Composite1
 	2: S-Video
 
-and on a tvp5150am1 and tvp5151 there is another:
-	4: Signal generator
-
 The list of valid input connectors are defined in dt-bindings/media/tvp5150.h
 header file and can be included by device tree source files.
 
-- 
2.5.0
