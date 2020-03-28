Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8B2C43331
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A789B2073E
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 18:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mozY0O3a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgC1ShF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 14:37:05 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40772 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgC1ShF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 14:37:05 -0400
Received: by mail-qt1-f193.google.com with SMTP id c9so11627318qtw.7
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2020 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=L7P/B+D3AiYeRNTTtzGoWO1grg+iCf61OrKb7YkEpG0=;
        b=mozY0O3aE0VsrcFIuz0SN2grN9wdhs9EnPiQNI3+eyqlmq52didy7GDf4OrhQA9mFJ
         zvFn7B8hUwZweJt7r7xlbvOh5ezOUblSDGBkrYQ1lz8JN1jm9NaWQuF/UzXpCXfdVby4
         ElA2DBkDa5zmyHf4TkZu25bsmsoQa+L9QPT/zqor/KhrXw5M/JcmfOr4miM2dMfmMIrm
         eTvTYzgrk8dFWLYm4erp63ZN5llKI8R5JWVhYnIKVPkkLIr264MaVKDtiO5QvC0d4c+u
         jUDZTeeZm04LNVsBwW31DBN5XD2d0svr4QFWKYgJCVagSRMlBlKZv9igXxVOvLY2QHJt
         mDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=L7P/B+D3AiYeRNTTtzGoWO1grg+iCf61OrKb7YkEpG0=;
        b=U9atdwLH0yM/ojy/xuHRq3Nht494xIBq+BbVGE4bkUpwttIw3U/38tDSCZ5u1dFiCx
         y7kZN4XC+ahCbQci5ll8NiH1e7c3xxqVfZ4m6+R+1818foahoS3N2X2FHdHbnrZkmUlV
         mukvsYuDczmZkMQHpPWPjbiWW40mcrbot22c63XjXg1sUt3N3ft6cNfGCtTcOW0HIeFH
         v6GnTGA1m6gJN1VYrQvEdxcXpr69TtOL7LO3RGeeTF58YsmFStT/thR91bTWlVClpl9C
         aQ5wwpdc6mXjupsNd9DxUhekQsyF/p2UyuQmrUaLGUx0BnaZQYOXi+H2FXyd6fgdwjdt
         sAkQ==
X-Gm-Message-State: ANhLgQ17zqL8OW9wiH3Zxok9y9azM104RT9qpV9gbXGb04Nb6Je0l7vH
        fbtGGLXing3wL9Ci5CCgfDA=
X-Google-Smtp-Source: ADFU+vsLENpY4Q1bbAaq9kMxiairnEMYoFEgtPmD/wxeAhAyhV91TphsOcDU+P6yj8+0y+IeJ1qSgQ==
X-Received: by 2002:ac8:358f:: with SMTP id k15mr4986112qtb.113.1585420624015;
        Sat, 28 Mar 2020 11:37:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id u40sm6822420qtc.62.2020.03.28.11.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 11:37:03 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     sam@ravnborg.org
Cc:     robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: display: xpp055c272: Remove the reg property
Date:   Sat, 28 Mar 2020 15:36:41 -0300
Message-Id: <20200328183641.11226-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328183641.11226-1-festevam@gmail.com>
References: <20200328183641.11226-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
the dsi unit name, but missed to remove the 'reg' property, which causes
the following 'make dt_binding_check' warning:

Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name

Fix it by removing the unneeded 'reg' property.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index d9fdb58e06b4..6913923df569 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -37,7 +37,6 @@ examples:
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        reg = <0xff450000 0x1000>;
 
         panel@0 {
             compatible = "xinpeng,xpp055c272";
-- 
2.17.1

