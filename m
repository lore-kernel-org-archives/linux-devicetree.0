From: frowand.list@gmail.com
Subject: [PATCH v4 2/4] of: Documentation: of_overlay_apply() replaced by of_overlay_fdt_apply()
Date: Thu,  1 Mar 2018 10:00:54 -0800
Message-ID: <1519927256-4868-3-git-send-email-frowand.list@gmail.com>
References: <1519927256-4868-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519927256-4868-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, laurent.pinchart+renesas@ideasonboard.com
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/devicetree/overlay-notes.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index c4aa0adf13ec..5175a24d387e 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -87,8 +87,8 @@ Overlay in-kernel API
 
 The API is quite easy to use.
 
-1. Call of_overlay_apply() to create and apply an overlay changeset. The return
-value is an error or a cookie identifying this overlay.
+1. Call of_overlay_fdt_apply() to create and apply an overlay changeset. The
+return value is an error or a cookie identifying this overlay.
 
 2. Call of_overlay_remove() to remove and cleanup the overlay changeset
 previously created via the call to of_overlay_apply(). Removal of an overlay
-- 
Frank Rowand <frank.rowand@sony.com>
