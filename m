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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB91AC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAB9320838
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k83uyL1u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgFLOTj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgFLOTi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902F8C08C5C1;
        Fri, 12 Jun 2020 07:19:38 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so9939877wrc.7;
        Fri, 12 Jun 2020 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l+hOWQjrF2NUw4Qr/tcHfHqtLxmUbjnIz5MJ01xSFVk=;
        b=k83uyL1ur1d0VLJ7XoDU3ibEUGBsnXGxnVCQJtFs9xHylmL9d69okOAN9Gp+kuE32D
         9NMTgE9eC05MH+mVifnCNlaQzYQFqTbT9CxYzYQvNCpG38eFsCFYjAzPnzzfKbHLkJ34
         zJ6wztVS4hkdqqzWQ2FzyvSTRI8peVKfRPKqiogCxRU4Yb3w5jf38Dipbdev9wCdCYP8
         aYfaX3psIwRA54hKUG51UaXI/nKUFhNFH3Whhlx2ZkLLisSAOEwUzwYqt+urgEW3kIXz
         b7/y7nVZzVb9acto4s01xqi83l41ElVmWXaT5pqjOPNpqMGni6gky73SuTksdZ83U/2A
         Pf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l+hOWQjrF2NUw4Qr/tcHfHqtLxmUbjnIz5MJ01xSFVk=;
        b=nqGLIFFtdkDOOhFVktkMBetiBB9RUrzDDQ93THzZhHaHHlwCiGYEpjUEAjOcej057L
         X+P+RKecD2BKgdHmGQ6rCmt2lu3J4O4lkeQqa0ePMDotuHCiNPgpwqS/vnGI2UoWS73s
         JbjYK7Zyyu0IKhC3QI7CsaJiPnlYf91n6Kp+5iCFfDNLZ16FEoGj0wFz86JpeWkMaL98
         4GXSrDt41g0oAzzIYecVRliZQivxiUt9DzsJy++OodAkEIMOz2Yns4h0g4I9L7B91m5A
         B/DXK2W3jts3NaCxNBVqf+QX8VpsnnlMihmoErkDXNTpAgXfIcvLzlsjG8BtXyH35Mo0
         jcYg==
X-Gm-Message-State: AOAM532gzefLJjMzSmSVq/QGukCI/upg4by1hmEp6PPM5dO9sgqwe+T1
        nhG6pbbbL32971JPZuGBiZI=
X-Google-Smtp-Source: ABdhPJyI4Dpw3IymsfEVUv26GwIY0glOg72oi1UApuWQvuv2/BEq95OONGpo+T189uw4bPg32ZDCAQ==
X-Received: by 2002:adf:fd49:: with SMTP id h9mr15676273wrs.67.1591971577280;
        Fri, 12 Jun 2020 07:19:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a126sm9302803wme.28.2020.06.12.07.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 14/38] dt-bindings: pci: tegra: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:39 +0200
Message-Id: <20200612141903.2391044-15-thierry.reding@gmail.com>
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
describing the interconnect paths to and from the PCIe controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/pci/nvidia,tegra20-pcie.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
index e7cc95bfa810..3b8a4da23934 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
@@ -104,6 +104,17 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: Description of the interconnect paths for the PCIe controller;
+      see ../interconnect/interconnect.txt for details.
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
+      - const: write
+
   pinctrl-names:
     items:
         # active state, puts PCIe I/O out of deep power down state
-- 
2.24.1

