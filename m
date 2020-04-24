Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9EAC2BA1A
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 05:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 347BD20728
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 05:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iUmsqjZg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgDXFij (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 01:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725823AbgDXFij (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 01:38:39 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E132C09B045
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 22:38:39 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id z8so9467813qki.13
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=fleKWJiYiR5vKTf1/KbKvBmLV3KIF/zKJR1BUiNMI5U=;
        b=iUmsqjZgO6njBhyLec4kM76hC2BmGpCFZ/DJuY4A7zmGD5TMPESZW68+W3nxzv7Vhf
         u6cHLvaX3p1Gh+9lhbca/bl66KMMhSXYjNCl7tW0+QSvzhh1f8Ba4nkDc7Cs0rshTLog
         OKzG+qkupZBN/hv61NjrkS1GNk2XPoa05QI+e/hR6K48Kndomf08SMXLz0cIA/Sp+fMO
         ke/YhFJWdPXYp638TmKQf7oiM/m9gOpTDoLU4GB3d5FzS41l3fhz4P7483FPz+fIQzsS
         qGwoN5qANwFgxRgkmuM/Y2C1Fl8vOnWJG3PKrtgCn4OItUNYeftvXEntyIERBY5L3+q9
         c0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=fleKWJiYiR5vKTf1/KbKvBmLV3KIF/zKJR1BUiNMI5U=;
        b=XS8s52j0E8G7i2czByuKqd8X/MAQSwBUJRGp2TK89l+HjWEtneMM0ztVPghGnNIQ8V
         e9uCH0PHnixcjKzuqbNCMfvmH3cWXi2SupXNn9ISC35L1aBU1pa/C7Ay+t1Kwl4G/0Hd
         JtEw39F/WkyPgoYv4HCRYsmttkEPTa3D2x9bjDn7yDfENwzTlR3e0HFm+3tpJVSnneym
         DvKe9sTxxuukm4meewUdLx+3U+4glC6oS3vVtU93zXrb1gtgwg3jpYzBofk/iTyXVkEy
         9q0yRh0gJqv4iT/lz/bN08HmO74xERVQxR593F5hWODrNNVvu01tcYNlf+IfZaPu/jSU
         U/hA==
X-Gm-Message-State: AGi0PuYeZw6pYyNqPwvGOmeiF65cGsrVvEs46FlFmwVuDbnrqaxNp58F
        H4y5zoYvhf99/16KmZq9Esb6akFsYM9w
X-Google-Smtp-Source: APiQypIIQlkCaX6bJWhHG4kmnfMkCHlcuy1qfAA357aSBf5DIUde8BulJxDuqS/1DEgn1C/NV2X5FLliT9xg
X-Received: by 2002:a05:620a:118b:: with SMTP id b11mr7521950qkk.82.1587706718313;
 Thu, 23 Apr 2020 22:38:38 -0700 (PDT)
Date:   Fri, 24 Apr 2020 01:38:18 -0400
Message-Id: <20200424053819.220276-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 1/2] dt-bindings: Add ch7322 as a trivial device
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ch7322 is a Chrontel CEC controller.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4165352a590a..ec2ddc6cdf9a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -48,6 +48,8 @@ properties:
           - capella,cm32181
             # CM3232: Ambient Light Sensor
           - capella,cm3232
+            # CH7322: HDMI-CEC Controller
+          - chrontel,ch7322
             # High-Precision Digital Thermometer
           - dallas,ds1631
             # Total-Elapsed-Time Recorder with Alarm
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..7794ffccd325 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -187,6 +187,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chrontel,.*":
+    description: Chrontel, Inc.
   "^chrp,.*":
     description: Common Hardware Reference Platform
   "^chunghwa,.*":
-- 
2.26.2.303.gf8c07b1a785-goog

