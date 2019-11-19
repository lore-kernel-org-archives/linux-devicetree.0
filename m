Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040DFC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 19:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D09D5223B0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 19:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ0sFL+u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKSTqr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 14:46:47 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51763 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKSTqr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 14:46:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id q70so4551957wme.1
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 11:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fKtUgPJi24FIzqrE0v4WnWjrv8ka1YzV4SVOi341LVQ=;
        b=hJ0sFL+u5o5nqriZoZv5s9sZngNo4h9LHTKViWke2quZpvDSFw+PoxZ+jAOMPp12ES
         v6U27TxnOVjJnSblg2hXMn2l3aY3wY+uKr7PEhRtl9KvZF6rNklBmjQE2sH1Umz1D61c
         LNPITjgspXYkWkYW+S/zbOTrn+Fy5helHm/MtqezZmVI5U///KPBSd3gMh7Nlw5FZfPW
         fq7LN1dzQ3ALiHo3BnkRmf3DHLh1WWRRn7dBZY3h1+bOojFXeyrgpOx4d5nOZM/tlb8M
         tQPnHOebx8x5PcUssQwJ6SLJgrJQ2JUpSIQoBVRf43cvNnRMGBSdZjkUkymk5U1w+iVk
         j56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKtUgPJi24FIzqrE0v4WnWjrv8ka1YzV4SVOi341LVQ=;
        b=Y+tu0mFRQaw3+O0prlXWSJyvc5Kfo9W7vbZEViNnycOlkQ2MhB4VAdCVYSpMoV9LFD
         rAZKfwwlpMHBqL6nPqlTadJvMp0r/Rix71dY01MT5PjCFMilF/vRkcuQ5QS6Jeoiq9mm
         HkyA5ye8zIBeDT97F8FlGk59heIY5pWHOPar0JtFMPhy+S6fnHol3sjHHGRtUuxfB2c2
         hKTZ88BuwVdToc4Vv6dwfkZpm2S6j0DiVKOK18vkrJkny66C3Yps5t40Wdl8/wHwrR7h
         RMIIqbx8RxKOb2ggEru90EawyFMJTM1JmNVS9LXvt6Q8xFDlZE1nJ2QHwk8GqKrekfH/
         1gnA==
X-Gm-Message-State: APjAAAXo7ogaJz2lk1Ql25NbSOIJDUl7VhVuBx2XCzeoE0+dvHByFJBd
        az2mrSfUfxEU1lk8bp2Ui5bhjgKNuyQ=
X-Google-Smtp-Source: APXvYqzCfVD/+3BoAtld9Gm6HlDPgteBTpjkDPApJjaLbqLHkUZbTbJEzgGiGbCps+VQyziZBN7Rgg==
X-Received: by 2002:a05:600c:212:: with SMTP id 18mr8218527wmi.93.1574192805137;
        Tue, 19 Nov 2019 11:46:45 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id m15sm15180718wrj.52.2019.11.19.11.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 11:46:44 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH 1/2] dt-bindings: net: Add compatible for BCM4335A0 bluetooth module
Date:   Tue, 19 Nov 2019 22:46:37 +0300
Message-Id: <20191119194638.4967-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119194638.4967-1-mohammad.rasim96@gmail.com>
References: <20191119194638.4967-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Available in the Ampak AP6335 WiFi/Bluetooth combo

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index 4fa00e2eafcf..0717399191a2 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -14,6 +14,7 @@ Required properties:
    * "brcm,bcm4330-bt"
    * "brcm,bcm43438-bt"
    * "brcm,bcm4345c5"
+   * "brcm,bcm4335a0"
 
 Optional properties:
 
-- 
2.24.0

