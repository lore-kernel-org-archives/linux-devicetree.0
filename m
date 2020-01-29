Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6E4C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 23:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71D5020678
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 23:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=onstation.org header.i=@onstation.org header.b="RdNNTJQu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgA2XUl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from onstation.org ([52.200.56.107]:33822 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgA2XUl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E7C733EA37;
        Wed, 29 Jan 2020 23:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1580340040;
        bh=AVfrxq/bgHG2VL086oSFDsW9fAAX7ROC572hdaXl2pI=;
        h=From:To:Cc:Subject:Date:From;
        b=RdNNTJQudExUtFRDO/mT6K/R2rD1pjC3LwpLnGT8grutPfakjNePjuK4PJidLkiW1
         UStyO2KDJvYgnLYKbgojB1rlf1cJwRDBdaO6U3Ku0/kPwE8XU86+Remgzal0+FWzkp
         vHfG6KW+TGl0PuGbQf3BGBQ6hTIi2TsQ1DVvXSk8=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH 0/3] ARM: qcom: add Nexus 5 bluetooth support
Date:   Wed, 29 Jan 2020 18:20:28 -0500
Message-Id: <20200129232031.34538-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Here's a small patch series that gets the bluetooth working on the Nexus
5 phone.

For a summary of what currently works upstream on the Nexus 5, see my
status page at https://masneyb.github.io/nexus-5-upstream/.

Brian Masney (1):
  ARM: qcom_defconfig: add Broadcom bluetooth options

Jonathan Marek (2):
  ARM: dts: qcom: msm8974: add blsp2_uart10
  ARM: dts: qcom: msm8974-hammerhead: add support for bluetooth

 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 71 +++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  9 +++
 arch/arm/configs/qcom_defconfig               |  4 ++
 3 files changed, 84 insertions(+)

-- 
2.24.1

