Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4A4C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 15:47:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E98320724
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584114424;
	bh=nYK9bKTo6sVM7g/LliKCCc+yDn8kHdNBK723JyvmyWU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=t4XNWbW8brvitIrq1pTNThFHpW6Z3O4OoqFyxB5i0Ztgg/+zhCLVHqj6K9pTAw2NC
	 H4an466ASFTJ9HGtNIzNce1vYo6rYzmUTOBdllCJI/n+S2nJZ+BJGLu5tUsudqrTmE
	 uLdHQy3v7+Frau1tNFkltXhSb0pf/wDMqR9nIJz8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbgCMPrE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 11:47:04 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40120 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgCMPrE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 11:47:04 -0400
Received: by mail-oi1-f193.google.com with SMTP id y71so9820377oia.7
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMfy8/E6oXzJJx/8VpRV3tj4/ckSsq/8G43sIQgZQ7U=;
        b=czUQs5daMOGZ8mc2tQRL9AILd/K6SkUf/czTpvkbfK/OQuet9UZhmlxYefNZeVyTLz
         UdHkdId5K49m4sutgjqR3NTB8j+g161WOF8ZZ1azns4UvnZcd+nxdqj7nlAwgN477+kD
         VIAriXsKrKLsJIbznNJER461AG92L+XYHFKBO7LmEis23RFs9Gu3t9VGTrwPhlEOY0Vy
         LH5D6lw5VlzMRsK7ndIVsy0TI/69WcSr3Qpp5PkREz3hN3G0PbLqMV3W+JQNuKebHv8m
         g1WzpBJZmtv+lBbSsiLG4p/47Rdgrm67CkY9M8POCs8cSdegsZWf7rwTA9GDkB+wf3G3
         p5Nw==
X-Gm-Message-State: ANhLgQ00WYXWAx9ksGONvyeM/BGbHFDjgkj6kIEyjypysK4zWH0qIV6Q
        ncTPu3iUljetlFkC9J46sw==
X-Google-Smtp-Source: ADFU+vtE/jAJa6g5NqFQM+VkazVXWPBMZUEMY66SKGWqXr6JceMIiuB6q4UOhUn9lUCRUfb+R5SqfQ==
X-Received: by 2002:a05:6808:14a:: with SMTP id h10mr7551170oie.81.1584114423061;
        Fri, 13 Mar 2020 08:47:03 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t21sm6884983otp.80.2020.03.13.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 08:47:02 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: sunxi: Fix dtc 'dma-ranges' warnings
Date:   Fri, 13 Mar 2020 10:47:01 -0500
Message-Id: <20200313154701.948-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

'#address-cells' and '#size-cells' are needed in the same node (for the
child bus) as 'dma-ranges' in order to parse it. The kernel is more lax
and will walk up the tree to get the properties from a parent node, but
it's better to be explicit. dtc now does checks on 'dma-ranges' and is
more strict:

arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): \
/soc/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/sun8i-r40.dtsi:742.4-52: Warning (dma_ranges_format): \
/soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)
arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format): \
/soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'm updating dtc for 5.7 which will introduce this warning.

 arch/arm/boot/dts/sun5i.dtsi       | 2 ++
 arch/arm/boot/dts/sun8i-r40.dtsi   | 2 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 0b526e6e5a95..b8bb58b0180e 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -186,6 +186,8 @@
 			compatible = "allwinner,sun5i-a13-mbus";
 			reg = <0x01c01000 0x1000>;
 			clocks = <&ccu CLK_MBUS>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			dma-ranges = <0x00000000 0x40000000 0x20000000>;
 			#interconnect-cells = <1>;
 		};
diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 8f09a24b36ec..b9c45aa8f21f 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -739,6 +739,8 @@
 			compatible = "allwinner,sun8i-r40-mbus";
 			reg = <0x01c62000 0x1000>;
 			clocks = <&ccu 155>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			dma-ranges = <0x00000000 0x40000000 0x80000000>;
 			#interconnect-cells = <1>;
 		};
diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 5e9c3060aa08..62ca0d287008 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -560,6 +560,8 @@
 			compatible = "allwinner,sun8i-h3-mbus";
 			reg = <0x01c62000 0x1000>;
 			clocks = <&ccu CLK_MBUS>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			dma-ranges = <0x00000000 0x40000000 0xc0000000>;
 			#interconnect-cells = <1>;
 		};
-- 
2.20.1

