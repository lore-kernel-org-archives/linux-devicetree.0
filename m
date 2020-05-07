Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E1C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA4DE20857
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="R/NqLOz1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgEGPBb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 11:01:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:32335 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727787AbgEGPBb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 11:01:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588863690; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XNy12ogKy2XS05WoA+Z2aanfF8e2oeYpurNyGPaGIAk=; b=R/NqLOz1A6vDQNA+8KIkubsQe6VB04RqUxgYKTd/4DepKPMYX1Pk62dBw6Qn9IV0hXYllgoQ
 FKFAPYD1GzMPusb4qXQjkoXs9dU6DkuIjQ0krFpIFZYwX/etc3hQlOrMRk9JYOZKlmsNZJKp
 IRFP3DnIgoXNfmo18ZYxWx+jTUM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb422b5.7feb1f3b9340-smtp-out-n02;
 Thu, 07 May 2020 15:01:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D9C8C072B5; Thu,  7 May 2020 15:01:09 +0000 (UTC)
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 115FDC44795;
        Thu,  7 May 2020 15:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 115FDC44795
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V6 0/3] Convert QUP bindings to YAML and add ICC, pin swap doc
Date:   Thu,  7 May 2020 20:30:44 +0530
Message-Id: <1588863647-17240-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Changes in V6:
 - As per Rob's suggestion moved pin swap documentation from QUP to
   serial.yaml file[PATCH V6 3/3].

Changes in V4:
 - Add interconnect binding patch.
 - Add UART pin swap binding patch.

Akash Asthana (3):
  dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
  dt-bindings: geni-se: Add interconnect binding for GENI QUP
  dt-bindings: serial: Add binding for UART pin swap

 .../devicetree/bindings/serial/serial.yaml         |   6 +
 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  |  94 ---------
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 227 +++++++++++++++++++++
 3 files changed, 233 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
