Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D265BC433EB
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F9042220F
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594710804;
	bh=w1blA/cFj1h024XvBru10C7tkW/sc1XSHCZ9GuDw07w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nEsaa5FvtVSl6pT8ylykBzqvgY73IIkpvSTD6fYB5f+ITeoRQPEMKVALYq8/joU8D
	 1RHiAceNt8PQ6UeGjEWoky7ykTw8yPy17hki9Kh2eKk+D681/+9SwyzIHx0l5GAZNr
	 X77xA0Iwo3Ox4Ge1ojhx5+1dCp2NJ1tn78vdUTwA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgGNHNV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 03:13:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbgGNHNU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 03:13:20 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0C8B22225;
        Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594710799;
        bh=w1blA/cFj1h024XvBru10C7tkW/sc1XSHCZ9GuDw07w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iSETV3Xu9AbC5Rv/zleZ6t6T/ZJB5lio1LdK3NqyRNPGrWukZ6IlWZY7dLrCIdobT
         +l6kjTNJepn5XErgyt8R14TdZjf6eDPUxZCfBhJkw6p/wJ+89ZyhSXtpbjJPVp2qOc
         CwSiGdGjLhKEOr2TakSgIa8VrUkEKinRxFkyJVpc=
Received: by wens.tw (Postfix, from userid 1000)
        id 055375FCF0; Tue, 14 Jul 2020 15:13:14 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: [PATCH 3/5] dt-bindings: arm: sunxi: Add compatible for MSI Primo73 tablet
Date:   Tue, 14 Jul 2020 15:13:03 +0800
Message-Id: <20200714071305.18492-4-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Document board compatible name for MSI Primo73 tablet.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index efc9118233b4..35d78448ec46 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -475,6 +475,11 @@ properties:
           - const: allwinner,mk808c
           - const: allwinner,sun7i-a20
 
+      - description: MSI Primo73 Tablet
+        items:
+          - const: msi,primo73
+          - const: allwinner,sun7i-a20
+
       - description: MSI Primo81 Tablet
         items:
           - const: msi,primo81
-- 
2.27.0

