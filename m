Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4C3C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBA8E24650
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578300164;
	bh=skvqTBhyyO1FLCKZxItSUc6ySkZigVQbcigpeQ2las4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Tm26rvvR92IWNHkzvJReeWP8B6nRjeufupROYfKjbr68MJ2cNx050ExP5IZeOEaLt
	 innVmy5W06nC4uZrarE4C+L/IGKvsZ56Zzd1dxZXvxjQ5P0qMtej+xAPR3luLGIx5a
	 dLmWEls29D9hDr/Emk8WJ19wF7ogD3aFch5a5Les=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgAFImo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 03:42:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:40124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgAFImo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Jan 2020 03:42:44 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7242C218AC;
        Mon,  6 Jan 2020 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578300163;
        bh=skvqTBhyyO1FLCKZxItSUc6ySkZigVQbcigpeQ2las4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OHzik1a0IegjwU3lIugBdpBedMfxBLKx0R7iuzCFdziHpwCK7VMMFrqKp/jkyZpS/
         fprm7uOyFh4Cq+RAYj0kOzvGE7I01f60GhKEH124Q5iMzx6fSpZySyYu0lwBhnT8BE
         G+bHgc598+v8wlHs/+3Mosb+Jayt2KF4UFHwKl5s=
Received: by wens.tw (Postfix, from userid 1000)
        id 5BAB55FCEC; Mon,  6 Jan 2020 16:42:41 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: bus: sunxi: Add R40 MBUS compatible
Date:   Mon,  6 Jan 2020 16:42:36 +0800
Message-Id: <20200106084240.1076-4-wens@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106084240.1076-1-wens@kernel.org>
References: <20200106084240.1076-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Allwinner R40 SoC also contains MBUS controller.

Add compatible for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:

  - Reworked on top of "dt-bindings: interconnect: Convert Allwinner
    MBUS controller to a schema"

This particular patch should go through Rob's tree, instead of the
sunxi tree.
---
 .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
index 9370e64992dd..23cda7437dcb 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
@@ -30,6 +30,7 @@ properties:
     enum:
       - allwinner,sun5i-a13-mbus
       - allwinner,sun8i-h3-mbus
+      - allwinner,sun8i-r40-mbus
 
   reg:
     maxItems: 1
-- 
2.24.1

