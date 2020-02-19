Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7217FC34047
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46F3624654
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 15:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgBSPhJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 10:37:09 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34964 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSPhI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 10:37:08 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id 4fd62200q5USYZQ01fd6Wb; Wed, 19 Feb 2020 16:37:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4RPO-0004Ke-Pk; Wed, 19 Feb 2020 16:37:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j4RPO-0002pE-N6; Wed, 19 Feb 2020 16:37:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt: writing-schema: Miscellaneous grammar fixes
Date:   Wed, 19 Feb 2020 16:37:05 +0100
Message-Id: <20200219153705.10818-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

  - Add missing verb,
  - Fix accidental plural.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/writing-schema.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/writing-schema.rst b/Documentation/devicetree/writing-schema.rst
index 7635ab2304560815..defa8deb220b8b89 100644
--- a/Documentation/devicetree/writing-schema.rst
+++ b/Documentation/devicetree/writing-schema.rst
@@ -5,7 +5,7 @@ Writing DeviceTree Bindings in json-schema
 
 Devicetree bindings are written using json-schema vocabulary. Schema files are
 written in a JSON compatible subset of YAML. YAML is used instead of JSON as it
-considered more human readable and has some advantages such as allowing
+is considered more human readable and has some advantages such as allowing
 comments (Prefixed with '#').
 
 Schema Contents
@@ -19,7 +19,7 @@ $id
   A json-schema unique identifier string. The string must be a valid
   URI typically containing the binding's filename and path. For DT schema, it must
   begin with "http://devicetree.org/schemas/". The URL is used in constructing
-  references to other files specified in schema "$ref" properties. A $ref values
+  references to other files specified in schema "$ref" properties. A $ref value
   with a leading '/' will have the hostname prepended. A $ref value a relative
   path or filename only will be prepended with the hostname and path components
   of the current schema file's '$id' value. A URL is used even for local files,
-- 
2.17.1

