Return-Path: <SRS0=EOmc=AX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2FDC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E1A62070B
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="dMY0SU3c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgGLKZQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jul 2020 06:25:16 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9228 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGLKZP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jul 2020 06:25:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0ae4fe0000>; Sun, 12 Jul 2020 03:25:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:25:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 12 Jul 2020 03:25:15 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:25:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:25:15 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0ae50a0000>; Sun, 12 Jul 2020 03:25:14 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] arm64: tegra: A few DT updates for Tegra
Date:   Sun, 12 Jul 2020 11:25:03 +0100
Message-ID: <20200712102506.23686-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594549502; bh=vT93s6iHbge88d+HGxcJPLAamzNc87M0lYca4EgUgSI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=dMY0SU3c8dta9hCw99alwaK3Q9+O89aOvkUZrNnmFXnKzLVdvgfQtxxJisEgniM4D
         /nticV9Z48HDlB62bUFtO8Ayoo+x8+sy14lRr5TkGLDK7OAEcl7NWr32cQcLytj6qH
         Qo54se6UWxErPQosWdZmCTWNZt73mVsdvk5ra/yYv/xcGJsVf2UOGhfw4TDGzrl1cb
         +kx2aBKEglUiqH//0xH1FCsQVh8CdcIcGD6SBAmtKd//PBn+b34+Vq89xrMT4M55t2
         XOgRNG1Qg/G+0Ty9E5DMinIc+mxgvW5aDVQL1EiC9GKHvBbjqikpRLRmJJv8S4voE2
         bW8e0kw3KGB7Q==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds ...

1. Support for Tegra19 Jetson Xavier NX
2. Support for the DFLL on Tegra210 Jetson Nano
3. Fixes VBUS supply for Tegra186 Jetson TX2

Jon Hunter (2):
  arm64: tegra: Enable DFLL support on Jetson Nano
  arm64: tegra: Populate VBUS for USB3 on Jetson TX2

Thierry Reding (1):
  arm64: tegra: Add support for Jetson Xavier NX

 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |  37 ++
 5 files changed, 678 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

-- 
2.17.1

