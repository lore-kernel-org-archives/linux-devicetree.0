Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED206C38A29
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7FE120769
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQg9Drpw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDIRxO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:53:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39075 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgDIRxO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:53:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id p10so12882201wrt.6;
        Thu, 09 Apr 2020 10:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fDFW17LWXFc/94mIfr99qe3Pgfej3YzVj6EQ4PJofks=;
        b=ZQg9DrpwZimQRjmcdrdaOBKmRP8ka2jN/MTap+6C2Z40SMdWAE6EEDvH+rjfmlY3Sv
         fGU7sjybDXwxub42UsTA3uiZ9LtX2gMgUXvEDb6VrQUI4+b6sdzUEts/fu5N+fZsiqWB
         v99YbzBGhWYNjm5pDy6qxGJFe5+Lw1+PW02JF6wqA/xCCgIlD+4KMnFRITgskztMy1rQ
         nD8Z6ibpjymE3JWFfEwkNYW16iXdQIgZxanr/6ED7gKRm81bbUoW+lODfbnEJRlxvvbF
         7smdq1zXAFf0oVNRZVv/NBvZBM6F64JI0AOmukqI80+G/JaTl6hRGUjPBbQhItOi5YA5
         gP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDFW17LWXFc/94mIfr99qe3Pgfej3YzVj6EQ4PJofks=;
        b=Rx2vvgFxLziFHjlJfYgX87j78Rhpi2fKJJFoWVtARGuq6ckDwRZivmVj7Ze/nCi9JX
         ZAX4TJs4/skztCiKr9cmBe69f9Req3EEQWxcoVEoLM6wVGv8SHbvFWHsy/w494XaKS7U
         wTq9NCvPZNvBViY4RXZG8ZqhNIRX5v1MM2tEnA1hkEqCjwCfGS+qx637Qzt2ulrEIxfk
         /UyIcspujWh5OvNq4OYKwm6giqDl4XL7Db81D3PEgG+0r5rbwkxb3Nid+MNbWkONVrJm
         gdVGqAUjje7NHqVDTKeQAI6wngmROUoaKkQC6uYZVN04MK2wZuAuO6wqkhcxe7K3QvY7
         18/A==
X-Gm-Message-State: AGi0PuaXHGb6Zou6j9l8dMcjP4YDaLLHX2uReHgprEIcGcEFaTO/np/d
        8LA3mMxRPJ1tRUWgjhqO+sA=
X-Google-Smtp-Source: APiQypJ8M5w/KbN97Gv2Y1EF2Us8A4iAtlYtQsyDmJ6YsDXB6cP7fvFs5Sz1z0ZlYu9eeHqtXIBzuA==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr386611wro.66.1586454793113;
        Thu, 09 Apr 2020 10:53:13 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id 145sm4849769wma.1.2020.04.09.10.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:53:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 13/14] arm64: tegra: Hook up EMC cooling device
Date:   Thu,  9 Apr 2020 19:52:37 +0200
Message-Id: <20200409175238.3586487-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The external memory controller can be used as a cooling device for the
LPDDR chips. Hook it up to the "mem" thermal zone of the SOCTHERM block
so that temperature polling can be enabled on the EMC when a given
temperature is exceeded.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v6:
- new patch

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 28 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 3fa92dd8350b..a550e7b828e6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -895,7 +895,7 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
-	external-memory-controller@7001b000 {
+	emc: external-memory-controller@7001b000 {
 		compatible = "nvidia,tegra210-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>,
 		      <0x0 0x7001e000 0x0 0x1000>,
@@ -904,6 +904,7 @@ external-memory-controller@7001b000 {
 		clock-names = "emc";
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,memory-controller = <&mc>;
+		#cooling-cells = <2>;
 	};
 
 	sata@70020000 {
@@ -1561,6 +1562,18 @@ mem {
 				<&soctherm TEGRA124_SOCTHERM_SENSOR_MEM>;
 
 			trips {
+				dram_nominal: mem-nominal-trip {
+					temperature = <50000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				dram_throttle: mem-throttle-trip {
+					temperature = <70000>;
+					hysteresis = <1000>;
+					type = "active";
+				};
+
 				mem-shutdown-trip {
 					temperature = <103000>;
 					hysteresis = <0>;
@@ -1569,10 +1582,15 @@ mem-shutdown-trip {
 			};
 
 			cooling-maps {
-				/*
-				 * There are currently no cooling maps,
-				 * because there are no cooling devices.
-				 */
+				dram-passive {
+					cooling-device = <&emc 0 0>;
+					trip = <&dram_nominal>;
+				};
+
+				dram-active {
+					cooling-device = <&emc 1 1>;
+					trip = <&dram_throttle>;
+				};
 			};
 		};
 
-- 
2.24.1

