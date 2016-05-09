From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 6/6] doc: dt: Document the target root overlay method
Date: Mon,  9 May 2016 21:05:47 +0300
Message-ID: <1462817147-7620-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462817147-7620-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Add a description of the target root overlay method to the overlay
documention file.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 Documentation/devicetree/overlay-notes.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index dd595e6..00ede57 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -104,6 +104,10 @@ If your board has multiple slots/places where a single overlay can work
 and each slot is defined by a node, you can use the of_overlay_create_indirect()
 method to select the target.
 
+For overlays on probeable busses, use the of_overlay_create_target_root() method
+in which you supply a device node as a target root, and which all target
+references in the overlay are performed relative to that node.
+
 Overlay DTS Format
 ------------------
 
@@ -144,3 +148,7 @@ contains the information required to map from a phandle to a tree location.
 The indirect target requires the use of a selector target on the call to
 of_overlay_create_indirect(). I.e. passing the "foo" id will select the target
 in the foo node, "bar" in bar node, etc.
+
+Note that when using the target root create method all target references must
+lie under the target root node. I.e. the overlay is not allowed to 'break' out
+of the root.
-- 
1.7.12
