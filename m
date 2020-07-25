Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66773C433E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 21:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E396206D8
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 21:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgGYVNy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 17:13:54 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:35338 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgGYVNy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 17:13:54 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BDf2844NDz1qrf8;
        Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BDf282DTBz1qxpQ;
        Sat, 25 Jul 2020 23:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 81Xzyg1Q-2AQ; Sat, 25 Jul 2020 23:13:50 +0200 (CEST)
X-Auth-Info: huBxnMaJB8bGmdibLzzsadZvQwPexTv+ulkegwVSOVg=
Received: from desktop.lan (ip-86-49-101-166.net.upcbroadband.cz [86.49.101.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 25 Jul 2020 23:13:50 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: Add DT bindings for Powertip PH800480T013
Date:   Sat, 25 Jul 2020 23:13:34 +0200
Message-Id: <20200725211335.5717-2-marex@denx.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725211335.5717-1-marex@denx.de>
References: <20200725211335.5717-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT bindings for Powertip PH800480T013 800x480 parallel LCD,
this one is used in the Raspberry Pi 7" touchscreen display unit.

Signed-off-by: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
---
 .../panel/powertip,ph800480t013-idf02.yaml    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
new file mode 100644
index 000000000000..8a2a4f79f365
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,ph800480t013-idf02.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,ph800480t013-idf02#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: POWERTIP PH800480T013-IDF2 7.0" WVGA TFT LCD panel
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: powertip,ph800480t013-idf02
+
+  power-supply: true
+  backlight: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+
+...
-- 
2.27.0

