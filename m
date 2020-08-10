Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0886C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 15:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACCB12080C
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 15:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgHJPWc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 11:22:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:5536 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728210AbgHJPWb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Aug 2020 11:22:31 -0400
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; 
   d="scan'208";a="54088456"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:30 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C45F4008547;
        Tue, 11 Aug 2020 00:22:27 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec: Document vcc-supply property
Date:   Mon, 10 Aug 2020 16:22:17 +0100
Message-Id: <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document optional vcc-supply property that may be used as VCC source.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
---
 .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 68951d56ebba..3248be31eceb 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -79,6 +79,9 @@ properties:
       The GPIO used to control the power down line of this device.
     maxItems: 1
 
+  vcc-supply:
+    maxItems: 1
+
 required:
   - compatible
   - ports
-- 
2.17.1

