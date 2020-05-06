Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0E0C38A24
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAB8420663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhKsPiyT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgEFKgp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFKgp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:36:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B4FC061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:36:45 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k19so311242pll.9
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HiC/C0Co97PBF6CFHJsgZ2D4kseEIIqvn91LAyLhM+w=;
        b=MhKsPiyTEkP7v61CqxNhA5hm394wgnMINyQcsl9zKZ31EprkeryNXrojvKTSj1jY8o
         llhb/v34ImKJtwjV3Z8R8+jm5tQSu8Rc2wvCCAsKF4pLP4xm8upcAlMd6lxtD57oXbiy
         oldal6H3WGo2EPasu/R6F6yjmJbawEVPUbO+GIckptGw+vMC6qIxDTZan4nBqmCl3yNh
         9eQHCJSSGHDimr3r0QCauZ4WOP90YFv8JANVrK8OfVREipMdLwaM6/XY7FyMocINO4th
         Rf/xumEp3mpePbUX0EzBPlQ+Y2l1bOgQkNEFigGzFiGL1ldwd/NOul6bCL1y3Y+S3/IG
         d1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HiC/C0Co97PBF6CFHJsgZ2D4kseEIIqvn91LAyLhM+w=;
        b=qQMo0OlYWEFw0atVE8kmAwuhoCPCNHn7ZBD/Q+AArrBpe2JlAkGlL5vo6oNMTiFFgD
         MDZkwg/FieO+1pit9rKdRAqRilCAYQCK7pFMsPJL2vryyGqwdFhNO/a/LXTy9mfxyIXF
         x3/Ltii3uJppLxhlmR9Kud45QSeAnWqwG70ws1EAuB2w5zmo7L54qWa2B9lXl+KEjhkb
         9Y8ljF/14T2YcKeGmHammnxtzx0Y8jfmGXQTa+ahZsFFv9BvcK6xQrkhty6klrEUnCWq
         SxeXPw0fv2Gd1C5p6j8WK5evnB+P8ZJX3wTulcO/GI3vPjqcIhxDRHXdpTHMJNQ9CrRH
         vv/g==
X-Gm-Message-State: AGi0PubNIBtva2Pg3SZ37eCIv9dWFtaFbWm3oza3dw3K2eltRTuPro8M
        n8eF+8zkyNKsKz3Ojk/W39Q=
X-Google-Smtp-Source: APiQypJdhBuVsxVsAq0zyvGoSszqpLIfvIi54LZSqULmnpZvksNO4TKsokSuKUsMt0+VFll3X4EJzw==
X-Received: by 2002:a17:902:b417:: with SMTP id x23mr7060948plr.51.1588761404736;
        Wed, 06 May 2020 03:36:44 -0700 (PDT)
Received: from localhost.localdomain ([106.215.43.48])
        by smtp.gmail.com with ESMTPSA id i72sm1601582pfe.104.2020.05.06.03.36.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 03:36:44 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC 4/8] arm64: dts: actions: disable sps node from S700
Date:   Wed,  6 May 2020 16:06:06 +0530
Message-Id: <1588761371-9078-5-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

After commit 7cdf8446ed1d ("arm64: dts: actions: Add pinctrl node for
Actions Semi S700") following error has been observed while booting
Linux on Cubieboard7-lite(based on S700 SoC).

[    0.257415] pinctrl-s700 e01b0000.pinctrl: can't request region for
resource [mem 0xe01b0000-0xe01b0fff]
[    0.266902] pinctrl-s700: probe of e01b0000.pinctrl failed with error -16

This is due to the fact that memory range for "sps" power domain controller
clashes with pinctrl.

This commit fixes it by disabling "sps" node, it is safe as "sps" is not
being used at the moment.

Fixes: 7cdf8446ed1d ("arm64: dts: actions: Add pinctrl node for Actions
Semi S700")

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 2006ad5424fa..0397c5dd3dec 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -220,6 +220,7 @@
 			compatible = "actions,s700-sps";
 			reg = <0x0 0xe01b0100 0x0 0x100>;
 			#power-domain-cells = <1>;
+			status = "disabled";
 		};
 
 		timer: timer@e024c000 {
-- 
2.7.4

