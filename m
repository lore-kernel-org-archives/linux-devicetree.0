Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6448DC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3209520657
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c2gNxClB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgEOIFb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:05:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33128 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgEOIFb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:05:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F85Ucl013167;
        Fri, 15 May 2020 03:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589529930;
        bh=EM9zUSo0fhDP9BOxDTWr1AQdFGmmdRFuTuqAPxr1YVw=;
        h=From:To:CC:Subject:Date;
        b=c2gNxClBKsm1mqW4Pu2UbF40x5Awe7pFDwU4A9MdgbT+GZXNMcSSh5sQcZ79tZxir
         DONsybLIrAhH6bHPO9ijlgEUFCgY6mDyO097Ppqf1XqUs+4oLlrxeiHCMg/labaJ+D
         hQb7cvNxIOBwEh1u96GzTK68H+GgzT8ImD6VF4QQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F85Ujc103055
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 03:05:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:05:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:05:29 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85RTd069544;
        Fri, 15 May 2020 03:05:28 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 0/4] phy: omap-usb2: add quirk to disable charger detection
Date:   Fri, 15 May 2020 11:05:14 +0300
Message-ID: <20200515080518.26870-1-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This series does 3 things
- header cleanup
- convert DT binding to YAML
- add DT property to disable charger detection (Errata i2075 for AM65 SR1.0)

cheers,
-roger

Roger Quadros (4):
  phy: omap-usb2: Clean up exported header
  dt-binding: phy: convert ti,omap-usb2 to YAML
  dt-binding: phy: ti,omap-usb2: Add quirk to disable charger detection
  phy: omap-usb2-phy: disable PHY charger detect

 .../devicetree/bindings/phy/ti,omap-usb2.yaml | 78 +++++++++++++++
 .../devicetree/bindings/phy/ti-phy.txt        | 37 --------
 drivers/phy/ti/phy-omap-usb2.c                | 95 ++++++++++++++++---
 include/linux/phy/omap_usb.h                  | 69 +-------------
 4 files changed, 164 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

