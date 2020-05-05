Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B345C47256
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24FCF206B9
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="sWtGjDr0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RDd86n/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgEEKJn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 06:09:43 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58865 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728401AbgEEKJn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 06:09:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 238115C00CB;
        Tue,  5 May 2020 06:09:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 05 May 2020 06:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=kxz6dVnKinrsF
        EyoSwmLmcaIKY2++Ip3fyKHn+I7HeI=; b=sWtGjDr00xMO3OAuhCR5Uf1uNS1mF
        XPcIoWSnz7UPFr6PjLuNQ5k2Q9Y/vRVTv6eX8p1ygcJHFcDbg44fhllqNp/z5Bjb
        Wgsszwhuvn4VuLvyNJkU/aRwVcSsrTaGCUB61mzQGMsVWnPWFZrtCluukXPk8r/t
        Z55wOneR/4iir9tmks/2gXZGV99SO8PhaCJIILshBL+jdDNpn46FkkHAOMnfk2+M
        8fOJGyD4Vw/A9aTFhIIQdyCdj0kvxMGT9C5uok9Kp1HMcuSzO86YTriCvywfZ6bS
        hCq0CjuZXLJ7EfSoAQkCc7camX10PoylIN4Yc62y7sjYu+QTpszmztBVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=kxz6dVnKinrsFEyoSwmLmcaIKY2++Ip3fyKHn+I7HeI=; b=RDd86n/8
        3kW/DV7CJTIvyUuPBfjEdW9pKE+GbJxN5/6/wZ2iyWoiHFVQfbNKkjr+3Q7CkY/c
        43Bwxw1k+GOWD1XmUK4wBpwtU7B1Kj62Thgqpx7733zJfiB+ddueptgno5FqyPQA
        u+CU8osIS+6KNRt4zKKMXFk+wy9XQVzdGPOr4i012eIJ9YprgkBQLv24MEJehkSp
        oRP54ki+GTjSLpED8q7Vrb7FusuUdTayts3eZPhzSkIfgBkY938zX1MITLwoUQz5
        PGy8VnVU2ej9sEbmqpXKdXSh8ivRlSxy7UxZaCRY61ADT9+0lf4S2at2TcnuW5BG
        UO0ZPG3jRqt+PA==
X-ME-Sender: <xms:ZjuxXvPQUZdGJG919kPZZ1pqbBkLp5LzBO5Bn_oZlBQYFu2qqFxgqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeigddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZjuxXkFnmWBEdc6k0orXS39qmuHXaH9qXVwcqMBQUHpzBptMkWY-mw>
    <xmx:ZjuxXv_l2lXsX7GF7PaYxC1BO-cAgvvGW1CkVkipPQTcPcQseWePbA>
    <xmx:ZjuxXibZJuSskFNhzb8jzgDlZV6eH3r1kcu8k_XtmfYGeCIReW4Zkg>
    <xmx:ZjuxXsT5TOfCa0Gcup5G2IoABNUx6Wkm7RLeXZZnzl7U0980Jraj1g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B149F328005D;
        Tue,  5 May 2020 06:09:41 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 2/5] dt-bindings: display: sun8i-mixer: Allow for an iommu property
Date:   Tue,  5 May 2020 12:09:31 +0200
Message-Id: <ef88e9d96eafe3f921cfbe087c5f0a25a5dd41ac.1588673353.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The H6 mixer is attached to an IOMMU, so let's allow that property to be
set in the bindings.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index 1dee641e3ea1..c040eef56518 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -36,6 +36,9 @@ properties:
       - const: bus
       - const: mod
 
+  iommus:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
-- 
git-series 0.9.1
