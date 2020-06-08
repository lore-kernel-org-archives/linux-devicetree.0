Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6D3C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 09:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 107D5206D5
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 09:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onHkleCw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgFHJhu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 05:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729276AbgFHJhs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jun 2020 05:37:48 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0047C08C5C3
        for <devicetree@vger.kernel.org>; Mon,  8 Jun 2020 02:37:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u16so9788635lfl.8
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2020 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ny0JxnPXcJXac2OR2OWEhERQQoH+5/D2pWVNYL9vVk8=;
        b=onHkleCwATZOMGYDjhSuzJ0rFsl4YAteJzmq0AvhB7ek2ryDJGPSCcNzVMmGgFZdlC
         odgBCcI51L14zhpg2BIrcYMm9XIL5O6lvI1Nf9CI0ruDoL3EDokARPgavii+LXg69kqF
         Z8dlU1gG+7GNN0nn7yblZLE6BefYV+4DKjlWUi0RcLcowv4TXwRRhsPvmjnF9VCWLzr0
         9hvM8LIuf0hC6ar9Nlg2by/EoX/bzRxChgYvm3MhoGQb//wArBVULiPAL/wdsz9kXewg
         cBDi4LdGskguvD1l0lBM+sqg8yTeqkdLdHy7oVyhrne4l9MqvcemVd6xGoAMAcQXWEzH
         q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ny0JxnPXcJXac2OR2OWEhERQQoH+5/D2pWVNYL9vVk8=;
        b=lOc5udMouhPNEce8zY+0LXWpjnGH8M7G4VNts77n+F7tykouqepzLxqI1gJ4rBIiuO
         r1/JlJnVtzMPmhm4hKCfdKIrCJu+jIKwc4fZjmAh9cMLT+QkYYMfB0qxZzxQ9lfA7Ekm
         woAf4HipRcOttV3hWjSOPJjJtNF+XLC8g3147Z87kKs5BFh41FahrKIl+LiLhAd0OgfB
         kUZ77H+OV2Xxs8FFhz2nW8RhuB9WG4UT60D/vvff9tDRac6jR0+QeFK5bnnzLu2gGVs9
         3kBqZqHtZQWCRDGOSsTvrlcO9ln/e8T0Q5JnYvcw8FD+G1DzRb4zYEbslah7u1ns5e4N
         3gXg==
X-Gm-Message-State: AOAM532p3o8Wi80AkrFXNRtM0+aKEyEOBwAKtAJvi2MVJy/yintwIuPn
        K07i1fg8GESm2aOGZwpKO0vdrIUA
X-Google-Smtp-Source: ABdhPJySP35fNdlQ9WuMcsvfGhYNlzorF+R1VNwyz1QNu2THZnM2eGoazbzMHsMEf/WpPiKTYP/WMQ==
X-Received: by 2002:a05:6512:488:: with SMTP id v8mr12258642lfq.205.1591609063937;
        Mon, 08 Jun 2020 02:37:43 -0700 (PDT)
Received: from elitebook.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id s28sm4259671lfs.3.2020.06.08.02.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:37:42 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] ARM: dts: BCM5301X: Specify switch ports for Luxul devices
Date:   Mon,  8 Jun 2020 11:37:33 +0200
Message-Id: <20200608093733.20190-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

All those devices use standard BCM53011 (rev 5) or BCM53012 (rev 0).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts  | 25 ++++++++++++
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts  | 20 ++++++++++
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts | 20 ++++++++++
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts | 40 +++++++++++++++++++
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts | 25 ++++++++++++
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts | 20 ++++++++++
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts | 40 +++++++++++++++++++
 .../boot/dts/bcm47094-luxul-xwr-3150-v1.dts   | 40 +++++++++++++++++++
 8 files changed, 230 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
index e58c8077be1d..810fc32f1895 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
@@ -60,3 +60,28 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "poe";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "lan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
index 766db617455b..7604b4480bb1 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -67,3 +67,23 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@4 {
+			reg = <4>;
+			label = "lan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts
index b9d95011637d..1ec655809e57 100644
--- a/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts
@@ -60,3 +60,23 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@4 {
+			reg = <4>;
+			label = "poe";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts
index 0052e1b24130..04bfd58127fc 100644
--- a/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts
@@ -108,3 +108,43 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan4";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan3";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan1";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts
index b47fb0700a1f..068e384b8ab7 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts
@@ -54,3 +54,28 @@ restart {
 &spi_nor {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "poe";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
index 334325390aed..67a5982af9c9 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
@@ -51,3 +51,23 @@ &uart1 {
 &spi_nor {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
index ac7515423474..a21b2d185596 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts
@@ -103,3 +103,43 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan4";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan3";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan1";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts
index 6d28b7dacd05..4d5c5aa7dc42 100644
--- a/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts
@@ -74,3 +74,43 @@ &usb3 {
 &spi_nor {
 	status = "okay";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			label = "lan4";
+		};
+
+		port@1 {
+			reg = <1>;
+			label = "lan3";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan2";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan1";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		port@5 {
+			reg = <5>;
+			label = "cpu";
+			ethernet = <&gmac0>;
+		};
+	};
+};
-- 
2.26.1

