Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2272C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 05:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2723217A0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 05:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="k+ulofJ3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgFRF2r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 01:28:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38144 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725982AbgFRF2r (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 18 Jun 2020 01:28:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592458126; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EmaEgt1L6ViPKfE6/OUzb3Jvazr//Dq/SOVSHuZE6fo=; b=k+ulofJ3TasYSXPNAWbprjcFAh/E+D3h6qvJpKEdIbvHPZvQJNdUKdbEq/JZM1SPV+A5IzHm
 fG6tHL0Td2c5GqaKIQM/AOq27VQS/RKhBGh2wXxy+O22Cr94mcVGDfgoeNd0EcV1TSCxpYeP
 vDRf2ogg73CCLuVVEDU905jNdic=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5eeafb896f2ee827da319d5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 05:28:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60372C433CB; Thu, 18 Jun 2020 05:28:41 +0000 (UTC)
Received: from vnaralas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akolli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 980C9C433C8;
        Thu, 18 Jun 2020 05:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 980C9C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akolli@codeaurora.org
From:   Anilkumar Kolli <akolli@codeaurora.org>
To:     ath11k@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
        Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH v3 0/3] ath11k: Add IPQ6018 support
Date:   Thu, 18 Jun 2020 10:58:21 +0530
Message-Id: <1592458104-2961-1-git-send-email-akolli@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IPQ6018 has a 5G radio and 2G radio with 2x2
and shares IPQ8074 configuration.

Tested on: IPQ6018 WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
Tested on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1 

Anilkumar Kolli (3):
  dt: bindings: net: update compatible for ath11k
  ath11k: copy ce service configs to hw_params
  ath11k: add IPQ6018 support

V2:
 - Added devicetree reviewers 
V3:
 - addressed dt bindinds comments
 - Reworked on Kalles patches
 - copied ce svc configs to hw_params

 .../bindings/net/wireless/qcom,ath11k.yaml         |   6 +-
 drivers/net/wireless/ath/ath11k/ahb.c              | 131 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/core.c             |  20 ++--
 drivers/net/wireless/ath/ath11k/core.h             |   2 +
 drivers/net/wireless/ath/ath11k/hw.h               |   2 +
 5 files changed, 148 insertions(+), 13 deletions(-)

-- 
2.7.4

