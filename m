Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3A5C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB80E2067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtNBlbR3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgFLOTv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgFLOTv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DCCC03E96F;
        Fri, 12 Jun 2020 07:19:50 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y17so9897179wrn.11;
        Fri, 12 Jun 2020 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2RRemqJiAqf7qpLtXqGrsK/mprv7AeipWZddUy7i504=;
        b=BtNBlbR3inFocaxGYyOmV/2TBeAQtRL7hhabmlj07bUm4DkBi/GhDAcqAxXJwSh6D4
         g5+HVvWoWLATExkSXSEwrKoIVyTqf9ArxC9uGO0EY1YZRvBscZSd3KVdlWGJgbzwrFZa
         6q7ex0XwMsP5Oudm4KXgn00S7Liq3Ez+uUgKWw78xgR7+jBy/cCDNSJJwEL/eieRSG0A
         2BkVgzgO/T9LLOCWX0btxntD6dFEUxmfsXkfBH6o/oTdgij4XAlV5Q22bath2Xyi1UQA
         RoWh4iInXG5jM8SskRGdOfhqIBsQG06RjuX2Ob6DKQCzRL4m6NFmrvEUnpc6sAzaWB71
         fU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2RRemqJiAqf7qpLtXqGrsK/mprv7AeipWZddUy7i504=;
        b=dsQADmVFJe1WTOhFa+Lvvvzan8U9P01T/FI/BALeRv3xXEOkJAI88MhEsgEnx+R66X
         Pc6uPW0RLrq/bu54ut1iPtL7l1kryhOlHFUQHv0N50ygqK1W2ipxEbEKub6UstBZJ2Wj
         r6B1j/k44yg7QLsCSw8qziZnPXQmLZtwnk/vlMzjhew/gKGh4IrW+usMIkgBtOzNyR+Y
         aT5vCF1WIKItVmrKGdlayy0EkT2BYlTqOag7lqcwTF+q5XU0rpEU5vr5Z63H4SmU40g8
         iYWEda8xoLRWV/XNrVMlUMwjfU8GjvlpKI4hMZuI5q7+2pd3rB03GjbUGyaTLx/D3ebn
         71Vw==
X-Gm-Message-State: AOAM532Lqmwi0sRClt99T1/JQr+W/O/2stC4tcZiTIqBhFheGOm1iRpE
        igNARnWDQY1kZrdpwelDIFaTzmUY
X-Google-Smtp-Source: ABdhPJwjueSUPtst6dE/21BGW/taAdb6qAJi+8q94JQw9b8xfsrz8aPJffQq7oLN053Y62Mpf7UokA==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr15213370wrw.295.1591971589510;
        Fri, 12 Jun 2020 07:19:49 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z7sm10397273wrt.6.2020.06.12.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 20/38] dt-bindings: net: dwc-qos-ethernet: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:45 +0200
Message-Id: <20200612141903.2391044-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add optional interconnects and interconnect-names properties to allow
describing the interconnect paths to and from the Ethernet device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/net/snps,dwc-qos-ethernet.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
index 252f11affd6b..779e06b32278 100644
--- a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
@@ -123,6 +123,15 @@ properties:
     description: Enable gating of the MAC TX clock during TX low-power mode.
     $ref: "/schemas/types.yaml#/definitions/flag"
 
+  interconnects:
+    description: Description of the interconnect paths for the ethernet
+      controller; see ../interconnect/interconnect.txt for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+
   mdio:
     description: A subnode representing the GMAC's MDIO bus.
     type: object
@@ -208,6 +217,11 @@ allOf:
             - const: tx
             - const: ptp_ref
 
+        interconnect-names:
+          items:
+            - const: dma-mem # read
+            - const: write
+
       required:
         - resets
         - reset-names
-- 
2.24.1

