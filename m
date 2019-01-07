Return-Path: <SRS0=dDYX=PP=chromium.org=dverkamp@kernel.org>
From: Daniel Verkamp <dverkamp@chromium.org>
Subject: [PATCH] Documentation/devicetree: fix initrd property names
Date: Mon,  7 Jan 2019 13:31:52 -0800
Message-Id: <20190107213152.43797-1-dverkamp@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Verkamp <dverkamp@chromium.org>
List-ID: <devicetree@vger.kernel.org>

Documentation/devicetree/bindings/chosen.txt documents
Linux-specific chosen node initrd properties with the names
"linux,initrd-start" and "linux,initrd-end", whereas usage-model.txt had
these as just "initrd-start" and "initrd-end".  As far as I can tell,
the code agrees with the chosen.txt documentation (only the
"linux,"-prefixed properties work), so update usage-model.txt to match.

Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---
 Documentation/devicetree/usage-model.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/usage-model.txt b/Documentation/devicetree/usage-model.txt
index 33a8aaac02a8..0ec55edf7580 100644
--- a/Documentation/devicetree/usage-model.txt
+++ b/Documentation/devicetree/usage-model.txt
@@ -187,8 +187,8 @@ Linux it will look something like this:
 
 	chosen {
 		bootargs = "console=ttyS0,115200 loglevel=8";
-		initrd-start = <0xc8000000>;
-		initrd-end = <0xc8200000>;
+		linux,initrd-start = <0xc8000000>;
+		linux,initrd-end = <0xc8200000>;
 	};
 
 The bootargs property contains the kernel arguments, and the initrd-*
-- 
2.20.1.97.g81188d93c3-goog
