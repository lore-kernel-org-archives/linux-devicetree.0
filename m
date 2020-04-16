Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0A9C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9784920784
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Cvry6dAq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439341AbgDPHeq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:34:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6231 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHep (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 03:34:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a870001>; Thu, 16 Apr 2020 00:34:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Apr 2020 00:34:44 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:44 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:44 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a910000>; Thu, 16 Apr 2020 00:34:44 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 0/4] Tegra XUDC support on Tegra194 Soc
Date:   Thu, 16 Apr 2020 13:04:16 +0530
Message-ID: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022471; bh=WGWsXBGjVNAF9MTyr/8Av9p7t7MtwWUDSCVP9RaLjYU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Cvry6dAqsoE//M0k5t/Ig/f/O6aNpjTasH5/9RZxrnFQLm9Zb2qXn1LHK8VHzBT9U
         hUlLfwRqhu7iGm17G70Yu6C8TP3StMEB+cMSbFsFFusG0VKLTl3jluSqhl0yFaK3k7
         XneTv3btVWvmR8KAIdwhxwU+ezxHc8SvWncsVH4CTca0NysFXSPn8fovumLdEtcN4o
         JI22c1TZOpJlMvCvg6wEIhXh0EurT7uJ9sUi7neh8EvHiBobsryQ3pUWO/rwCqfy3F
         B2oL7ocn+ruL+28aSLXQXScvEzDH1IzWRvbCEJmUw+eIlg/oiMt8rsyBMAIm39z1Ea
         SoLNJjhTg97iw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series adds support for XUSB Device Mode support on Tegra194 SoCs.

This patchset is composed with:
 - dt bindings of XUDC driver.
 - dt changes to add xudc node on Tegra194 Soc.
 - USB driver changes to tegra-xudc to add support on Tegra194 Soc. 

Nagarjuna Kristam (4):
  dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
  arm64: tegra: Add xudc node for Tegra194
  usb: gadget: tegra-xudc: Add Tegra194 support
  usb: gadget: tegra-xudc: add port_speed_quirk

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  18 +++
 drivers/usb/gadget/udc/tegra-xudc.c                | 130 +++++++++++++++++++++
 3 files changed, 150 insertions(+)

-- 
2.7.4

