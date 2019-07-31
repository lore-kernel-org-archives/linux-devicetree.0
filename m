Return-Path: <SRS0=Zd16=V4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:35988 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfGaMfx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 31 Jul 2019 08:35:53 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] scripts/dtc: dtx_diff - make help text formatting consistent
Date: Wed, 31 Jul 2019 14:35:48 +0200
Message-Id: <20190731123548.13787-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

None of the help texts use capitalization, except the one for the -T
option.  Drop the capitalization for consistency.
Split the single long line that doesn't fit in 80 characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 scripts/dtc/dtx_diff | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index 00fd4738a5877948..e9ad7834a22d9459 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -27,7 +27,8 @@ Usage:
        -s SRCTREE   linux kernel source tree is at path SRCTREE
                         (default is current directory)
        -S           linux kernel source tree is at root of current git repo
-       -T           Annotate output .dts with input source file and line (-T -T for more details)
+       -T           annotate output .dts with input source file and line
+                        (-T -T for more details)
        -u           unsorted, do not sort DTx
 
 
-- 
2.17.1
