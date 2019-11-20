Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD65C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 738E32230F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMQm2rrm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728963AbfKTLCp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 06:02:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40452 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfKTLCo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 06:02:44 -0500
Received: by mail-wm1-f66.google.com with SMTP id y5so1129857wmi.5
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 03:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOeGvqEPSRnHWJK9v9F0Le+azJhOAvlzGL7W3dTQlic=;
        b=kMQm2rrmysXsEtZRsLtWhGKLog2gHmO7AWh5zHbe32ElY8LCea3Xf+9eFLoep8aMIf
         INZ97vQ/bsBpejx60oirHSc65LYlCRsDLyGY89ljvILMC5pT5wcy59GYb3hekzBFEMTx
         PKIvj4Q3d9NwCkgdzstOJoKKn7Unj0bRG6JUGZgUPDV0Z53A6P4q3to/xiphjd7SYTvQ
         +2TVDX4mQcgCIHFShGlAJImCMB7HacS92G5x+xsMyjZF/bpPoPCnnlZaiFK2Vg8Z4gmC
         5TOTX93rHrqOKJuZ14Cd6Q0cNFy7XApx6xwJ2ypoWmKs6R3ijuvKKntQtW1dAyoalnlu
         dUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOeGvqEPSRnHWJK9v9F0Le+azJhOAvlzGL7W3dTQlic=;
        b=W6y94b2nNrTCkkAMxSIjfrhk9DceHV2euzekf803zV+85Pun2CvtyFNWFJhLeJR66q
         ktC/EtXJCqAG/ZYWY2eHXsNQkpOo+Z27F1V6VWPCR6A1cIhhrh2iq2qOXrrLGjMgr1Dm
         pWxTozOpof/H9+ngaz84cLxZ4IOJPefLIksiKsVSVN+OpOde8s9rVPTar662PL7/Omy6
         fC1XoifFa6s39IgTg7zKW8mw3CHoGiNY5CoVWv+0+uYoaWUnme366Wu/T1hA2QJ9cPcq
         Bp/QrmGDQ8VWR1CXG6fWmaAqsg05EXYMYKqiVEv9t+ZXtMv36eaxh81T+OqVnAEtOeCZ
         JqCQ==
X-Gm-Message-State: APjAAAXnq7s5y0x2fQziOn5OkamXo0HKbYpLDgkorvaIufy5jlgpMDG8
        umtlwltmvt/ClWWjZTBULnQZAaawFhM=
X-Google-Smtp-Source: APXvYqxtwVK0T6hqJefUmPiH1r3EbF2/xB0ZSsyfcMC99NMYsHLOiUyqJFdyoviEBRZJhrQSBZXa4Q==
X-Received: by 2002:a1c:7d95:: with SMTP id y143mr2514040wmc.143.1574247762372;
        Wed, 20 Nov 2019 03:02:42 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id b8sm29979574wrt.39.2019.11.20.03.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:02:41 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        linux-amlogic@lists.infradead.org
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: net: Add compatible for BCM4335A0 bluetooth
Date:   Wed, 20 Nov 2019 14:02:34 +0300
Message-Id: <20191120110235.13987-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
References: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
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
index c749dc297624..f16b99571af1 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -15,6 +15,7 @@ Required properties:
    * "brcm,bcm43438-bt"
    * "brcm,bcm4345c5"
    * "brcm,bcm43540-bt"
+   * "brcm,bcm4335a0"
 
 Optional properties:
 
-- 
2.17.1

