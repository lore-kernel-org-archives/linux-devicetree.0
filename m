Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EBFC2D0EF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 03:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59C6B2223D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 03:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDQDzZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 23:55:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34404 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgDQDzZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 23:55:25 -0400
X-IronPort-AV: E=Sophos;i="5.72,393,1580742000"; 
   d="scan'208";a="44965826"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Apr 2020 12:55:23 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 46BBC400C43C;
        Fri, 17 Apr 2020 12:55:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, robh+dt@kernel.org
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema
Date:   Fri, 17 Apr 2020 12:55:14 +0900
Message-Id: <1587095716-23468-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series converts rcar-dmac and usb-dmac documantation to
json-schema.

Changes from v1:
 - Add power-domains and resets to required.
 - Fix some properties about related dma channels on patch 2/2.
 - Add Reviewed-by on patch 1/2.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=269169

Yoshihiro Shimoda (2):
  dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
  dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  | 117 ----------------
 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml | 150 +++++++++++++++++++++
 .../devicetree/bindings/dma/renesas,usb-dmac.txt   |  55 --------
 .../devicetree/bindings/dma/renesas,usb-dmac.yaml  | 101 ++++++++++++++
 4 files changed, 251 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml

-- 
2.7.4

