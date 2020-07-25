Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D32FC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB6DB206D7
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E5WKmgEh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgGYQzd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:55:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45524 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbgGYQzd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:55:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtUZh097388;
        Sat, 25 Jul 2020 11:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595696130;
        bh=J7PAuoTJ9tjaudQfuqumdYnAXEwjoClheRwNhY+RPWE=;
        h=From:To:CC:Subject:Date;
        b=E5WKmgEh5JHfQiR6jrHSJH5WYtlq/lR8RwcXAwqA8Qew0CcFhS+6B5NzXYN4ctfXZ
         eAt06EjmyBdeuR23n+fOx9LTuMmGcpEGAkvW9Nsi0u9nz6RPfGHqbSY4hiTNQOzM6C
         tkt3MpaPGGNYs2A8fqAtPqU6J86udM3H7p3dj6qo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PGtUnv047713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 11:55:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:55:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:55:29 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGtPLD026200;
        Sat, 25 Jul 2020 11:55:26 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/3] arm64: dts: ti: ti-sci-inta/intr: Update to the latest bindings
Date:   Sat, 25 Jul 2020 22:25:21 +0530
Message-ID: <20200725165524.22151-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series updates the DT bindings for intr and inta and its consumer
nodes. 

Based on ti-sci-inta/intr dt binding update series[0]

[0] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=324167

Lokesh Vutla (3):
  arm64: dts: k3-j721e: ti-sci-inta/intr: Update to latest bindings
  arm64: dts: k3-am65: ti-sci-inta/intr: Update to latest bindings
  arm64: dts: k3-am65: Update the RM resource types

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 36 ++++++++--------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 12 +++---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    |  8 ++--
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  4 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     | 10 ++---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 43 ++++++++++---------
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      | 12 +++---
 7 files changed, 61 insertions(+), 64 deletions(-)

-- 
2.27.0

