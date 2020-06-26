Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8394C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 18:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80DA320836
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 18:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="g6WiqbLI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgFZSBx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 14:01:53 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60098 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725806AbgFZSBw (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 14:01:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593194512; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3jBIQeSeWIXTNigOUBSApAntBRRgxn7gCDEW1Xz+o8A=; b=g6WiqbLIvRYet1RHNXJu1uliw1qZJ3DEL+UPFJ9VW0FYmduR00qkiAy3sjaRQVj2s4Qiqnew
 IdW0tCuZD7mWDULr4jtolggn1uukXfy+NVTeV/fZ8Kt5hOF5MQey8457oYXhDGirhkqHE7sL
 DiuecLSgCKye2onRR0jtg9JIwMQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ef6380e4c9690533a604e24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 18:01:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 015E2C433CA; Fri, 26 Jun 2020 18:01:50 +0000 (UTC)
Received: from pillair-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09E3BC433C8;
        Fri, 26 Jun 2020 18:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09E3BC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     ath10k@lists.infradead.org, devicetree@vger.kernel.org
Cc:     linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 0/2] ath10k: Add chain-1 voltage regulator voting
Date:   Fri, 26 Jun 2020 23:31:40 +0530
Message-Id: <1593194502-13164-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the support to vote for the chain-1
voltage regulator for WCN3990. This is
added as an optional property.

Rakesh Pillai (2):
  dt: bindings: Add new regulator as optional property for WCN3990
  ath10k: Add support for chain1 regulator supply voting

 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 4 +++-
 drivers/net/wireless/ath/ath10k/snoc.c                         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.7.4

