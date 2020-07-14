Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EB3C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F1E222226
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594710800;
	bh=rDhbGvCqBc5qk7qu3M/g+nT1J2rIXk8oam06CO8RgGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=yfmngiDSGEKahkXOz9AFOV0foqqa5KZsdKowhuP+HgTPd6skGFf+mfvBuq7HxFDSB
	 F4nqeDOboikXv3sKatnUgT5dINBJTcnjBwDbNf46DhRoz0z8Ctlz80mDZ35bCErOwX
	 /9Wde0tbnx8+G9LKVyqbZNkFm6+1phKja/XpVJYI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgGNHNT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 03:13:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbgGNHNT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 03:13:19 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C97342220F;
        Tue, 14 Jul 2020 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594710798;
        bh=rDhbGvCqBc5qk7qu3M/g+nT1J2rIXk8oam06CO8RgGQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PmNE01MnT5VBTE01AE6Q8G5DNRXf0MO1AirTJDxdPVe6c2tx7RjNv1cBhsDqYnB6I
         y3RjjOdpaIeCu/tSL735RmrgpgggPhx72lysBMK8gG0qciY8P9XLTlgiEDVyYhp5gV
         RNoBxHB024ZUdJELanZ212tIlW4oVmo115ncM4XE=
Received: by wens.tw (Postfix, from userid 1000)
        id E239A5FA8D; Tue, 14 Jul 2020 15:13:13 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color property
Date:   Tue, 14 Jul 2020 15:13:01 +0800
Message-Id: <20200714071305.18492-2-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Some LCD panels do not support 24-bit true color, or 8bits per channel
RGB. Many low end ones only support up to 6 bits per channel natively.

Add a device tree property to describe the native bit depth of the
panel. This is separate from the bus width or format of the connection
to the display output.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index 0cd74c8dab42..8eb013fb1969 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -26,6 +26,9 @@ properties:
   height-mm: true
   label: true
   panel-timing: true
+  bits-per-color:
+    description:
+      Shall contain an integer describing the number of bits per color.
   port: true
   power-supply: true
   reset-gpios: true
@@ -42,6 +45,7 @@ examples:
     panel {
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
+        bits-per-color = <8>;
         power-supply = <&vcc_supply>;
         backlight = <&backlight>;
 
-- 
2.27.0

