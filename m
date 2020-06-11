Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A373FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 11:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB202072F
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 11:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgFKLKu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 07:10:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6075 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726708AbgFKLKk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Jun 2020 07:10:40 -0400
X-IronPort-AV: E=Sophos;i="5.73,499,1583161200"; 
   d="scan'208";a="49411148"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2020 20:10:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EDC7042B6920;
        Thu, 11 Jun 2020 20:10:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] iommu/renesas: Add support for r8a77961
Date:   Thu, 11 Jun 2020 20:10:28 +0900
Message-Id: <1591873830-10128-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series is based on next-20200611.

Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a77961 support
  iommu/renesas: Add support for r8a77961

 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
 drivers/iommu/ipmmu-vmsa.c                                      | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.7.4

