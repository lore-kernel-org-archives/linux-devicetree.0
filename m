Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1ECC433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:33:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D7F207CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:33:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7sZLkgb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPOds (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 10:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgGPOdr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 10:33:47 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8708CC061755;
        Thu, 16 Jul 2020 07:33:47 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id z17so4904009edr.9;
        Thu, 16 Jul 2020 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HEwVwfYlTT2pmymqyaazzSn/Ii+VxfI7QEp8UVQCKaY=;
        b=e7sZLkgbguIfKzJ416HutW9XQ6G4M3oFl+o6j+dtHOMuJB7FKxXsxDeO7p/kegkV2U
         F7O1kDbujixm/xIa7RGuCDgl/dw5RgmObd+GzUiIujKTM7y6Hkc18PxG3Nq/Pqm5Yo2t
         9X4IQiXLCXnvVt5xcFf1BwGqMx3vAN59ZlH1TFxuqSHf00+2eNWkgf3h9MMre2g8+ypk
         Y+fa0J/M7tj5JrSlnlHsurrejFI/1JN405WgQTBkdA5lTCZdjj9yxUpAIdAvt0+aIxPg
         Afs1iKUAsH1jILcvehN9TQSJ33AO+71srml1MlMVJzELaPSGyCwNoHNG+mxY1QtQrL9V
         c4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HEwVwfYlTT2pmymqyaazzSn/Ii+VxfI7QEp8UVQCKaY=;
        b=lljIeo1+cQec5d4XH5PCh7/Lok3HIagDz12zHZuM7UghmWoWXB096hZJQkYukUVp8H
         3L/wjCHsJkGn5yP5VqI4GpLuhyxU6jG/IQbGzEfrl29zJ5BkvVQlef+PKn1V+1lDKoRO
         GLLSnK9Zh4a3eoyxX9VnD4IR5xHebTrbtgRZJ+Vi4fGTwE3pGDzAFapCIJPNBnwKuSif
         hqw/GyM20xjUBF2fkH5M4+JCQpRxZhKxxIBgTAPBDtjO1GVQ1FXdwI2D75ikDgGgDwIl
         fSucnBNXr2cb398TT9sufvlvHZMbtEXX9bd0XDpGcRUcjemy7lILtyGdqvlB6faYXIGk
         ui/Q==
X-Gm-Message-State: AOAM532rDRwXp3IcKoAhWz327NxrvnOaMziQ/H3qEmauuWyVFqtlrFqe
        RjvzP0gwikfSXE/o6REH8Wg=
X-Google-Smtp-Source: ABdhPJwc0FF0XQx/jWz80bghse2U1SS94cy2WHRnJ09AcsyVXGMmc7sXeuw03b8YX8norObXlCyCoQ==
X-Received: by 2002:aa7:d1c8:: with SMTP id g8mr4787186edp.337.1594910026189;
        Thu, 16 Jul 2020 07:33:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id sa10sm5331518ejb.79.2020.07.16.07.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:33:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: Add documentation for GV11B GPU
Date:   Thu, 16 Jul 2020 16:33:40 +0200
Message-Id: <20200716143341.545804-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GV11B's device tree bindings are the same as for GP10B, though the
GPU is not completely compatible, so all that is needed is a different
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.txt  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index f32bbba4d3bc..533edb4c3eec 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -6,6 +6,7 @@ Required properties:
   - nvidia,gk20a
   - nvidia,gm20b
   - nvidia,gp10b
+  - nvidia,gv11b
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
@@ -88,3 +89,21 @@ Example for GP10B:
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 		iommus = <&smmu TEGRA186_SID_GPU>;
 	};
+
+Example for GV11B:
+
+	gpu@17000000 {
+		compatible = "nvidia,gv11b";
+		reg = <0x17000000 0x10000000>,
+		      <0x18000000 0x10000000>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "stall", "nonstall";
+		clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+			 <&bpmp TEGRA194_CLK_GPU_PWR>;
+		clock-names = "gpu", "pwr";
+		resets = <&bpmp TEGRA194_RESET_GPU>;
+		reset-names = "gpu";
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA194_SID_GPU>;
+	};
-- 
2.27.0

