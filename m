Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D546AC47411
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 16:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 794E522D5B
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 15:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbfKMPwC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 10:52:02 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21771 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728002AbfKMPwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:02 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593914"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:01 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DB6C2400E9F7;
        Thu, 14 Nov 2019 00:51:56 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter: Document "ti,sn75lvds83"
Date:   Wed, 13 Nov 2019 15:51:23 +0000
Message-Id: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Compatible string "ti,sn75lvds83" is being used by device tree
rk3188-bqedison2qc.dts, but it's not documented anywhere, therefore
document it within lvds-transmitter.yaml.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch
---
 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
index a8326ce..27de616 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
@@ -37,6 +37,7 @@ properties:
       - enum:
         - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
         - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
+        - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
       - const: lvds-encoder # Generic LVDS encoder compatible fallback
 
   ports:
-- 
2.7.4

