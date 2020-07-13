Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44801C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F15F207D4
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 15:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="uh/p1Ef6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730092AbgGMPnK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 11:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730145AbgGMPm7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 11:42:59 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD579C08C5DD
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 08:42:59 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id j80so12629379qke.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ9xGmnDMhVmVeHb/A9jwCumG7lyw2W/vCjl/eftB8Q=;
        b=uh/p1Ef6AcNvbVRpHudmQkMOJ1S/koQyeNCuMN4rYGt0P/Cyivoo4wCbanFKcJKRsw
         Sx+iSxYxAONbEgso6SXVN1HbKBlMhfPWnD02+V6DrlX8CAN/kj1BQ1G0k9xeJHqMp+9W
         O9k+hZuCuW3iwbAZV+poMsuO5Zj7hjPr2Tha8nmyOw4IbWOqhuoF1lxQjUSWCCpxZAPn
         vpDtaQDcVMepBU3YZJPIhf/JR4M8jBEcXb2kwTq0WEYrLyHlOOmpBOSXuGXcYtu0R+lN
         FOVlrlxqZeWl7ixsowFCXK9LAT6TB6rDkHOgR/V0SGEnAbVmL6suW7KAKN5I7NX/vCeH
         HPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ9xGmnDMhVmVeHb/A9jwCumG7lyw2W/vCjl/eftB8Q=;
        b=im9shptrHdju88mx9S9p+DWF4XnnpCXe/6ym09Zy4f2+ABCBAFTA6L8pkb0mTKY5IT
         +5eWKkmKWgC8IaSqqIb9J7e5FhEuQDP9pkovUlKTapFbB9PQbgSB7sN5dUq13fIZ2l7x
         2P7ZpbqdQVV5fwMIeCPyGmpV6tGtlYokzChSpulitcvINYKe2hpEvl1jlPkGkRpkx1Lm
         JFvnyea313BKIW3B6HoXzeeMgDOjWzrf7wzCl8H852Bks0m0xv6h02neEpRAks1g9Y+c
         RWr9j+xPACMrgJ+PIyJk4kdDH47QrC++WUdIY8YqvS9gFAkJD+t2lLd3gJlOHmGDbkTf
         dWEA==
X-Gm-Message-State: AOAM530ZTAY9n4Hq43uJ700WxQHdHPCRThT6NvnKAX5xCcrx1RymyC6I
        K1Wlvltt+Ept7bihafUsFuEMfw==
X-Google-Smtp-Source: ABdhPJzsL343pl6s6o//ejmnrLm038pBE/14aNx1jNZS+SLcX9OWFto4sJBCKMsdD+D/PXhSscjkOw==
X-Received: by 2002:ae9:e212:: with SMTP id c18mr211782qkc.348.1594654978946;
        Mon, 13 Jul 2020 08:42:58 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id l1sm19806371qtk.18.2020.07.13.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:42:58 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8150: add interconnect nodes
Date:   Mon, 13 Jul 2020 11:41:15 -0400
Message-Id: <20200713154121.22094-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713154121.22094-1-jonathan@marek.ca>
References: <20200713154121.22094-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the interconnect dts nodes for sm8150.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 82 ++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 33ff99132f4f..fa9cd9d60093 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
+#include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -440,6 +441,69 @@ uart2: serial@a90000 {
 			};
 		};
 
+		dc_noc: interconnect@14e0000 {
+			compatible = "qcom,sm8150-dc-noc";
+			reg = <0 0x014e0000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm8150-config-noc";
+			reg = <0 0x01500000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		camnoc_virt: interconnect@1620000 {
+			compatible = "qcom,sm8150-camnoc-virt";
+			reg = <0 0x01620000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		ipa_virt: interconnect-ipa@1620000 {
+			compatible = "qcom,sm8150-ipa-virt";
+			reg = <0 0x01620000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1629000 {
+			compatible = "qcom,sm8150-system-noc";
+			reg = <0 0x01629000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e4000 {
+			compatible = "qcom,sm8150-aggre1-noc";
+			reg = <0 0x016e4000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1706000 {
+			compatible = "qcom,sm8150-aggre2-noc";
+			reg = <0 0x01706000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		compute_noc: interconnect@1720000 {
+			compatible = "qcom,sm8150-compute-noc";
+			reg = <0 0x01720000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1749000 {
+			compatible = "qcom,sm8150-mmss-noc";
+			reg = <0 0x01749000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -860,6 +924,20 @@ usb_2_ssphy: lane@88eb200 {
 			};
 		};
 
+		mc_virt: interconnect@9680000 {
+			compatible = "qcom,sm8150-mc-virt";
+			reg = <0 0x09680000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@96ab000 {
+			compatible = "qcom,sm8150-gem-noc";
+			reg = <0 0x096ab000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8150-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -1280,6 +1358,10 @@ rpmhpd_opp_turbo_l1: opp11 {
 					};
 				};
 			};
+
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
 		};
 
 		cpufreq_hw: cpufreq@18323000 {
-- 
2.26.1

