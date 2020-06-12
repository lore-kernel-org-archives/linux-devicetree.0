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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F395C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2FDB20835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeNnRQpb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgFLOTO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:14 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B17C03E96F;
        Fri, 12 Jun 2020 07:19:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x6so9878143wrm.13;
        Fri, 12 Jun 2020 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8U6B6VedpYGCnMVPmUXsskrBlYHa9dz9jvAVaingCs=;
        b=EeNnRQpbaZAWRTwNlMQxROGxA31VmxHdGTCeTbwal9tVpmEfWsUsTgFFZEw9D03n7P
         D/Br9FGFVggxHZfOf6pqyXYduSbtf4BDmwTxLh6rglY/Up0fD4mW7btSRW6tPOGzSt70
         vyFXQccxE4IY5w2G8THa+oDbOZ5xlSjZpo3GKIZ9qpVI7cCsZTUHC/znRjVs7D2pSnpE
         y2A44Qsff7ZvtI2Z/tFGyA4eYi8K8QUUDmG69SAx9QFJkhLhjDTCb1I8QEZAwlODaO/6
         WdoGOJbNN5LURjCAQ+6fcH4qX/mSwWmlJ8csLXzM/gj9Sin6EHDe22oGabteYR/U3F1P
         u/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8U6B6VedpYGCnMVPmUXsskrBlYHa9dz9jvAVaingCs=;
        b=RsObXt7UKGTRT/wvRLd239/aFU/ePbK4jURNLuJ04ZHujTE0NeO5ta6/yHtxRYVuTO
         J5VPKAhPYJT/xJ0oSuONkl9L+oue7Vxt19nT4/kRvDJbdc7OXvywuQ7Tcv7zN+7TX/94
         SQIn337seDvI0m68oZZDyvCGBaZyVbWVCs7jJyOodHZH+JsdIW1F08vXHE0SBfm630GI
         YSmpqOvQo/u+fxw6Q5xejG/FOl58l3k1hv9mot0QpMrWN/vBbW0jaksNd7kObkbiaEiU
         lXAuHkhDIKbHmo4/flnFL5k5ZhsbFxX6Gy2LiggjM6DgmHnMovphfWiba9JAfI0b+LqH
         3XcQ==
X-Gm-Message-State: AOAM530ZoJYgPhl5AZKHYquTbQkfte4yThe9Lttyqex9SmeCym8XEA4l
        wph2yE5cDT98cvhpy6b+f74=
X-Google-Smtp-Source: ABdhPJzPRv5ZRQAQjOL9N31EVDfjff28jwZMzlKpvMAH34Tgfqdn7wvV+K07l/XyQ50z/nVnlcM3uA==
X-Received: by 2002:adf:9c12:: with SMTP id f18mr16415407wrc.105.1591971552518;
        Fri, 12 Jun 2020 07:19:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q8sm8518743wmq.1.2020.06.12.07.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 02/38] dt-bindings: memory: nvidia: Mark memory controller as interconnect provider
Date:   Fri, 12 Jun 2020 16:18:27 +0200
Message-Id: <20200612141903.2391044-3-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../memory-controllers/nvidia,tegra186-mc.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 611bda38d187..581572fe3077 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -38,6 +38,16 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#interconnect-cells":
+    const: 1
+    description:
+      Each interconnect node for the memory controller takes a phandle to the
+      memory controller and a single cell as the specifier, identifying the
+      memory client by its ID.
+
+      For a list of valid IDs, see dt-bindings/memory/tegra186-mc.h and
+      dt-bindings/memory/tegra194-mc.h.
+
   "#address-cells":
     const: 2
 
-- 
2.24.1

