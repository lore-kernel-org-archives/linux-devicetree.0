Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57D8C2D0C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:24:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CCAE21D7D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pt+xc5Nf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfLSIYE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:24:04 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57914 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLSIYE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:24:04 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8Nc1g021997;
        Thu, 19 Dec 2019 02:23:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576743818;
        bh=KBG5iq2J57LxDEJ/48Wb0cURBv3cJ3Ry7vLG+uPUAGU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pt+xc5NfacCXvEFsiXoZ9/SU4Mszsv0yR8NzvD1CHIC3zbxkhgvjjI2SsEdjwo896
         wfsim/toGtMTBYO5tbIadPAZNaXAYvXguQO367BCPpo7jpLB7nLv5cPRlLZHabkAh0
         p6lHYPrbUEX9MfQUzTJGeLPKTDyM5GmN2tDI7/w0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBJ8NcJt117625
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Dec 2019 02:23:38 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Dec 2019 02:23:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Dec 2019 02:23:37 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBJ8NJI9095098;
        Thu, 19 Dec 2019 02:23:34 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <subhajit_paul@ti.com>,
        <praneeth@ti.com>, <yamonkar@cadence.com>, <sjakhade@cadence.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>, <maxime@cerno.tech>
Subject: [PATCH v4 5/5] MAINTAINERS: add entry for tidss
Date:   Thu, 19 Dec 2019 10:23:19 +0200
Message-ID: <e6caaa23c15880984545d1734343725e3abe1bd4.1576704528.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1576704528.git.jsarha@ti.com>
References: <cover.1576704528.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add entry for tidss DRM driver.

Version history:

v2: no change

v3: - Move tidss entry after omapdrm
    - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"

v4: no change

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 741e3f433f6e..e89fbfb1ce06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5559,6 +5559,17 @@ S:	Maintained
 F:	drivers/gpu/drm/omapdrm/
 F:	Documentation/devicetree/bindings/display/ti/
 
+DRM DRIVERS FOR TI KEYSTONE
+M:	Jyri Sarha <jsarha@ti.com>
+M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	drivers/gpu/drm/tidss/
+F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
+F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 DRM DRIVERS FOR V3D
 M:	Eric Anholt <eric@anholt.net>
 S:	Supported
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

