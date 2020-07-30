Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0C2C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 09:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C6722075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 09:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="KFlJEgPG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fjTot1oz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgG3Jfb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 05:35:31 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34915 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727044AbgG3Jfa (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jul 2020 05:35:30 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4009E5803E1;
        Thu, 30 Jul 2020 05:35:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 30 Jul 2020 05:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=Ut3ZT+W4+yvZB
        ml4M9YqRFh4J0n6Jv0UFC/16UuzKdY=; b=KFlJEgPGwRR2vjF0Q+fs8WD5ootQt
        hfzR4ffcWWrBRiergQgLJrKzOI3qxt/Em54M68T9w1cWD4J43FRyaIeq+ZY+f7l6
        +jjtodTVelkQhYaUilqC8wSTz5Xlo0dCaQVXsGm/BHtx/ga+JSy7isz52KWljpG8
        oc/S88ZziRnfdk+0GE6mVcwZCYLqoXRn5Y0+Tn7uexo59+B/xQdO9a/4Z3Tcc2Ze
        z5z8fJvBdEjrgunBTHB0JckOy/riYMn62GH2ErbjivTxtCEkrGSc+/PXgUzClpm7
        6Uu/w9hNdv+2yx16rPQobuXYFGHWhWbZl4UIBw5AwH0p+OEpkTPztvO2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=Ut3ZT+W4+yvZBml4M9YqRFh4J0n6Jv0UFC/16UuzKdY=; b=fjTot1oz
        CZm/loUuLwTOf0Xfikhwh/ZO2+/IQs51WirESIfZjNE2IuGUQVZJfcYkD3VNpU65
        4RCy85uxDVmGsRfJsLwvlzajTYSO5kMBgbF6iT1ulDBbEQaLWGWRbDwe3VOGgMJO
        mMc/ZluGrOVyHrcMXCwHTVGXdUvRXyLP5BSI2XTquaxmHTfuFnFaTB88QHHn7Ako
        v2T3aiDc76uVtEaRiEcUFL001gG+MsvBGYg25jfkDpJ8h5N24s6mG0ExrSgbn0zZ
        i58hFmU5BNNEiCo3smOwzFqCnsOvAWE+TcRGtJnM/7tyrsOj3wQYv+aAw8vgSPNz
        pa85ZsHRaditRQ==
X-ME-Sender: <xms:YZQiX0o5WY-1gULOk4Mlb87TvnfdSTSr_c5G-BLg_5YYjzCGWKZEOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeigddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YZQiX6r8o3ZdGDBFBQKvl2YbKTvNt2WmoXjiSg0RqKdR6MojgZMV6Q>
    <xmx:YZQiX5Oo6yjuL4Ilb6Zc7sRrqGz6jAJXnZviA01pRzVen4lfPCoKoA>
    <xmx:YZQiX75EMkxVaIOokm1p-WJ06rHAlc0tH_2s7SmruAOjF7Sp7m0jtQ>
    <xmx:YZQiXwERekDBNxOMoFeA2m6g5Wd5RNnyn2ns5kQ4vNE1UVExhebczQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CD5843280065;
        Thu, 30 Jul 2020 05:35:28 -0400 (EDT)
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
Subject: [PATCH v2 4/4] [DO NOT MERGE] ARM: dts: sun7i: Enable LVDS Dual-Link on the Cubieboard
Date:   Thu, 30 Jul 2020 11:35:04 +0200
Message-Id: <da488b254cfed95796561873f9b400c40f290796.1596101672.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For the sake of the example, let's enable an LVDS Dual-Link display on a
Cubieboard.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts | 69 ++++++++++++++++++++++-
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index b8203e4ef21c..20278a27ec16 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -85,6 +85,49 @@
 			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	panel: panel {
+		compatible = "panel-lvds";
+		width-mm = <153>;
+		height-mm = <90>;
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hfront-porch = <88>;
+			hactive = <1920>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+
+			vfront-porch = <4>;
+			vactive = <1080>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-even-pixels;
+
+				panel_input_0: endpoint {
+					remote-endpoint = <&tcon0_out_panel>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-odd-pixels;
+
+				panel_input_1: endpoint {
+					remote-endpoint = <&tcon1_out_panel>;
+				};
+			};
+		};
+	};
 };
 
 &ahci {
@@ -218,6 +261,32 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_lvds0_pins>;
+	allwinner,lvds-companion = <&tcon1>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_panel: endpoint@0 {
+		remote-endpoint = <&panel_input_0>;
+	};
+};
+
+&tcon1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_lvds1_pins>;
+	allwinner,lvds-companion = <&tcon0>;
+	status = "okay";
+};
+
+&tcon1_out {
+	tcon1_out_panel: endpoint@0 {
+		remote-endpoint = <&panel_input_1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
git-series 0.9.1
