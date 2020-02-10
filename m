Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5E4C352A3
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 10:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52B7B20842
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 10:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="IpUmhisk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h/tiJSe5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbgBJKFG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 05:05:06 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50633 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726451AbgBJKFF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 05:05:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 347A721EBC;
        Mon, 10 Feb 2020 05:05:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 05:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=OUh+BFLJI5/m/Us7I80+FqIdT/
        uSz30g4NJ7pLIJY3M=; b=IpUmhiskEa1113T6f3lghkmRosWYCMMN9Cso84Trkf
        ArHV2hNwHuA6RMAAyjbPfu11XeolabRN9LcO6aBrPd1NkABHDJp1wdmlVcvvG7nq
        dcxEppMISFZvbyNaZbuYgOHwq+IrJYKP0i00raNsmEE0CKfVnMEWREJf3AdHF+Hn
        qZEk+qVVOt8FniZ9Jrk8GxGQdoiXS2fw/ivwmzmZSv94tprbVmRWtI+sere4Bxev
        BXRw5Dxf8kcMzIMhR9k42tphKsMiXdXW3hhJ0HCAfYZEazBXTi8TlFEEESkFmR/6
        S+c48cjfPjsQSBKPEEZUetmcObqQgWFVDurGBhT7dAcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OUh+BFLJI5/m/Us7I
        80+FqIdT/uSz30g4NJ7pLIJY3M=; b=h/tiJSe5dVcST2lj26ttHoWFJPMC5oPBR
        sNK2eQk0KknT13rEWltwt7gdmT0NNoYwMCAaCi/qOlonHQAMSrk/dDTS2Msdjf1i
        0rM1ilFFCjnDp4dfqGDK/F62K9zLmsxD/sPrVL/rsaxXy1uAX//DfZXhq8w8rM/n
        UTEUdmUurvRKQUnaV1a8NdyvOz7HICUZ3TmUABX8ehRI4fmLpmZK3N8RTskVIwKe
        jg5v+9kUBJq1p0p8XT/J2eROjdbp8iozv++iDGleLmwAPH2pbG/V5oFNuIhqa3Dd
        NRWWDaLauyllFk9vRvDSq0fF6KTuKvvpZbIK0CG4cldYOIoAkGs3A==
X-ME-Sender: <xms:0CpBXo9OtRRWAtXpq6reQyhsyIVLBL7mNmGCCsmd61uUoGom4B1jHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0CpBXnA1BLfrQnBabSYNmIFZud7nzwWDPQO234IBYsmAKKf069ogfA>
    <xmx:0CpBXkDWmQl0oU5gTwsEAAl6pZoEUUHRIjraz-33PmGt3IytZ2QYpw>
    <xmx:0CpBXlxa-q7phvH-fovlB5hj2AaXvjgdKK5WHj6SKSggy901O0oscw>
    <xmx:0SpBXiLxGrwCfpjOICENL_6dZQoawTuMtVpdNF_2UA-1Yc9AFb3Agg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D97653280064;
        Mon, 10 Feb 2020 05:05:03 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: display: sunxi: Fix compatible
Date:   Mon, 10 Feb 2020 11:04:55 +0100
Message-Id: <20200210100455.78695-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
pipeline to schemas") introduced a YAML schema for the Allwinner TCON DT
binding, but the H6 TCON-TV compatible was mistakenly set to fallback on
the A83t's, while the initial documentation and the DT are using R40's.

Fix that.

Fixes: f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 86ad617d2327..5ff9cf26ca38 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -43,9 +43,13 @@ properties:
         - enum:
           - allwinner,sun8i-h3-tcon-tv
           - allwinner,sun50i-a64-tcon-tv
-          - allwinner,sun50i-h6-tcon-tv
         - const: allwinner,sun8i-a83t-tcon-tv
 
+      - items:
+        - enum:
+          - allwinner,sun50i-h6-tcon-tv
+        - const: allwinner,sun8i-r40-tcon-tv
+
   reg:
     maxItems: 1
 
-- 
2.24.1

