Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BC3C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 11:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F412078D
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 11:54:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="k4vnjeMY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sxV2YTMI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgFZLyi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 07:54:38 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33207 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726827AbgFZLyi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 07:54:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4CF7C5801B6;
        Fri, 26 Jun 2020 07:54:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Jun 2020 07:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=CkLtbfFWIfT0uZIIIKCd07Py1c
        VQSEqZLsxH7fb1Qmk=; b=k4vnjeMYWR7vbNumRJnTd/Ovj+X0Q6lqrgPNM8AqL0
        K87oJ9L0kWXL7J1kqyjBwHatrV8K6eKDnpg98rAoIkNbu+asHvGq56pPNF70Zepk
        3RJ+lv+MQq8UtF1AEfFqGPduZ2F3KmGaoEsVbyBUZ5YQJHq0Fziz4E4p6dGzVbMR
        FfeQnWapZMcPf7X1qWnRZo2Hh0X7h0QFM//Tp8P04FzOjYm03AIHTgKC37oNGHNE
        BrDctaXAVBaI+JXjDkbMKp8MJSTI8S267E6ThMRxAD4UQYOpbjMqgDwV0Eit3Gy7
        O6sXneICrLGFPiel+4tUlzK2rqE8EkHj7tJAHpKA8pow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CkLtbfFWIfT0uZIII
        KCd07Py1cVQSEqZLsxH7fb1Qmk=; b=sxV2YTMIwqleLcVjv2QqoFoHCvyCRoZpq
        tHnSqJ1MoE9mC765tRgwsZXjU4tHBHAd38M/98g+v68i68CRuEAQVrZV9VgDH3Ej
        GlyoEHW+dcFQ1VBq8mP/u2pPXvkkwFK5dEhUwROaZhPCiwFwYCQnGGulTdmPLt1x
        V/G9UI/HpQ7m2TCpNuefP8VRTsSErXdw21QVZPI61Caco4vnAWZK7V3w1mQMX3ck
        IHuHmhk/NhyvLmjq52TvtRU1ieScSL/X1DpDmy8H4zuBKYRSU26yi5hDTanDNm6p
        pVTmZeZf2SE5PhduaCzwkpr1fnOLv+TBs7ppQhHC8a2ww066kGXrA==
X-ME-Sender: <xms:_OH1XmLUgmRA1Xq6DoxrmlOByxzNEq3UBN7oMZ16FcpA3ZQV0PcKgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeluddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_OH1XuKV0mSX0BJlu-32CP0Soe9zFpnugVKqmTgdMzRHq_9w275AIQ>
    <xmx:_OH1Xms1C0BmnVZ7T-S0WY2ezvk633o06bcCrtCNITvmT6e_wQ77ww>
    <xmx:_OH1XrZMS6QC1YgYVMWNCtmHKyPbr0oZNnxYF3b-a9L4rbaiamb4SA>
    <xmx:_eH1XrNObuWi9_dmVC7cV0ksB4fd3R1LxJcQQjkbPtg6C-Zd66pL9g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3BC25328005E;
        Fri, 26 Jun 2020 07:54:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] dt-bindings: arm: bcm: Add a select to the RPI Firmware binding
Date:   Fri, 26 Jun 2020 13:54:33 +0200
Message-Id: <20200626115433.125735-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The RaspberryPi firmware binding uses two compatible, include simple-bus.
The select statement generated by default will thus select any node that
has simple-bus, not all of them being the raspberrypi firmware node.

This results in warnings being wrongfully reported. Let's add a custom
select statement to fix that.

Fixes: 5bc0b9be8544 ("dt-bindings: arm: bcm: Convert BCM2835 firmware binding to YAML")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

The original binding has been merged through the clock tree, so it should
be merged there.

Even though the original binding (and the DT) are using the simple-bus
compatible, this creates some DTC warnings since the firmware really isn't
a bus, so the node name doesn't match what a bus should have, none of the
children have a reg property, #address-cells and #size-cells are missing,
etc.

I can only guess that simple-bus was used to make the sub-devices probe,
but maybe simple-mfd would be more appropriate here?
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index b48ed875eb8e..17e4f20c8d39 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -10,6 +10,15 @@ maintainers:
   - Eric Anholt <eric@anholt.net>
   - Stefan Wahren <wahrenst@gmx.net>
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: raspberrypi,bcm2835-firmware
+
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
-- 
2.26.2

