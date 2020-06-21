Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60039C433E5
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B0F824772
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 00:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vDuSJS5u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgFUAsG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 20:48:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgFUAsF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 20:48:05 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 198B8592;
        Sun, 21 Jun 2020 02:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700483;
        bh=tbl8Cg+MVyQ6V5JcIkVIXWcGnYTPq4SLi8EuIAle/OU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vDuSJS5uV53psKVpOkUY6CKp7QCK5CXBOTrEEYJ+cF88yb4iQP1aORWwnZE5aHBV7
         ro7ntR8OoHZUhV8p+FAnpscJBT4kUqFJxS/juF4AzPax3MCz+qHKsRbhocZKUt1J9u
         KNt6j5PyyE+mEuip7JzyQ15sFUhiAoUXxdktA4kQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/8] dt-bindings: media: renesas,fcp: Make power-domains mandatory
Date:   Sun, 21 Jun 2020 03:47:28 +0300
Message-Id: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

All DT source files in the kernel tree specify the power-domains
property. Make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:

- Fix typo in commit message
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 9241bf3c5efc..eeca7e255420 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -38,6 +38,7 @@ required:
   - compatible
   - reg
   - clocks
+  - power-domains
 
 additionalProperties: false
 
-- 
Regards,

Laurent Pinchart

