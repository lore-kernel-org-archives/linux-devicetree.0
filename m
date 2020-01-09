Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D71CC282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 050F8206ED
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 13:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="dpQhhEzU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbgAINwh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 08:52:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52151 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731354AbgAINwf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 08:52:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so3016763wmd.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 05:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wDdT9mwNJb39SdHGme3Rl9FLVtZ/pPu7zEryCFQu5mw=;
        b=dpQhhEzU8ZdAV6dngpJDK3vCdHcsoKFGCyJyp60edFReYxuWDiZXLCljlb0JMvhG0A
         50BZK6liDrJjpi7/eqHoCqYPwnETOCpaQ4qArOHdegCqviTE3qfNrE6iMzmAjmv80SQ9
         OMbO+VkEitn1bWBdLoPAb7xKgjBZCFuBS9HqcRVktviHRiyzUKiBv2Q/mxotrIHhmR++
         ULYRzUpqfJHqRu9lU2kCDjPdtthchZFQ7tM3D5XDysbInMt2Bx2i4uprH0VooHLPmYY5
         wTOj7Hf+cHVaIsfajvI9aG4FkiwGqDKATl4pMuGV0011ZNBf938GuUpJNLvO43t2k4cl
         AZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wDdT9mwNJb39SdHGme3Rl9FLVtZ/pPu7zEryCFQu5mw=;
        b=pubegi0iLt3tPkpAltjAsUAWIKAiLmoAHiqjIUuFEZk3gOJTJ9jUKwr4Y42KhzhtJJ
         45BKduWUKTZrUCvcA0BHi0a/9MV8DHhNX9hDs1o/VUmGVX4gLQj+FMdfKGcONh5ofxKR
         gpAemBNE6EfvsE1jPnJB68wpu8u2xkLMPYT0pDde1sko5ojABRwURG09loLmWiXp1LCX
         P15F6ROHbCUkUqCYnxGWja/wTftyS8Ue8exdJp5Ltw4sr/KKn0WKgTgXagipLrobgdWp
         GLHDxujZh9PQ4jqD6uCMSMYAMKujqWImJAhoKPQYxUpvOHLYzNGybimDRfD3rI4Pt3JX
         qARg==
X-Gm-Message-State: APjAAAXgTCjKPz+/EIixaTKkSRwJYdjvObdto6RxU+P7C5j7PC0DepEE
        PF9w3iPrMrA374Lkkv5PRpR13g==
X-Google-Smtp-Source: APXvYqwi6eSbXZCs88gz3BT3ZgLThAHMy95DtZQwNI4D3VZDjgmv6pCPIEVoxQkMsNmck5ND5GcXqw==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr5153449wmd.77.1578577953676;
        Thu, 09 Jan 2020 05:52:33 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id u24sm2880054wml.10.2020.01.09.05.52.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 05:52:33 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-arm-kernel@lists.infradead.org, git@xilinx.com
Cc:     Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Harini Katakam <harini.katakam@xilinx.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: zynqmp: Fix the si570 clock frequency on zcu111
Date:   Thu,  9 Jan 2020 14:52:20 +0100
Message-Id: <02f0e609601065c8aa4acb4ed9916bade10c6a14.1578577931.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1578577931.git.michal.simek@xilinx.com>
References: <cover.1578577931.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>

The si570 clock frequency should be 156.25MHz as per datasheet.

Signed-off-by: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2: None

 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index 022c732005ee..cb2e46833a7b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -317,7 +317,7 @@ si570_2: clock-generator@5d { /* USER MGT SI570 - u49 */
 				reg = <0x5d>;
 				temperature-stability = <50>;
 				factory-fout = <156250000>;
-				clock-frequency = <148500000>;
+				clock-frequency = <156250000>;
 				clock-output-names = "si570_mgt";
 			};
 		};
-- 
2.24.0

