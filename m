From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 3/6] doc: dt: Document the indirect overlay method.
Date: Mon,  9 May 2016 21:05:44 +0300
Message-ID: <1462817147-7620-4-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Add a description of the indirect overlay method to the overlay
documention file.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 Documentation/devicetree/overlay-notes.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index d418a6c..dd595e6 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -100,6 +100,10 @@ Finally, if you need to remove all overlays in one-go, just call
 of_overlay_destroy_all() which will remove every single one in the correct
 order.
 
+If your board has multiple slots/places where a single overlay can work
+and each slot is defined by a node, you can use the of_overlay_create_indirect()
+method to select the target.
+
 Overlay DTS Format
 ------------------
 
@@ -113,6 +117,11 @@ The DTS of an overlay should have the following format:
 		target=<phandle>;	/* phandle target of the overlay */
 	or
 		target-path="/path";	/* target path of the overlay */
+	or
+		target-indirect {	/* indirect target selector */
+			foo { target|target-path ... };
+			bar { .... };
+		};
 
 		__overlay__ {
 			property-a;	/* add property-a to the target */
@@ -131,3 +140,7 @@ Using the non-phandle based target method allows one to use a base DT which does
 not contain a __symbols__ node, i.e. it was not compiled with the -@ option.
 The __symbols__ node is only required for the target=<phandle> method, since it
 contains the information required to map from a phandle to a tree location.
+
+The indirect target requires the use of a selector target on the call to
+of_overlay_create_indirect(). I.e. passing the "foo" id will select the target
+in the foo node, "bar" in bar node, etc.
-- 
1.7.12
