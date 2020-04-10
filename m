Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D61AC2BB55
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 10:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C73720B1F
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 10:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgDJKCV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 06:02:21 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42126 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725861AbgDJKCU (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 Apr 2020 06:02:20 -0400
X-IronPort-AV: E=Sophos;i="5.72,366,1580742000"; 
   d="scan'208";a="44156013"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2020 19:02:20 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 098D0400A11C;
        Fri, 10 Apr 2020 19:02:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org, robh+dt@kernel.org
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dt-bindings: dma: renesas,{rcar,usb}-dmac: convert to json-schema
Date:   Fri, 10 Apr 2020 19:02:01 +0900
Message-Id: <1586512923-21739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series is based on linux-next / next-20200409 tag.

Yoshihiro Shimoda (2):
  dt-bindings: dma: renesas,rcar-dmac: convert bindings to json-schema
  dt-bindings: dma: renesas,usb-dmac: convert bindings to json-schema

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  | 117 ----------------
 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml | 148 +++++++++++++++++++++
 .../devicetree/bindings/dma/renesas,usb-dmac.txt   |  55 --------
 .../devicetree/bindings/dma/renesas,usb-dmac.yaml  |  99 ++++++++++++++
 4 files changed, 247 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml

-- 
2.7.4

