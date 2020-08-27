Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6901CC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D60022B4D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 06:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OMxdDhSI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgH0Gv5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 02:51:57 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35346 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgH0Gv4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Aug 2020 02:51:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07R6poCh055314;
        Thu, 27 Aug 2020 01:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598511111;
        bh=EZ4urYCDzsakd4EjKZOL9fkuGwP7G5Fa2CggJybcyuw=;
        h=From:To:CC:Subject:Date;
        b=OMxdDhSI49NlzXSChF9u+IUIg+cCmbccUF3D7cAzwsZWjbWM1Qz46Ik5YJBQh6viw
         nnBg+8hJAHhOQUunGqfuYaPhSkuVvaMJ7QOh18eOoKBwv//Iv17SPp8qOEAM7rHA0W
         DakhzooGS2OINEaC/OcQR6KsCPiZkIzXQ+hnf6CA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07R6pokY011128
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Aug 2020 01:51:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 27
 Aug 2020 01:51:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 27 Aug 2020 01:51:50 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07R6pjof112178;
        Thu, 27 Aug 2020 01:51:46 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 0/4] arm64: Initial support for Texas Instrument's J7200 Platform
Date:   Thu, 27 Aug 2020 12:21:40 +0530
Message-ID: <20200827065144.17683-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds initial support for latest new SoC, J7200, from Texas Instruments.

The J7200 SoC is a part of the K3 Multicore SoC architecture platform.
It is targeted for for automotive gateway, vehicle compute systems,
Vehicle-to-Vehicle (V2V) and Vehicle-to-Everything (V2X) applications.
The SoC aims to meet the complex processing needs of modern embedded products.

See J7200 Technical Reference Manual (SPRUIU1, June 2020)
for further details: https://www.ti.com/lit/pdf/spruiu1

Changes since v1:
- Swapped Patch 1 and 2 as suggested by Nishanth.
- Added description for each SoC in yaml bindings.

Testing:
- ./scripts/checkpatch --strict
	- Few warningns about Line length exceeding 100 columns.
	  But these are corresponding to comments
- v8make dtbs_check
- DT_SCHEMA_FLAGS="-u"
  DT_SCHEMA_FILES="Documentation/devicetree/bindings/arm/ti/k3.yaml"
  v8make dtbs_check
- DT_SCHEMA_FLAGS="-u"
  DT_SCHEMA_FILES="Documentation/devicetree/bindings/arm/ti/k3.yaml"
  v8make dt_binding_check


Lokesh Vutla (4):
  dt-bindings: arm: ti: Convert K3 board/soc bindings to DT schema
  dt-bindings: arm: ti: Add bindings for J7200 SoC
  arm64: dts: ti: Add support for J7200 SoC
  arm64: dts: ti: Add support for J7200 Common Processor Board

 .../devicetree/bindings/arm/ti/k3.txt         |  26 ---
 .../devicetree/bindings/arm/ti/k3.yaml        |  35 +++
 MAINTAINERS                                   |   2 +-
 arch/arm64/boot/dts/ti/Makefile               |   3 +-
 .../dts/ti/k3-j7200-common-proc-board.dts     |  64 ++++++
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     | 199 ++++++++++++++++++
 .../boot/dts/ti/k3-j7200-mcu-wakeup.dtsi      |  84 ++++++++
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi   |  29 +++
 arch/arm64/boot/dts/ti/k3-j7200.dtsi          | 165 +++++++++++++++
 9 files changed, 579 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
 create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200.dtsi

-- 
2.28.0

