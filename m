Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F235C5DF60
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 18:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FAE520656
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 18:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390735AbfKESfK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 13:35:10 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:43322 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390520AbfKESfJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 13:35:09 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id NJb62100s5USYZQ01Jb6By; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0002sI-Ke; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0005aj-JH; Tue, 05 Nov 2019 19:35:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix to vsps property
Date:   Tue,  5 Nov 2019 19:35:02 +0100
Message-Id: <20191105183504.21447-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105183504.21447-1-geert+renesas@glider.be>
References: <20191105183504.21447-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Renesas-specific "vsps" property lacks a vendor prefix.
Add a "renesas," prefix to comply with DT best practises.

Move "renesas,vsps" below "renesas,cmms" to preserve alphabetical sort
order.

Fixes: 06711e6385a4ab4c ("drm: rcar-du: Document the vsps property in the DT bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/renesas,du.txt       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index f6fdaa67c257a046..eb4ae41fe41f83c7 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -41,15 +41,15 @@ Required Properties:
       supplied they must be named "dclkin.x" with "x" being the input clock
       numerical index.
 
-  - vsps: A list of phandle and channel index tuples to the VSPs that handle
-    the memory interfaces for the DU channels. The phandle identifies the VSP
-    instance that serves the DU channel, and the channel index identifies the
-    LIF instance in that VSP.
-
   - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
     one for each available DU channel. The property shall not be specified for
     SoCs that do not provide any CMM (such as V3M and V3H).
 
+  - renesas,vsps: A list of phandle and channel index tuples to the VSPs that
+    handle the memory interfaces for the DU channels. The phandle identifies the
+    VSP instance that serves the DU channel, and the channel index identifies
+    the LIF instance in that VSP.
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
@@ -96,8 +96,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 			 <&cpg CPG_MOD 722>,
 			 <&cpg CPG_MOD 721>;
 		clock-names = "du.0", "du.1", "du.2", "du.3";
-		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
+		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.17.1

