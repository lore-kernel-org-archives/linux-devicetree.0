Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73EAC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2AFA2067D
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 21:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YEpSo5AA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgGWVLm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 17:11:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59584 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgGWVLm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 17:11:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBdGu097996;
        Thu, 23 Jul 2020 16:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595538699;
        bh=mddWor3T4cUAeqK3ZXp1pWXlDw8KkoBZyTIOadqQLLI=;
        h=From:To:CC:Subject:Date;
        b=YEpSo5AA0MTV6zpAxfwZn5U9j+kXBK+511jslgr+dlt7Pnw1xZpuSQ1a2E2waDXVR
         2MV/lLAkHQ3ygNGHDDtsylOs+hnwJk+bolYgmEMVoyBw2v7W0qLmFoI9WE3fhfwdvR
         UTp/8N9gn15UMDpwiu2eIx2vJH+vUjeS4Q8aVJAM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06NLBduw067243
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jul 2020 16:11:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Jul 2020 16:11:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Jul 2020 16:11:39 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06NLBdjT101897;
        Thu, 23 Jul 2020 16:11:39 -0500
Received: from localhost ([10.250.34.248])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 06NLBdew048239;
        Thu, 23 Jul 2020 16:11:39 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Fix TI K3 cbass interconnect node names
Date:   Thu, 23 Jul 2020 16:11:35 -0500
Message-ID: <20200723211137.26641-1-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tero, Nishanth,

Following are couple of minor fixes that fix the node names
for the interconnect bus nodes on K3 AM65x and J721E SoCs. These
fix the following warnings seen with dtbs_check on the K3 dtbs.

'interconnect@100000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
'interconnect@28380000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Lokesh has already used the correct name in his initial
submission for J7200 SoCs.

regards
Suman

Suman Anna (2):
  arm64: dts: ti: k3-am65: Fix interconnect node names
  arm64: dts: ti: k3-j721e: Fix interconnect node names

 arch/arm64/boot/dts/ti/k3-am65.dtsi  | 6 +++---
 arch/arm64/boot/dts/ti/k3-j721e.dtsi | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.26.0

