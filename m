Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C701FC619A
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 02:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50F2321882
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 02:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfKHCRN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 21:17:13 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:53601 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfKHCRN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 21:17:13 -0500
X-Halon-ID: 87a563be-01cd-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 87a563be-01cd-11ea-837a-0050569116f7;
        Fri, 08 Nov 2019 03:14:44 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] dt-bindings: rcar-vin: Remove paragraph about aliases
Date:   Fri,  8 Nov 2019 03:16:07 +0100
Message-Id: <20191108021609.2584272-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It might be convenient to have aliases but it's not required, drop the
sentence as it's not true and not used in Gen3 DTS files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,vin.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
index e30b0d4eefdd84ae..e6136d43b0775269 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
@@ -41,9 +41,6 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
  - interrupts: the interrupt for the device
  - clocks: Reference to the parent clock
 
-Additionally, an alias named vinX will need to be created to specify
-which video input device this is.
-
 The per-board settings for Gen2 and RZ/G1 platforms:
 
 - port - sub-node describing a single endpoint connected to the VIN
-- 
2.23.0

