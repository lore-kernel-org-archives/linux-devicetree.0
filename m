Return-Path: <SRS0=S3xR=6R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3937AC28CBC
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 May 2020 09:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C92B20721
	for <linux-devicetree@archiver.kernel.org>; Sun,  3 May 2020 09:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgECJly (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 May 2020 05:41:54 -0400
Received: from hel-mailgw-01.vaisala.com ([193.143.230.17]:27755 "EHLO
        hel-mailgw-01.vaisala.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgECJly (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 May 2020 05:41:54 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Sun, 03 May 2020 05:41:53 EDT
IronPort-SDR: Pge1fcSvg0qkgP47NgKQJB8roQFytD/NafQUADzmlYq+3W31lqiwkYbzV2pImx/XWbKQH95Pe/
 i/zUSuegvEvYTO30nADvhjFze+MCp5i91N3c2PobJ2Le8Hb5q3SoSyPuIbSKUefBjYclPsr/kg
 r6spinh5XjKEnEssIjCiOkGoyzhfxegPoWccUXkQbrwUr0GcU+D8PrMynLbgCtjHdaUZb5HDpG
 Z39ii8JAV66Mv2lrmfAbB+GtT6UqP3RwpFMBI6RF4BVMcwowwgO/UGCdPsCGPlYjfoS0g/5DG1
 bYw=
X-IronPort-AV: E=Sophos;i="5.73,347,1583186400"; 
   d="scan'208";a="278321437"
From:   =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= 
        <vesa.jaaskelainen@vaisala.com>
To:     devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= 
        <vesa.jaaskelainen@vaisala.com>
Subject: [PATCH] dt-bindings: vendor-prefixes: Add Vaisala
Date:   Sun,  3 May 2020 12:33:55 +0300
Message-Id: <20200503093355.46964-1-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2020 09:34:41.0851 (UTC) FILETIME=[129D28B0:01D6212E]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Vaisala Oyj is a company based in Finland and also has subsidiaries in other
countries. Vaisala develops, manufactures and markets innovative products and
services for environmental and industrial measurement.

https://www.vaisala.com/

Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..579391c41079 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1065,6 +1065,8 @@ patternProperties:
     description: Aigo Digital Technology Co., Ltd.
   "^v3,.*":
     description: V3 Semiconductor
+  "^vaisala,.*":
+    description: Vaisala
   "^vamrs,.*":
     description: Vamrs Ltd.
   "^variscite,.*":
-- 
2.17.1

