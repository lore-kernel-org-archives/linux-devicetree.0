Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7242EC3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4995824650
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Dk5KDX75";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VR/gyYZN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgBNMYs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:24:48 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:45695 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727970AbgBNMYr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:24:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5411F3AF4;
        Fri, 14 Feb 2020 07:24:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=rwNWZVmBtWdIw
        bVzvsN+k7pWGqA8/J3u/JzQZKfK/0g=; b=Dk5KDX75Rdys5uWQNp1Z7IZv73T1L
        NXyS/ORyZKSr0hJ5cmcH2Gdm+qzA3x0PIroSHAaq/rb9V+g2EjDLP/3UPYr1Q0/M
        1uxoaHODNBKQyVVPh2beBYgtoPYvWfBZTSJKttff6UDUn4rSNQRHQmiY7Z7r6yCl
        MNtiG/QcwhaA7BBze3F1Nr0QGAVYIcSSQzw8b2qe/HGuhxWRAz0mV5TmSECFLpdT
        p00I/ZYYaHTsfjUL9u2GwrqYC56S9IJwYm9E/Prevf1k1fEkBjzIqMgqjnqPaVu8
        0Jbyx13l+G9Jsx8yERKKrASwqu1tbl4chm4FeOaK6MIj7PFBdee5XAMZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=rwNWZVmBtWdIwbVzvsN+k7pWGqA8/J3u/JzQZKfK/0g=; b=VR/gyYZN
        MYWlElM8PX+S9WhqzOFDtu+IgOWAnXf2ZajoqneO/wGvw72vIbGRGD1T9RcTSGge
        NjdzGM5bIZfnrDjePBk2bF5kjAvn8aJvphbnnV3gIKO3WtdYTinnRzuPDTO5Sp/D
        fejmX0YsyIL6B+A/+Z4N9X5s6k8sbAKwS0TWgZIGkwtbJGEmFEPNAg5rOLCu6iRu
        0vTHDegH9GMxdnRGMi1zbvsA2YeunFz0iudtbfVXMbCS/Ss0iKuSPlp6IVRm0xcS
        MdRlm5Wb1TnYE4ZEdst84QXu9qIjiXLHCgqK5JIpCdRJzxAYYjuzhbXMKPj7fuNK
        LS1ZyJBh9HfDTg==
X-ME-Sender: <xms:j5FGXkZDtxIwiDKf_NaxbDoNzmBCyAFHbRPfHWBP3HO6VETR9S8ucA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:j5FGXqnG_yYnQZVRR7eGanLgTLF-QfZfE2g6RADczxsoSpkQngsfXQ>
    <xmx:j5FGXizqZ1XEveghUbyyzRkGPddBD8Lfr4cu7lJ2mf76T1gEQ5zdZg>
    <xmx:j5FGXo9C36DFX4OvBNRMcid42hiVAqPhtt6u5_0LmGaigjWV0MW5lQ>
    <xmx:j5FGXo9-nSad-XhG1rgsF8stvC43tzLRJNcPflMjR1djxKQCeEM68Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E69EA3060EF5;
        Fri, 14 Feb 2020 07:24:46 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock and data polarities
Date:   Fri, 14 Feb 2020 13:24:39 +0100
Message-Id: <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some LVDS encoders can support multiple polarities on the data and
clock lanes, and similarly some panels require a given polarity on
their inputs. Add a property on the panel to configure the encoder
properly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 ++++++++-
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index d0083301acbe..4a1111a1ab38 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -90,6 +90,16 @@ properties:
       CTL2: Data Enable
       CTL3: 0
 
+  clock-active-low:
+    type: boolean
+    description: >
+      If set, reverse the clock polarity on the clock lane.
+
+  data-active-low:
+    type: boolean
+    description: >
+      If set, reverse the bit polarity on all data lanes.
+
   data-mirror:
     type: boolean
     description:
-- 
git-series 0.9.1
