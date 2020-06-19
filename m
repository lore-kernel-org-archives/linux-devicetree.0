Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F00C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4857320890
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 20:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="1fb9oPUV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391004AbgFSUWi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 19 Jun 2020 16:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390976AbgFSUWi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 19 Jun 2020 16:22:38 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55631C0613EE
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:22:36 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id n24so12883487lji.10
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2020 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b6c7Bimc+oKUhwNH+CrmCVQQ64zzB2HfVNf/0wT1Tn0=;
        b=1fb9oPUV0O4xiqM9M7QOWLm3rvNSJw3oavO88KbJWTc50MsP8blQQ3Mv6ZYvoDYhus
         iz7uxa8KIKxWPFUwH/2rLjrP7a0glYYL4dxKRswz7INSyubQ9kwHytxfnMgtBeEuPW63
         EeoFMcCWTqcEDlFK2NcagDCPQDB7tPrU55jeg0CVTPlfCkHfjA4T1wgal6Td5ekWLlay
         4/kSsI/1O2j/J+UAWod6HEOyFD1GmHX1GV4bJhcmCnEcwWlf5viDlEUf1u5a7w7XCvDP
         pAjeRsptMkjS01L+CYM3miqaKRjqP5nbBqqpmSKUlPhfPtommWoajD3uH32EebpNpPPS
         1IZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b6c7Bimc+oKUhwNH+CrmCVQQ64zzB2HfVNf/0wT1Tn0=;
        b=lomE11g+wuBIm3ADmPDgeqm6j1MR54wxbgQOwi0WMmintRMsQWIM8k/hmKcDjb5ILX
         PbiFgRz9R5Uoopjhtlroe3YBS289y+tO4kkMzaTt5A2m9XIrBO0Z/xI3/h4yXkE470Yg
         i3yIqy1AHhYGg+NUlozwj/dtBFQQVmb9Axia8XXNXbCXHCSIZKBO0RJkOaZZaK02QBCz
         i6G0eZW3miCf0y4Harvl96LTp331kTNeOqR4hgdlbzV23ENmJ5b3Usk+Ko4Hb3s4CIQj
         8njldVlbrLA2A4jOTJCIu4PbLj+ezxRNWWC6HljHc/LcydTpvoMrhw9Hnx3824FGOGWI
         WMHA==
X-Gm-Message-State: AOAM532ytRLvqjqKRmyKpspJddP/hKZwLcGu78Fqf6LOV7chmALXx71K
        smWdRNocIfWcQVnWHwtxT0tC2w==
X-Google-Smtp-Source: ABdhPJwGlPuVbi9IvBDG9em/doS0iE52twC7r4mAbwaPZmvsRIvUinD5vaj+b8q+j+XvZtO0faZPmQ==
X-Received: by 2002:a2e:9d8c:: with SMTP id c12mr2532451ljj.230.1592598154548;
        Fri, 19 Jun 2020 13:22:34 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:441c:ac8f:7564:6e7d:9e36:7ded])
        by smtp.gmail.com with ESMTPSA id m11sm1588319lfl.70.2020.06.19.13.22.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Jun 2020 13:22:34 -0700 (PDT)
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add QSPI
 flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Date:   Fri, 19 Jun 2020 23:22:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define the Eagle/V3MSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   67 +++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |   67 +++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -187,12 +187,79 @@
 		function = "i2c0";
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -212,12 +212,79 @@
 		power-source = <3300>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootparam@0 {
+				reg = <0x00000000 0x040000>;
+				read-only;
+			};
+			cr7@40000 {
+				reg = <0x00040000 0x080000>;
+				read-only;
+			};
+			cert_header_sa3@c0000 {
+				reg = <0x000c0000 0x080000>;
+				read-only;
+			};
+			bl2@140000 {
+				reg = <0x00140000 0x040000>;
+				read-only;
+			};
+			cert_header_sa6@180000 {
+				reg = <0x00180000 0x040000>;
+				read-only;
+			};
+			bl31@1c0000 {
+				reg = <0x001c0000 0x460000>;
+				read-only;
+			};
+			uboot@640000 {
+				reg = <0x00640000 0x0c0000>;
+				read-only;
+			};
+			uboot-env@700000 {
+				reg = <0x00700000 0x040000>;
+				read-only;
+			};
+			dtb@740000 {
+				reg = <0x00740000 0x080000>;
+			};
+			kernel@7c0000 {
+				reg = <0x007c0000 0x1400000>;
+			};
+			user@1bc0000 {
+				reg = <0x01bc0000 0x2440000>;
+			};
+		};
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
