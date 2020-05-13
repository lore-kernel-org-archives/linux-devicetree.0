Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C34C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 23:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461DD2054F
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 23:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u6Bcbwgk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732703AbgEMXjV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 19:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732523AbgEMXjV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 19:39:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE01C061A0C;
        Wed, 13 May 2020 16:39:20 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5B051F;
        Thu, 14 May 2020 01:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589413159;
        bh=Y4DkRn61MRzCqseOA2AvGHrf6l1DWCHhlqOe6q7877g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u6BcbwgkG7abAaZe/WM+2u7yklF6pmVqsjvc9eyIHnljCV9Z8bOsxcS8Ybj2/ANZw
         2zNaHzj0v4GPH2kfSS59VIoDsOywMbSHOFLrdLX5kEadzpxUeJTSjZYiureiTYUOUH
         ON7S/vucRTrFNupM1oG75K3wK1QazlDsgqKhIko4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,companion too
Date:   Thu, 14 May 2020 02:39:08 +0300
Message-Id: <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document RZ/G2E support for property renesas,companion.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes compared to RFC:

- Rebased on top of YAML conversion
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index 33c06630a2dd..1045f0e33f2c 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -81,9 +81,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the companion LVDS encoder. This property is mandatory
-      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-      the second encoder to be used as a companion in dual-link mode. It
-      shall not be set for any other LVDS encoder.
+      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
+      point to the second encoder to be used as a companion in dual-link mode.
+      It shall not be set for any other LVDS encoder.
 
 required:
   - compatible
-- 
Regards,

Laurent Pinchart

