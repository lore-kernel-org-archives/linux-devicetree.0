Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AA3C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA895207E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="XV601yOr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgESUOK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgESUOK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:14:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E044C08C5C1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:14:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r125so585584lff.13
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jjxorDSi6CCUFTjnkwK03PEnye3/WUIKjWho5TXacVU=;
        b=XV601yOr8URrz1xuc+2or0yF1OyMIFVju/wGnJjsnRmzn0AgyO0WKxEZwtY9+8uS5+
         PUF97mheov+00YDSioYbP0aU0zQc0CuZLsqChjphi7quv4L+tXYa3jw8ubL1Wn26vbwA
         Gmn+dBUSrCRwuHD8SCZNmiXyY25DrlD4RuBw043OBR/mdLSZ8ibv0rw6og4mfKo5Ncu3
         7pTXRlESynrl9M7QZMO26AKKqsBHDahaG7GfyDOLq6IJFKTkIOcwZJ3Rcq02DHbID7fi
         78kq5TOuFjTbN5bWsqqFe/vjBQUdHPS0fen01krdbxKejuEqPC24RMcwqBI6Q6tekp2P
         xf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jjxorDSi6CCUFTjnkwK03PEnye3/WUIKjWho5TXacVU=;
        b=a9FFq39V1Dz8/uLcjQ/Gis+LY5DYU+lSni7mbu/dk/nwSH/uuzFPwGFAEkTEkRQUq1
         5x6llbOIb/c6fXg7/asYe8LFaCiQldUuovASEtSXMRKZtrnCsrGbfJXg93XDKHxWY39Q
         WCIQlGb/MDjokk7tY6JgTdF2gdTPsWULq6aY4m7BrlsVOR8o4wr41viOeDFV+eEsiO2d
         Y5qd69v2M7mexI0rZq5Vrh1pwRm8JIcmVDB1hzhS6SJbfBMTR+X2fiOOIOvUimox2Y4Q
         YoQvJHwWCH+CCyU68RGvNj/4acV940rGN2KjUxM/4ORV6pyrwxCXuIJPmhSd1hS95g9h
         0r0Q==
X-Gm-Message-State: AOAM533sOTfGpqNYnewzLWs7397x7vNBtR7doaH4bjJ4kY0k7quIK1/y
        9h1m2yqGGX2vPuC/Ykde8K0LJg==
X-Google-Smtp-Source: ABdhPJx7rq5v5V/afqseP0Ldq0KKb5tNcEJFECl7Jtzw5F/qzytWWrgrb1BoJJBh3ky+g1oc744WeA==
X-Received: by 2002:ac2:4554:: with SMTP id j20mr364500lfm.3.1589919247742;
        Tue, 19 May 2020 13:14:07 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:2c3:baf8:452e:b00:c0e9:c252])
        by smtp.gmail.com with ESMTPSA id c8sm217262lfc.46.2020.05.19.13.14.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2020 13:14:07 -0700 (PDT)
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI
 flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <322ca212-a45f-cd2c-f1eb-737f0aa42d22@cogentembedded.com>
Date:   Tue, 19 May 2020 23:14:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <850d4a7b-4984-eb0f-de89-e5c39d61d19e@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define the Condor/V3HSK board dependent parts of the RPC-IF device node.
Add device nodes for Spansion S25FS512S SPI flash and MTD partitions on it.

Based on the original patches by Dmitry Shifrin.

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- removed the "renesas,rpc-mode" prop from the RPC-IF device nodes;
- lowercased the hex numbers in the "reg" props and the <unit-address> parts
  of the node names;
- removed the leading zeros from the <unit-address> parts of the node names;
- refreshed the patch.

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts |   67 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |   67 ++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -262,6 +262,11 @@
 		power-source = <1800>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif0_pins: scif0 {
 		groups = "scif0_data";
 		function = "scif0";
@@ -273,6 +278,68 @@
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
Index: renesas-devel/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
===================================================================
--- renesas-devel.orig/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ renesas-devel/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -187,6 +187,11 @@
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
@@ -198,6 +203,68 @@
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
