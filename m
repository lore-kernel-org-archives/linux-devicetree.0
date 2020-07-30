Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495C3C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 09:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2672620809
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 09:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="DQ1hbYVe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fBRVXkDe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgG3Jf0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 05:35:26 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39539 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726615AbgG3Jf0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jul 2020 05:35:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8E2845803D1;
        Thu, 30 Jul 2020 05:35:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=JhmDU/H53yjm/GLpBmlQQFXIqh
        S4PzEIc+njySpKR2M=; b=DQ1hbYVep/s2sBYcbcNr35ycMeb40Oi4niM1Aih3vv
        Z5CdzN05Zd6xT0UOFL4bEGDrTpht25WoXX6Bsq7QNw4KyIwRFY2yoMnt7ALsUeA6
        LpUNQBY7HFoFV3NDF/Y00MlARftwf26Gds8nBwxVWiscmMQ3hqc1d6x2dvZt6TbW
        XT6VfdQ1dSpVH9X2sCXWg3u5PyFvNyUWd9QV1oXgv5LU+WsVlACKMG/fU8GTEG7q
        /VRCzjWaxFwZQBVeU+SEvWU8Mt6ABg2+LV3usNOUXjnDDKK2XBwpBw8AA8RCVvGn
        tbdCFLwQHxBWbDo8ZNSEpULs5s53+IK24mtc6Y01WMvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JhmDU/H53yjm/GLpB
        mlQQFXIqhS4PzEIc+njySpKR2M=; b=fBRVXkDeOVu2FeIDe4JgEBJ87V8T3ZdmE
        GFBHB70IHYu7D6T4aTtdQXHohNb8cAI6XaoEK4495NPWUcYR5/669/LyAMtkioqC
        mmldtTvV9RutAHiG21BMkbJFxDVkStDSRI2gn7xEp4iLd6kkVDh/oGeaP0d1sdAf
        Sngj0/tAoh9msiQDdUFaeBSI3wBBydpiMmTuKwO7em1Ll8HbyQHgTT+iZtRYq1d5
        24WMSnF1DDHGSUWRLOMkXxrk6vKGg/SPe/APD+qStSDeWvJqD7eBcZYBwfNQDpiU
        Ydno7XH/VbLCLzRthWRJQqQIy+CH4dpIM0RvuQ0h3/xLnwJHMo2HQ==
X-ME-Sender: <xms:W5QiX4NRs2eRVWq5FgWMjZJd1SzQ1EkTePFLfUTxwUB1hZrNq5lTrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
    ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:W5QiX--CT0lohwpjLcZt8Z6QPf2oDZA3SUnInO-2efdD8U6j9po_Vg>
    <xmx:W5QiX_TRMZSxXszij0XFDD1mEPB9KJM4VXc2SVgtYZvQ1NeD6rq5Eg>
    <xmx:W5QiXwsJq0Ws8uXcNfNVVQrutXQbG5PoO-vla-r6hs0OGbFN3cZRiw>
    <xmx:XJQiX46CkFwZ9M3wJhaHWuIJT7Dy5ZBPTvtkizT9YT7c2idk77usGQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id ED99B3280059;
        Thu, 30 Jul 2020 05:35:22 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        dri-devel@lists.freedesktop.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] drm/sun4i: Add support for dual-link LVDS on the A20
Date:   Thu, 30 Jul 2020 11:35:00 +0200
Message-Id: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This is a second attempt at supporting the LVDS dual-link output on the
Allwinner A20.

Let me know what you think,
Maxime

Changes from v1:
  - Reworked the DT bindings
  - Refactored a bit the panel registration in the tcon code.

Maxime Ripard (4):
  drm/of: Change the prototype of drm_of_lvds_get_dual_link_pixel_order
  drm/sun4i: tcon: Refactor the LVDS and panel probing
  drm/sun4i: tcon: Support the LVDS Dual-Link on the A20
  [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the Cubieboard

 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts |  69 ++++++++-
 drivers/gpu/drm/drm_of.c                    |  98 ++++++------
 drivers/gpu/drm/rcar-du/rcar_lvds.c         |   8 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c          | 175 ++++++++++++---------
 drivers/gpu/drm/sun4i/sun4i_tcon.h          |   4 +-
 include/drm/drm_of.h                        |  16 +-
 6 files changed, 242 insertions(+), 128 deletions(-)

base-commit: d113dbba9a18f9ac71edb1a66ae552c9407355f4
-- 
git-series 0.9.1
