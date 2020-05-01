Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D11C47256
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 21:46:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 908782166E
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 21:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLK/MVUZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgEAVqb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 17:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgEAVqa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 17:46:30 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD491C08E934
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 14:46:30 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id b1so9087799qtt.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2020 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/e974up5L7p2EuoJjEWBhJm9+klgFA+qT9TcmGyWDxo=;
        b=wLK/MVUZkZamne+YmZbJq2sQLoZiWa+KiljiYYOGZcfkHyVBJu09IZuZ9m7a4qLQR/
         B3iZYN5z8neiWvtpjIbZYNtypUzIh+IH9TjQAmHtsmcTu0LOnKzZ4aygmpKffwo6Xy7k
         5qIJ/IwswlLPH/fWKnXouh9thdgOglNuqx6DwxPDILmcap0vKjcjRdEZOU4RhKtcNMQX
         JMXUkIeRULDzBjEhnWoKbNH8mfTvSQtBHQ35AlpeeqDd7DckPA0IUWPCP2GlmggKavaH
         M/j6bvQns92ZNHAv1Lk65bOvDJnCov9wNwEn9j4eZTDJ4oy/amF1bPzEyLkETUsXxXf8
         rJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/e974up5L7p2EuoJjEWBhJm9+klgFA+qT9TcmGyWDxo=;
        b=kihzbnYwkbmPRgjkdHvpRNOQ+23gJG91zuwttPV14Y1wul2kpU5WbwWdl5pW0C4yQV
         NY8V3rzIMliv3qMKTjn+6q/QlMMv9IihQVyRqZLB+pVqHISd2EV2vKk2il30GAd6PpIu
         D3C9ZOXEMPEtYzaLZlWA56mIfa98u3gzPPL/Yq8PZ1Pz2v8pqslegelGg6GPZ8PpyV2z
         JzzqYrDUCy1N3SpY5eeVTUCFtZHLVK9duiQMee9pcYiPLnJ+cW1s74RqlXwpPWlecrId
         0rnFLODf3aYULCTg1XfCs1WhY8E0atOT8UbxP8n8ZmWz2H7mv4RONdxisCka3mOqaBDW
         LpbQ==
X-Gm-Message-State: AGi0PuYdslmlyQh1BRdXRHBXBTTm0DFDYqlosOWO4TQq0tFxpbzez/Kd
        LrPNtivnYYF+Srryqs4gmBNjlw==
X-Google-Smtp-Source: APiQypKXHzx9oTOTGiRb+iQ4oW2F4i2JoLrfWhiIHML18OG8xyDjXlXVH9MgeiBh20w2RmlSSctQMg==
X-Received: by 2002:ac8:65d4:: with SMTP id t20mr5924751qto.358.1588369589840;
        Fri, 01 May 2020 14:46:29 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id z18sm3470982qti.47.2020.05.01.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:46:29 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net
Cc:     evgreen@chromium.org.net, subashab@codeaurora.org,
        cpratapa@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next 0/4] net: ipa: I/O map SMEM and IMEM
Date:   Fri,  1 May 2020 16:46:21 -0500
Message-Id: <20200501214625.31539-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds the definition of two memory regions that must be
mapped for IPA to access through an SMMU.  It defines the SMMU for
the SDM845 SoC; the SC7180 already had this defined, though these
memory regions were not previously defined or mapped.

					-Alex

Alex Elder (4):
  arm64: dts: sdm845: add IPA iommus property
  net: ipa: redefine struct ipa_mem_data
  net: ipa: define IMEM memory region for IPA
  net: ipa: define SMEM memory region for IPA

 arch/arm64/boot/dts/qcom/sdm845.dtsi |   2 +
 drivers/net/ipa/ipa.h                |  10 ++
 drivers/net/ipa/ipa_data-sc7180.c    |  14 +-
 drivers/net/ipa/ipa_data-sdm845.c    |  14 +-
 drivers/net/ipa/ipa_data.h           |  23 +--
 drivers/net/ipa/ipa_main.c           |   2 +-
 drivers/net/ipa/ipa_mem.c            | 209 ++++++++++++++++++++++++++-
 drivers/net/ipa/ipa_mem.h            |   3 +-
 8 files changed, 256 insertions(+), 21 deletions(-)

-- 
2.20.1

