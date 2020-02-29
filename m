Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0F0C3F2D3
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 15:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DD0B246AF
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 15:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgB2PP0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 10:15:26 -0500
Received: from gloria.sntech.de ([185.11.138.130]:51292 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727122AbgB2PP0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Feb 2020 10:15:26 -0500
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j83po-0003GL-9N; Sat, 29 Feb 2020 16:15:20 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     dri-devel@lists.freedesktop.org
Cc:     thierry.reding@gmail.com, sam@ravnborg.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        christoph.muellner@theobroma-systems.com, robin.murphy@arm.com,
        linux-rockchip@lists.infradead.org, heiko@sntech.de,
        francescolavra.fl@gmail.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Elida
Date:   Sat, 29 Feb 2020 16:15:04 +0100
Message-Id: <20200229151506.750242-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Shenzen Elida Technology Co. Ltd. is a Chinese TFT manufacturer.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Hi Rob,

as can be seen on [0], Sam expects you to apply the vendor prefix
to the main dt-tree.

Thanks
Heiko

[0] http://lore.kernel.org/r/20200229125725.GC5447@ravnborg.org

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..38d3149d3adc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: Elan Microelectronic Corp.
   "^elgin,.*":
     description: Elgin S/A.
+  "^elida,.*":
+    description: Shenzhen Elida Technology Co., Ltd.
   "^embest,.*":
     description: Shenzhen Embest Technology Co., Ltd.
   "^emlid,.*":
-- 
2.24.1

