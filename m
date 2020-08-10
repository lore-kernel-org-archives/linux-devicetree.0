Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE51BC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 04:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E0412073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 04:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="w5ntOGon"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgHJE6W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 00:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJE6W (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 00:58:22 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB51C061756
        for <devicetree@vger.kernel.org>; Sun,  9 Aug 2020 21:58:21 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id o21so7809051oie.12
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2020 21:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IiUjz/E0yJS5Acwq7s0Wi9NqTJCu4UNiNtrhWhhnZJE=;
        b=w5ntOGonI2saN+6mytrGYie4+y8Yh277EywUV9obx+xdwtiHqM78gvDYtNlxZiTVw4
         u1DGtj7vQj5KukSTQElURStY5cldisYxpkYXUPAqXWSeC52K/645Wi1MOmCrWxWE2D/3
         lasZed7h5p5T97AScHaZI8HDbxkSAKjbD+VfTZsLjM4tbTgRribKDsiYl9j28wGmyyEJ
         uQH1gEET4hLt6WWwbJgk1oL20+bkPVa9UpPt6gPU8dQPL/ZWYaep+cGzrL7rNn9TfPmA
         P2YYjNTPTrQBug7jliA8AZ6jquUPImMp19afRznu9GBMSUWkUYyOqBvRSMjQUxQ/mwoz
         GyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IiUjz/E0yJS5Acwq7s0Wi9NqTJCu4UNiNtrhWhhnZJE=;
        b=TqnoGwoasr3cG4/fnO/GpTeRQOeV+WT9cKUQh9/TLa2Ml2F0+hMeR1ZyMQrXq8filS
         TYRLcx+oXL7m0Nbu12R2Ky9fOiSfQj0bBBOuZP0kLX3n4eTgV/UPyfiH7nY2jKKlNbDG
         +YJD1mAHZT3O051cZbKiChyGAjZWDAXEqzko3067iTWYkn2ymu8Bx+yu2h37k9n2mfih
         ICBV1fWMBslA1MuzeugVniISvNR/VgXS8nPMWIUfDqAin3vWp0sX0u2qWBeaNdqJG35g
         IUoMKvwb1/IeqOfN2xu+RkaPYNYd2moFk6iPub+tLTP+SPGYtuifo+awfHE8/bEyrBip
         mjcQ==
X-Gm-Message-State: AOAM531bFmfvdfdyFfCTlOK91CVbrR1Df42TBuFLzc6c56aanQXt7WId
        8ZJtgv/ojx22f2hrIQXdYz8G9g==
X-Google-Smtp-Source: ABdhPJx1w9rZoh3/Tnwxe3wZZkLYlzxR8RFAig7w/rPU85ghmbBZ2QiW9BUTovV5HtIwrqb4eQyTHA==
X-Received: by 2002:a54:4f1a:: with SMTP id e26mr21293472oiy.171.1597035500419;
        Sun, 09 Aug 2020 21:58:20 -0700 (PDT)
Received: from x1.attlocal.net ([2600:1702:da0:ff40:2318:61c2:fbc5:d01e])
        by smtp.gmail.com with ESMTPSA id t21sm3416950ooc.43.2020.08.09.21.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 21:58:19 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] ARM: dts: am33xx: add ocp label
Date:   Sun,  9 Aug 2020 23:58:03 -0500
Message-Id: <20200810045802.1547989-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add label to the ocp node in the AM33xx SoC include so that it can be
referenced in board-level files like am335x-pocketbeagle.dts

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---

 arch/arm/boot/dts/am33xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 3b177c9c4412..02f0b886d177 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -172,7 +172,7 @@ mpu {
 	 * for the moment, just use a fake OCP bus entry to represent
 	 * the whole bus hierarchy.
 	 */
-	ocp {
+	ocp: ocp {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

