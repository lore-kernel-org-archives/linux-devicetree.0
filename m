Return-Path: <SRS0=8cl9=3P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD429C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 18:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7992020708
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jan 2020 18:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="EDNmD3i8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgAZSxq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 13:53:46 -0500
Received: from mxa1.seznam.cz ([77.75.78.90]:46355 "EHLO mxa1.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgAZSxq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 26 Jan 2020 13:53:46 -0500
X-Greylist: delayed 704 seconds by postgrey-1.27 at vger.kernel.org; Sun, 26 Jan 2020 13:53:44 EST
Received: from email.seznam.cz
        by email-smtpc16b.ko.seznam.cz (email-smtpc16b.ko.seznam.cz [10.53.18.17])
        id 6b21a3d7302ff7be6a886f89;
        Sun, 26 Jan 2020 19:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1580064820; bh=TUebci02NczpMGKvv2fnh9uv2ZSWEY0qvKQD2Z+NYG0=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=EDNmD3i8DH3cXS7pDkn+B7lsFHDnlgpsct3YbA22JRofDOvhiLbcgyZUBS+3f4UEE
         G2MkNjeKyTgnVaRGaSOBbnDNUAhQCiTjNwb3YK3TmEx3lvK9l0coCjgja0d/QOqWbw
         EdY7aUtN/D6UjptdM5IXH6SUvpGiEzbWejGTx4wk=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay24.ko.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Sun, 26 Jan 2020 19:41:40 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH 1/2] dt-bindings: display/panel: add bindings for S6E88A0-AMS452EF01
Date:   Sun, 26 Jan 2020 19:39:10 +0100
Message-Id: <20200126183911.17090-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
use of their S6E88A0 controller.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 .../panel/samsung,s6e88a0-ams452ef01.txt      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
new file mode 100644
index 000000000000..2dcf9580febd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.txt
@@ -0,0 +1,26 @@
+Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode controller.
+
+Required properties:
+  - compatible: "samsung,s6e88a0-ams452ef01"
+  - reg: the virtual channel number of a DSI peripheral
+  - vdd3-supply: core voltage supply
+  - vci-supply: voltage supply for analog circuits
+  - reset-gpios: a GPIO spec for the reset pin
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [1]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel@0 {
+		reg = <0>;
+
+		compatible = "samsung,s6e88a0-ams452ef01";
+
+		vdd3-supply = <&pm8916_l17>;
+		vci-supply = <&reg_vlcd_vci>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.24.0

