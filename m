Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DB1C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 12:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 947A7206B5
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 12:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgHSMtA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 08:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgHSMsw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 08:48:52 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DB7C061757
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 05:48:52 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id HQor2300U4C55Sk01QorKg; Wed, 19 Aug 2020 14:48:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NWN-0002SS-OF; Wed, 19 Aug 2020 14:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8NWN-0005M4-NO; Wed, 19 Aug 2020 14:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] dt: writing-schema: Miscellaneous grammar fixes
Date:   Wed, 19 Aug 2020 14:48:50 +0200
Message-Id: <20200819124850.20543-1-geert+renesas@glider.be>
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
index 8c74a99f95e23f4b..16f21e182ff6d19f 100644
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

