Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456DAC33CB1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CAFE24679
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 12:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeoD42BX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgANMib (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 07:38:31 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54458 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANMib (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 07:38:31 -0500
Received: by mail-wm1-f67.google.com with SMTP id b19so13565226wmj.4;
        Tue, 14 Jan 2020 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsHBYauCYyF89CTS+ne1GimZgtnUcn3VQB2uEf5Xfm4=;
        b=AeoD42BXNhE5qmTVBDs3CVM4aVSCA9cal/jffY6hrrrJEdU4PHKVaTGAH71NIyEXJh
         CqFLVKSO/+j42p2c0z3NG2lDPmWmej8vX2sr7WORvuFRXWr9/Q49BvIyD1BAlnwxE/xi
         4eopaUhA5ZvFKlUvoBVjGKuvg5qJm6+cmmLsB5FT0eA/YmuTeNCzd7kBoUuDVKe3luAH
         dfajgev4LxbN4a5ZoE5nMZWE2Y6X/grZ8MEnQnS9DU9KgjwAOmCqcNheWg56++Fy0CMg
         oE2nk6cRSDEYzS9Yp4rXKnwRXZWPFEwuu2Bk/ErFxfgOoaK7fZRxBGFkhA60+FGeQklq
         PPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsHBYauCYyF89CTS+ne1GimZgtnUcn3VQB2uEf5Xfm4=;
        b=mismH2/G7dBv0TqCJfh6u6C4QGRVIOA5D4wQdVTLuG17J5P3MMpv1f48MevjR/gel0
         5awFKn7lphyQxRfFBMZbVL7da9jkc7Nu5hohQt3bNys/buq9n4GiqphV1wTkhIPRAzyf
         iGjOXEijTy675vSt4SFp8ebw16P8ZFbD9+nLVTrzEqKnygfOUmWOpQXjEBRV85I11aKt
         dwblyqalHyaWxNpPABxnbyGTpiSNuCRWHM0mPc2067e162OWiMom7BmMoy99UIOB7xh/
         m2lQEyJOuOqFjVg5uR33vVbcaT1A4/aFjCzYn8+PsJfBkKjfw+JtyPiFg5MeU/vEy8X9
         MJag==
X-Gm-Message-State: APjAAAWaSK1Z4UfZfvTbjImzF0MRjU76hlsYlwfVOD40kLoIqr9HhoMb
        nkc6BA6gqYUGLo9KWmT3VHs=
X-Google-Smtp-Source: APXvYqwazNlBkixVUKzuwr51NZQqhixoX7ECAL37/ry/Ut00scEkUuyPt+6AzrgJTbq0hW2WmoA+Wg==
X-Received: by 2002:a1c:ba89:: with SMTP id k131mr27155340wmf.123.1579005509170;
        Tue, 14 Jan 2020 04:38:29 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id b68sm18761002wme.6.2020.01.14.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 04:38:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: memory-controller: Update example for Tegra124 EMC
Date:   Tue, 14 Jan 2020 13:38:21 +0100
Message-Id: <20200114123821.2649367-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The example in the Tegra124 EMC device tree binding looks like an old
version that doesn't contain all the required fields. Update it with a
version from the current DTS files to fix the make dt_binding_check
target.

Reported-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra124-emc.yaml                  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index dd1843489ad1..163d160264a7 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -363,20 +363,23 @@ examples:
             timing-0 {
                 clock-frequency = <12750000>;
 
-                nvidia,emc-zcal-cnt-long = <0x00000042>;
-                nvidia,emc-auto-cal-interval = <0x001fffff>;
-                nvidia,emc-ctt-term-ctrl = <0x00000802>;
-                nvidia,emc-cfg = <0x73240000>;
-                nvidia,emc-cfg-2 = <0x000008c5>;
-                nvidia,emc-sel-dpd-ctrl = <0x00040128>;
-                nvidia,emc-bgbias-ctl0 = <0x00000008>;
                 nvidia,emc-auto-cal-config = <0xa1430000>;
                 nvidia,emc-auto-cal-config2 = <0x00000000>;
                 nvidia,emc-auto-cal-config3 = <0x00000000>;
-                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-auto-cal-interval = <0x001fffff>;
+                nvidia,emc-bgbias-ctl0 = <0x00000008>;
+                nvidia,emc-cfg = <0x73240000>;
+                nvidia,emc-cfg-2 = <0x000008c5>;
+                nvidia,emc-ctt-term-ctrl = <0x00000802>;
                 nvidia,emc-mode-1 = <0x80100003>;
                 nvidia,emc-mode-2 = <0x80200008>;
                 nvidia,emc-mode-4 = <0x00000000>;
+                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+                nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+                nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+                nvidia,emc-zcal-cnt-long = <0x00000042>;
+                nvidia,emc-zcal-interval = <0x00000000>;
 
                 nvidia,emc-configuration = <
                     0x00000000 /* EMC_RC */
-- 
2.24.1

