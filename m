Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055E1C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3D172082F
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574768601;
	bh=gvbc22urDlGEi7DLkJu6TR7vk+R6ylvtCJtCBsI0/i8=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=hKckZFu1LUmfb/LqQfH8XwHdlIvaFmghXl5FoDaLU8QUbKgPAQexoe0XUxenDc4MD
	 o4wt4ZBXdj40Sb9OyXRaIeoGAsyrMYU5PoPiWOWyWykOheMz/s6GDXfFoYX9HN5aVo
	 KIYodscakmPnzWlUtHpljrRDtNitTyiu4bu6mINI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfKZLnV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:43:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:35066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfKZLnV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 06:43:21 -0500
Received: from e123331-lin.home (amontpellier-657-1-18-247.w109-210.abo.wanadoo.fr [109.210.65.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 109812080F;
        Tue, 26 Nov 2019 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574768600;
        bh=gvbc22urDlGEi7DLkJu6TR7vk+R6ylvtCJtCBsI0/i8=;
        h=From:To:Cc:Subject:Date:From;
        b=Js9pYrzMI6uR5VZqZMGt5lXU7OWEV/GxIHdCLzNYcR5mAgiUAEXXT1ATE+lGh5u6n
         hwewMM3t/Tqd32FjRszlxYs49hBj/twWQOXj7nfqiD85yKLS6KwQZgkF130e0i4JVF
         BRu3Rpm6ERDJ8O8bxDvYzL52J6dz8SkgpPLKBIvw=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 0/8] dt: amd-seattle: update SMMU, PCIe and cache descriptions
Date:   Tue, 26 Nov 2019 12:43:11 +0100
Message-Id: <20191126114319.2755-1-ardb@kernel.org>
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

Changes since v1:
- add missing dma-coherent properties to xgbe SMMU nodes
- add patch to disable GPIO and IPMI blocks on B0 silicon
- add patch to include DT descriptions of the CPU and cache topologies

Cc: Brijesh Singh <brijeshkumar.singh@amd.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>

Ard Biesheuvel (8):
  dt: amd-seattle: remove Husky platform
  dt: amd-seattle: remove Overdrive revision A0 support
  dt: amd-seattle: upgrade AMD Seattle XGBE to new SMMU binding
  dt: amd-seattle: fix PCIe legacy interrupt routing
  dt: amd-seattle: add a description of the PCIe SMMU
  dt: amd-seattle: add description of the SATA/CCP SMMUs
  dt: amd-seattle: disable IPMI controller and some GPIO blocks on B0
  dt: amd-seattle: add a description of the CPUs and caches

 arch/arm64/boot/dts/amd/Makefile              |   4 +-
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     |  17 +-
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     |   6 +
 arch/arm64/boot/dts/amd/amd-overdrive.dts     |  66 ------
 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi | 224 ++++++++++++++++++
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  |  66 ++++--
 .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      |  18 +-
 arch/arm64/boot/dts/amd/husky.dts             |  84 -------
 8 files changed, 290 insertions(+), 195 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
 create mode 100644 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
 delete mode 100644 arch/arm64/boot/dts/amd/husky.dts

-- 
2.17.1

