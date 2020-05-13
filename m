Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF9C2D0FD
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 00:55:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47BFD20753
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 00:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITZ6s8nf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732083AbgEMAzy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 20:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732075AbgEMAza (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 May 2020 20:55:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09655C061A0F
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 17:55:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t9so10382794pjw.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 17:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aVsTRV0Vd7AjARuX1FSoP3j3p4vMbsUynYNIWG2zcg=;
        b=ITZ6s8nfqeBtfn0oVoLGCgrnjOV1Xy0pZ3QdECW67KsV/hkeylPh/9bZ5pY1ytrDEv
         MYdwBAJh+8DHuXK6VaGPgTKlQozijma7VAZhrA2jziS2Wlfl2Aj0GO+oGXYBdvOHYkNI
         1zyQX/hfzOnC2niIDuG1u0ohwO0xg+hWVawxT9+Pn0+2OOKKwn0xZv2Qvv+BXw3KPfaT
         Ba0QGr4CYQTEmMg3MUxArtF/PEekKi386oRGyi9pXGwCAQiIgxbtoqYViHsSJgREiy1K
         Y7ilsmDsR0Th/RdJdnf+j5yqKLOCA3bz1sKYYSDzKdxvqgerEGPd3qk7PmVJDXYSzYoI
         zGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aVsTRV0Vd7AjARuX1FSoP3j3p4vMbsUynYNIWG2zcg=;
        b=CqdXG2c9gbwvx6rOB3iopmY/sVigDJIdpCenWHHIX73AwuCc4FFj3BpN2V6T9mT7c9
         SAANnQum6QBly41bYsYnp0asns9CGLponHB1sR9OxcDjn1Jtw/nUUx5B4wczye4bl1vq
         JrQ/nq+gOZNC+9JYpZxZd/OscCXMosTE8wSotek+q2TTRQ4hSudkMqx9zfiQqrul4UJS
         /kKobLySg5PP5XJISSY88IwalUQ44OdCgATpbH+9nRi7fed+zo4DhPBZHOypdMbAEuPq
         EXbROgjtIXMiPJR9UgEwUGAtCnyFQbr3BajpMpCe1U06u7PKeQSoFH7jMJp61WAiCPp6
         PgCw==
X-Gm-Message-State: AGi0PuacIo7MYn6aiyL6iLm+V1wAtNi8fKk/itifhnyP3a0gmkzt65do
        M2vn1n6TYDOdJVennjaB2ZXp9A==
X-Google-Smtp-Source: APiQypI3O4oBkDtpKaBNHwg5f+8AZEbJC5eKmdrym5Hi5g9Mw7N4wvHIlkhR/lrQNiEANYIJvRADLA==
X-Received: by 2002:a17:90a:da05:: with SMTP id e5mr32780994pjv.140.1589331329287;
        Tue, 12 May 2020 17:55:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] hwspinlock: qcom: Allow dropping the intermediate TCSR mutex syscon
Date:   Tue, 12 May 2020 17:54:37 -0700
Message-Id: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In all modern Qualcomm platforms the mutex region of the TCSR is forked
off into its own block, all with a offset of 0 and stride of 4096.
Update the binding to allow the hardware block to be described directly
on the mmio bus, in addition to allowing the existing syscon based
definition.

Bjorn Andersson (4):
  dt-bindings: hwlock: qcom: Migrate binding to YAML
  dt-bindings: hwlock: qcom: Allow device on mmio bus
  hwspinlock: qcom: Allow mmio usage in addition to syscon
  arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon

 .../bindings/hwlock/qcom-hwspinlock.yaml      | 65 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 11 +--
 drivers/hwspinlock/qcom_hwspinlock.c          | 72 ++++++++++++++-----
 3 files changed, 124 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

-- 
2.26.2

