Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D66C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 06:28:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23A5920787
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 06:28:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="J9Sn9cbd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgE0G22 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 02:28:28 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16068 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728663AbgE0G21 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 02:28:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590560906; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=QNB5FFL3qfSRO+ExYgJpo60mpcmeIY+MQbQKCqhYofs=; b=J9Sn9cbdmGGaZgBjdzJvPWqAHPdFZHJkL/VGMe2Bg2JinxTX5zeIldK3dPpB5PCDOgZJYPD+
 hM1WealL/UpVfnR/LTIEMGFMlXZ6P86NKhP/B7tFuyPhaxmMmQIWf06BMbqlSUzTVOEWkTlA
 nrBo9EI+Kpf09oiRkESnI4zdEQw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ece087b37a454afcb7a814f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 06:28:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 619A6C433CA; Wed, 27 May 2020 06:28:11 +0000 (UTC)
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27034C43387;
        Wed, 27 May 2020 06:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27034C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        msavaliy@codeaurora.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V7 3/3] dt-bindings: serial: Add binding for UART pin swap
Date:   Wed, 27 May 2020 11:57:44 +0530
Message-Id: <1590560864-27037-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590560864-27037-1-git-send-email-akashast@codeaurora.org>
References: <1590560864-27037-1-git-send-email-akashast@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add documentation to support RX-TX & CTS-RTS GPIO pin swap in HW.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V7:
 - As per Rob's comment, added type: boolean to properties.

 Documentation/devicetree/bindings/serial/serial.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 53204d9..8645d0e 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -67,6 +67,14 @@ properties:
       (wired and enabled by pinmux configuration).  This depends on both the
       UART hardware and the board wiring.
 
+  rx-tx-swap:
+    type: boolean
+    description: RX and TX pins are swapped.
+
+  cts-rts-swap:
+    type: boolean
+    description: CTS and RTS pins are swapped.
+
 if:
   required:
     - uart-has-rtscts
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

