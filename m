Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A3FCA9EA1
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 08:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85D5F222BD
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 08:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632776AbfJRI0E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 04:26:04 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:5827 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2504964AbfJRI0E (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 04:26:04 -0400
X-UUID: 52791b3d430e43e888e3cd6d0133c139-20191018
X-UUID: 52791b3d430e43e888e3cd6d0133c139-20191018
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1801650443; Fri, 18 Oct 2019 16:25:59 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 18 Oct 2019 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 18 Oct 2019 16:25:57 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-i2c@vger.kernel.org>
CC:     <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <srv_heupstream@mediatek.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2] dt-binding: eeprom: at24: add supply properties
Date:   Fri, 18 Oct 2019 16:25:57 +0800
Message-ID: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In some platforms, they disable the power-supply of eeprom and i2c due
to power consumption reduction.

This patch add two supply properties: vcc-supply, i2c-supply.

Changes since v1:
 - change supply name
 - rebase to next

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e8778560d966..578487a5d9b7 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -167,6 +167,14 @@ properties:
     minimum: 1
     maximum: 8
 
+  vcc-supply:
+    description:
+      phandle of the regulator that provides the supply voltage.
+
+  i2c-sypply:
+    description:
+      phandle to the regulator that provides power to i2c.
+
 required:
   - compatible
   - reg
-- 
2.18.0

