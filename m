Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36966C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 14:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F65A208CD
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 14:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yewZkC5P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgCEOxx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 09:53:53 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43335 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgCEOxw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 09:53:52 -0500
Received: by mail-wr1-f53.google.com with SMTP id v9so776864wrf.10
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCZ4HBLcDjnL0GdiZ5dsCCZ5Ed4ecHOyKpkVxr2Wiks=;
        b=yewZkC5Pn9QnislGnz/uZFfnAAGZWyd7Ao8vvhbNkIKtHlSvMCkKMmeqn2RnBR749E
         Q/Tsersijkoxdqb56hKlHqu8Y6xz0TKDRw78BcLFLdeRtsS8LqnQmKOdMmFpGJSVy5I6
         xMC6STJnPA+hgvvcxotH0AS1oagHWOHjuNiwoGEtOOLYYysTPnaLwD78XH9mnWKH15JM
         Z4cHOLiZpLFdN2nqzAtofFYq8Kf8nXLPAFEnKEnQG/Vlc2Vu08qESciVnElHIZrKnU06
         tUPrTHwcbX/ifBZ8bQj9KwplZ4xVmzhjYFRz8+Mrg5ACXuHP4Qs7T6qCiSKoH0Pihbgx
         M83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCZ4HBLcDjnL0GdiZ5dsCCZ5Ed4ecHOyKpkVxr2Wiks=;
        b=YpkXecCl9OC3l7nAIwBba/rnqOd03rEU2Xpn7tVsa3OHO0LbDZFyYFWAvHOLoBbEuW
         1rsttdVDn5tjId3ZECmQw+2id/9iWqCFqWiZbSVTJ2z9WoO+Hsb3zUA93Q0NyufSgvkf
         XHRCxI3SgESIuR/aQSLxNyxEyCj+yGTbxxEcNPHZGeXwHxk4/2Ws43MReRugmB+EEn3F
         vZUYf+A2B1Qek0QFBSpRbdznbuqPne6PZ+QbQYUOTr6FgwSCkOx+VxeNZ8IcipTKS8ov
         1S1yHyDG5nBaNAPGh/N0H0FtX0XLOGY6MX8GZ46/vObPYuwCxmpYbp8bafN33yT01EvK
         NgpQ==
X-Gm-Message-State: ANhLgQ09cR8K8xTDM0AcRlcTXfXSM35M1uoAvwwzDj0aBKkpXDauqTjC
        955xZUHHa8Jmtmt+cigCtNp02QO+aek=
X-Google-Smtp-Source: ADFU+vsfm72FlPKo2DedsUpzOgx9vtyfPB8peWEuftgmEYyDsNFyRjk9QP5ylKJRXp0nOMtr/hbdHw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr10701691wrm.260.1583420030754;
        Thu, 05 Mar 2020 06:53:50 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:50 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sdm845: add audio support
Date:   Thu,  5 Mar 2020 14:53:40 +0000
Message-Id: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

First 3 patches in this patchset adds support to audio via wcd934x codec.
Last patch adds support to i2c/spi buses on Low speed expansion.


Srinivas Kandagatla (4):
  arm64: dts: qcom: sdm845: Add ADSP audio support
  arm64: dts: qcom: c630: Enable audio support
  arm64: dts: qcom: db845c: add analog audio support
  arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 147 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 338 ++++++++++++++++++
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  91 +++++
 3 files changed, 576 insertions(+)

-- 
2.21.0

