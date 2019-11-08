Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7EFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2289921924
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5v6w5QJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfKHPhY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:37:24 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37679 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHPhY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:37:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id t1so7555817wrv.4;
        Fri, 08 Nov 2019 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zNRVMI5c64DIG9dO1ZAUvic71PHcwBHzn7HAnMaKCXM=;
        b=K5v6w5QJxVvJXtQb3oxMYRaIOs9fVA4Ns5S2BVB2Kjg9SLSaN98Nu12vgXEBfLJQuy
         ig1gDRdXyEXWtFve7nFod26k+96VkufujXAID5240QzNOIcoaMX/tC72Ks3HvsmKiLGt
         2IiOHBI8KheknKLWi2Ps87Yaxkj79aQ065o73xHD+rKaG/mK1VGc36bqMf/Z7Yssm2eY
         aSHI4bKbDne8eM01nYJTtB+SCfP/c4p6MYkiZuFDng46ImQtoFP/32K1ovtHsDufRsif
         yww/N7+EUTBU7INvBeXJ2bQjxt/8HZxIvm7B7wRZupFAZXxLRXpFfpNAjmnY2DaU1iox
         MJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zNRVMI5c64DIG9dO1ZAUvic71PHcwBHzn7HAnMaKCXM=;
        b=HiZtLyr7dt1f8h2daSJygB7FcBx16ZvNwJfXzEzjLu8JDDb9xVVHdEZcWvoGFAS+vU
         lO/N22AsfTn9jHdBSS1dihmv/L6nPCBtmmbYiElsiPWUDh5VJmaWx+psjPwGpN1fLXlt
         8yBfg8eKybJH81tJoY26pHOcEzQSmSs0ksGXM47CJ2av6dg1n8+o4aP5r+HnxDMuPMyT
         qhcFWC53QzKf5dSOGl7xajWiYpXO5/yodThGNv7hVrHfdrm5iLNDLCtro9/Lph97ozxF
         LlfLqD84Bg7opN0HTwgb7xLgkfAW3ARsEnzQ1MvHhp1S3hpDtZOSYJogeOV5+UVczfr8
         TxqQ==
X-Gm-Message-State: APjAAAUtliZmDXYKBFaNDNCu0X7Us2rfFSU7I4PZDNF2E9bejho7rugC
        17VlQEhSm/Zxw3KYFKNbEmw=
X-Google-Smtp-Source: APXvYqwUn293JDxKiGB6AqkYr9f4GobNYRLLfQyY9AL2KPslvHnP2tiV8O/IrhIUnA6Cb3AFzZBWNg==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr8478984wrp.354.1573227441918;
        Fri, 08 Nov 2019 07:37:21 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j10sm732972wrx.30.2019.11.08.07.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:37:20 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: tegra: Disable secondary CPUs on Tegra194
Date:   Fri,  8 Nov 2019 16:37:19 +0100
Message-Id: <20191108153719.3166002-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

According to ePAPR, CPUs that are quiescent should have the "status"
property of the corresponding device tree node set to "disabled". Since
all but the boot CPU are in a quiescent state on boot, mark all
secondary CPUs as "disabled".

Note that this does not have an impact on SMP. Linux will still be able
to boot these secondary CPUs like before.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 59485976db64..ea165b2998f9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1661,6 +1661,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x001>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1675,6 +1676,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x100>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1689,6 +1691,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x101>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1703,6 +1706,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x200>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1717,6 +1721,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x201>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1731,6 +1736,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x300>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
@@ -1745,6 +1751,7 @@
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x301>;
+			status = "disabled";
 			enable-method = "psci";
 			i-cache-size = <131072>;
 			i-cache-line-size = <64>;
-- 
2.23.0

