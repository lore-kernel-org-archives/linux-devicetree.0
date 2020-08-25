Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35818C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 132DE20706
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 17:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jMwLvSLh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHYRV5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 13:21:57 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50656 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHYRV4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 13:21:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLrtv113643;
        Tue, 25 Aug 2020 12:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598376113;
        bh=KXmEpLqmP1Suj7FeBm1tTeC2IzIG1u10sKJ/8kBoU9g=;
        h=From:To:CC:Subject:Date;
        b=jMwLvSLhk2WG19XAeISplRVYQ/h+GpHHmuiGA7Or9dfaFdQS9h5Vdx8IUGpTNLoUI
         UPmP81cqWNpHYmf9NlybQivCH2ahMfwFBKkYcPWOkLjAI15vGVX4DXwLOFOGB4WLzQ
         RIcl41cgz4olSYQK+rjfyksnL+Z6MxPbaE2tnnrk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLqpX003006;
        Tue, 25 Aug 2020 12:21:53 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 25
 Aug 2020 12:21:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 25 Aug 2020 12:21:52 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07PHLqpN054185;
        Tue, 25 Aug 2020 12:21:52 -0500
Received: from localhost ([10.250.70.134])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 07PHLqt7098514;
        Tue, 25 Aug 2020 12:21:52 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/8] Add C66x & C71x DSP nodes on J721E SoCs
Date:   Tue, 25 Aug 2020 12:21:37 -0500
Message-ID: <20200825172145.13186-1-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nishanth,

The following is a revised version of the series [1] that adds the base
dt nodes for the 2 C66x and 1 C71x DSP remote processors present in MAIN
domain on J721E SoCs, and the required nodes to boot these successfully
on J721E EVM board. It addresses the cleanup comments from you.

The patches are based on top of the pending ABI 3.0 pull-request [2] and
I have used your temporary staging branch [3] as the baseline.

Main changes in v2:
- Patch 1 is new, and moves all the mailbox dts nodes from the common
  board dts file to the k3-j721e-som-p0.dtsi file
- Patches 3 & 6 are reworked to add the mboxes properties directly
  in the k3-j721e-som-p0.dtsi file
- Patches 4 & 8 are rebased versions to sit on top of the modified
  mailbox addition patches
- Patches 2, 5 and 8 are unchanged

regards
Suman

[1] https://patchwork.kernel.org/cover/11725347/
[2] https://lore.kernel.org/patchwork/patch/1295019/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git/log/?h=ti-k3-dts-stage

Suman Anna (8):
  arm64: dts: ti: k3-j721e-som-p0: Move mailbox nodes from board dts
    file
  arm64: dts: ti: k3-j721e-main: Add C66x DSP nodes
  arm64: dts: ti: k3-j721e-som-p0: Add mailboxes to C66x DSPs
  arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for C66
    DSPs
  arm64: dts: ti: k3-j721e-main: Add C71x DSP node
  arm64: dts: ti: k3-j721e-som-p0: Add mailboxes to C71x DSP
  arm64: dts: ti: k3-j721e-som-p0: Add DDR carveout memory nodes for
    C71x DSP
  arm64: dts: ti: k3-j721e-som-p0: Reserve memory for IPC between RTOS
    cores

 .../dts/ti/k3-j721e-common-proc-board.dts     |  93 -----------
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |  38 +++++
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi   | 153 ++++++++++++++++++
 3 files changed, 191 insertions(+), 93 deletions(-)

-- 
2.28.0

