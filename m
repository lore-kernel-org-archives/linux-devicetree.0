Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E806C3F2D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 22:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4597246B4
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 22:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ov0h+3Me"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbgB1Wmr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 17:42:47 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:35966 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgB1Wmp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 17:42:45 -0500
Received: by mail-yw1-f67.google.com with SMTP id y72so4965179ywg.3
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 14:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rBNZ2vXyhxdKjjPVhgfvGeeO+0/SInHI1a05bF63DNs=;
        b=ov0h+3Mevwwb7JRSBbaI50cmb7TS6mbPJ85QLtqhRoY2Mft7RJCqE1A4usLDBEQfyq
         SxAEj3TBAZAtIpkm6hvcucBiWKG1yvNMVWw7Tndoebn1PSGqRUQIvj/gocZHd30nrMY2
         3sFmrT/5Z+WkrnzUVbRQ6A/YCQgFco6VeahzBTAUOY5Oq5ZBee02REQpiF1DhZykiZvg
         10vjo/ZUBgSgkds/weBbcpmiEVGV/6wFXiG3cnAScX17dXX4qbsD2KTerTyMpTeTfq3d
         1tzwWXA6afl03yCz7+nEB//eOnXi+agCBFc7fEX8vdmt2uT3CSAWVGxGFa8BOHow8vP2
         PXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBNZ2vXyhxdKjjPVhgfvGeeO+0/SInHI1a05bF63DNs=;
        b=etCr2NCx813q/v4b6vpD2Xv6d8m+JVLUETCVctwvGPvIgDTDAMx8qWlnYFHAxmNlrn
         3rKtycJpPyy+ODRu7nLAJhO1JOu/JVmOBVETdjCiwJBXBt7qxVXA/olNFJgMiZOeYNw+
         1Znk33UqM3fuuQ3ByHCZziM9t38RdRzkAi+6QsYuLchNcVAf+HEgEr0b/CqvvkWbv7wX
         7TbFiwurjktYkw5cRBL4ro/vZI6MVwA9B+ZqErAq4QZ8QBBWbb4834dQFZ9OjYc4guS/
         vKeKBz3rWinrwz1UqVjQ/Cz8k4PUC8zYrG5O3qS2720eimL6knw8cFPVAcy2MqXef0Lt
         pJ2w==
X-Gm-Message-State: APjAAAXrIbkxDEGdcbr94CFvUdcLUh2MB4wkIMZI9zpJt3vQUfiqOoii
        D3lhvnzVmuFRUB37F434Hjvnxg==
X-Google-Smtp-Source: APXvYqzCnkaSsbmC+fcQRH5hKJw0WVbqzYQqbj5IN6MRfe4oJ4isWav3JGkTyME63rxVAVn0nktf4g==
X-Received: by 2002:a81:27cc:: with SMTP id n195mr6712318ywn.491.1582929763518;
        Fri, 28 Feb 2020 14:42:43 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id d188sm4637830ywe.50.2020.02.28.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 14:42:43 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, David Miller <davem@davemloft.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dcbw@redhat.com>,
        Evan Green <evgreen@google.com>,
        Eric Caruso <ejcaruso@google.com>,
        Susheel Yadav Yadagiri <syadagir@codeaurora.org>,
        Chaitanya Pratapa <cpratapa@codeaurora.org>,
        Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/17] MAINTAINERS: add entry for the Qualcomm IPA driver
Date:   Fri, 28 Feb 2020 16:42:03 -0600
Message-Id: <20200228224204.17746-17-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228224204.17746-1-elder@linaro.org>
References: <20200228224204.17746-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an entry in the MAINTAINERS file for the Qualcomm IPA driver

Signed-off-by: Alex Elder <elder@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd79fc38928..49a680b0c945 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13664,6 +13664,12 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	sound/soc/qcom/
 
+QCOM IPA DRIVER
+M:	Alex Elder <elder@kernel.org>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ipa/
+
 QEMU MACHINE EMULATOR AND VIRTUALIZER SUPPORT
 M:	Gabriel Somlo <somlo@cmu.edu>
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.20.1

