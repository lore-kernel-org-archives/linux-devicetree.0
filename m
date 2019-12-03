Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB653C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EC3D2070A
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386591;
	bh=BychcPu7lm70zZitunmtEsddUySg+pqLJ1oXc3vVrS0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=JpRDfcIQfdqGZLgxp1Y7J+Rz+/ftr4FBh0PA67Z5shLu2L5rNCNrNO7Tp+iQwg5s+
	 Y2nV/FB9SVKjcgKvbb40reOMC6cLs05wxINTq5+0bV9AGPDMq8WQfOY9s2AJytmzlM
	 CFd0UBAXkcWdr9JUn/fSDzSL6jR8vdgWQ520CExI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfLCPXL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:41340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfLCPXL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:11 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6C6720661;
        Tue,  3 Dec 2019 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386590;
        bh=BychcPu7lm70zZitunmtEsddUySg+pqLJ1oXc3vVrS0=;
        h=From:To:Cc:Subject:Date:From;
        b=IcGY4pVDTZJgpyKy+U9jxw92Ev5B33J0cEihWthabE5zcEspzaCKskmSIR8SxfvLi
         E6UYLCot0AXNF491v00lpqsUf5RmUOn/e0KGAaz+gNQecB5mPCcjOI350LA1iucKYU
         Uz74h+YC37ARD6JWS4SNtl0jXBsf4TDntF2sSeNQ=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 0/8] dt: amd-seattle: update SMMU, PCIe and cache descriptions
Date:   Tue,  3 Dec 2019 15:22:58 +0000
Message-Id: <20191203152306.7839-1-ardb@kernel.org>
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

Changes since v2:
- use Cortex-A57 specific compatible strings for CPUs and PMU
- use iommu@... not smmu@.... for SMMU DT node identifiers
- match the entire range of stream IDs 0x0..0x1f for the first SATA port, for
  compatibility with some B0 silicon revision based boards

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
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     |  13 +-
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     |   1 +
 arch/arm64/boot/dts/amd/amd-overdrive.dts     |  66 ------
 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi | 224 ++++++++++++++++++
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  |  70 ++++--
 .../boot/dts/amd/amd-seattle-xgbe-b.dtsi      |  22 +-
 arch/arm64/boot/dts/amd/husky.dts             |  84 -------
 8 files changed, 287 insertions(+), 197 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/amd/amd-overdrive.dts
 create mode 100644 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
 delete mode 100644 arch/arm64/boot/dts/amd/husky.dts

-- 
2.17.1

