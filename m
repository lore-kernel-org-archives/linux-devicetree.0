Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9460EC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 22:28:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68B502075A
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 22:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUET2RAb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731003AbgFVW1i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 18:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730943AbgFVW1i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 18:27:38 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B03C061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 15:27:38 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id k4so17142348oik.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITz+ptFn0zIfgdfvFZ/S5CpN+Oe6Mi6zylLqym4S7xM=;
        b=NUET2RAb9Fy4jh0itY9PBNBoO8agVcG2ufmkeRJ9N5vUMAyUEasRmN9EzEyfXdPnnq
         dFJQblCXuQscXyG2O8BCz3ZyHCC5NMPr0KGqhTNtPuJdw/H6IQmE5Z6JTsfSgqG++gKz
         Ew+S1SdRXNKEu4TMThwLx/0avfDXF3LD/eyKbwTbMeMVIWhC1tI7RIidqR7VHX0jVfTZ
         hGLzgKE1J1nvusvgIgZbUC/tzCTbUHCC/fxNvI9J7+/E2FDNr864I7jjh4RT+875kQs5
         u8t4G0hOFr1/JojaP0mV7bSTVEFzTI9NKIg3oB0p5ErMUP0LLl5uJA48/y1Gr5urab19
         5jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITz+ptFn0zIfgdfvFZ/S5CpN+Oe6Mi6zylLqym4S7xM=;
        b=iEvZ2Yaqdb34gpQN1CNxHWeEzb4eX1Mpi+BJriXw8zCLMi+vgzH06LTMFxSFd4l7XE
         lqOLygAw2x//2nOVuTyBvySX4N47Lu9XQ3/ogbqjRyWcq+cwLKz7kFvCwSyIJij+KQ6Y
         gubcGmSPIPJsC75jWnpBFZvV1bz8ROuReNnTPhrC6kKpa/rLCJ7LrcdhqqVjkEsBC+15
         saVGvOTaWFdQlwh8n5N5k6NgN8WozktEr5LkXlO7QMK0av9LM7rvW+M2UjTkwcH9+tNx
         OCJySuKe62ioWLNEjqOv+ZOybtuwmIiZq77cJWdKrGVq3Jk83NMIEzk2FAXjzXMIetRz
         QwgQ==
X-Gm-Message-State: AOAM5332aEkV2N/m3I+mT7COIG32UGPwaCWsyXUFCvS3nW3js97CXBqQ
        AeCKX5F9m+HuyjTNg1sNjUEcYA==
X-Google-Smtp-Source: ABdhPJwqW/Y0MUqJQdB6foEY7KXYce3UdPNSK3HcM50dk2V6HjK8dBjLV1PAxJAeXbaZ0JIEs61FUw==
X-Received: by 2002:aca:5e43:: with SMTP id s64mr14309691oib.79.1592864857269;
        Mon, 22 Jun 2020 15:27:37 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h36sm3589304oth.37.2020.06.22.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:27:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] arm64: dts: qcom: Enable SM8250 remoteprocs
Date:   Mon, 22 Jun 2020 15:27:41 -0700
Message-Id: <20200622222747.717306-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With the driver code in place, add the necessary dts nodes to enable three of
the remoteprocs found on Qualcomm SM8250 and finally enable the missing
QCOM_IPCC driver in defconfig.

Bjorn Andersson (6):
  arm64: dts: qcom: sm8250-mtp: Drop PM8150 ldo11
  arm64: dts: qcom: sm8250: Add IPCC
  arm64: dts: qcom: sm8250: Add QMP AOSS node
  arm64: dts: qcom: sm8250: Add SMP2P nodes
  arm64: dts: qcom: sm8250: Add remoteprocs
  arm64: defconfig: Enable Qualcomm IPCC driver

 arch/arm64/boot/dts/qcom/sm8250-mtp.dts |  22 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 212 ++++++++++++++++++++++++
 arch/arm64/configs/defconfig            |   1 +
 3 files changed, 228 insertions(+), 7 deletions(-)

-- 
2.26.2

