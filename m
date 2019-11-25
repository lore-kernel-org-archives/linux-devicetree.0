Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830D8C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BF3D207FD
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574722284;
	bh=DEqIqegvo+wE9S50zfwKx+mnDXMQqN/RRhiVlZMwE/8=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=SrUzba3mUZaIl8LN1bxMYBC0U55RKkf9dvVD2Ju2jPjRLzMgxjDFNkTCGKrpna6cj
	 +HxFjG0iUVF7c+08W5rCS7pVU34dL9MqCV6hvj3K7YiYfayOKlJZ3goNuPWCaslpEB
	 9O+dmOyG+g6xVvTXnRLPEUS2wjhDhrkI9X5WXzcI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfKYWvX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 17:51:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:45458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfKYWvX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Nov 2019 17:51:23 -0500
Received: from e123331-lin.home (lfbn-mar-1-643-104.w90-118.abo.wanadoo.fr [90.118.215.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAC4220748;
        Mon, 25 Nov 2019 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574722283;
        bh=DEqIqegvo+wE9S50zfwKx+mnDXMQqN/RRhiVlZMwE/8=;
        h=From:To:Cc:Subject:Date:From;
        b=OPTXRWyonnht4OgrCp/G+fqLOZ2r5aXOVNuvjeDMt0gpPD18Z3lwaZkfjuIDR+VrS
         Ctb0DkqxXhIU6zTc4CR5+mHEoG1LysavE/bqg/IuXeT55n/RQXzeWqsx1WFCpNpDwZ
         rdeSY6ncfifHiOJitEYmYPXDHkljSU59XzSzYxpg=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, thomas.lendacky@amd.com,
        suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com,
        will@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 0/6] dt: amd-seattle: update SMMU and PCIe descriptions
Date:   Mon, 25 Nov 2019 23:51:04 +0100
Message-Id: <20191125225110.10924-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Bring the DT descriptions for AMD Seattle up to date:
- upgrade the existing SMMU descriptions to the new binding, and add the
  missing descriptions of the PCIe and SATA SMMUs
- fix the description of the PCIe legacy interrupt routing
- remove the obsolete A0 Overdrive and Husky

Ard Biesheuvel (6):
  dt: amd-seattle: remove Husky platform
  dt: amd-seattle: remove Overdrive revision A0 support
  dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
  dt: amd-seattle: fix PCIe legacy interrupt routing
  dt: amd-seattle: add a description of the PCIe SMMU
  dt: amd-seattle: add description of the SATA/CCP SMMUs

 arch/arm64/boot/dts/amd/Makefile              |  4 +-
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     |  4 +
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     |  5 ++
 arch/arm64/boot/dts/amd/amd-overdrive.dts     | 66 ---------------
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  | 53 ++++++++++--
 .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      | 16 +---
 arch/arm64/boot/dts/amd/husky.dts             | 84 -------------------
 7 files changed, 61 insertions(+), 171 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
 delete mode 100644 arch/arm64/boot/dts/amd/husky.dts

-- 
2.17.1

