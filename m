Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42907C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 08:54:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19C492080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 08:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="Ri/H0muT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgGTIyZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 04:54:25 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216]:9918 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgGTIyZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235259;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=xqJHKDQXHXSYGgAHeCQ5gU1+hglEAoSnM1eZwD+RaOM=;
        b=Ri/H0muT/7+8aiGTgvzmbYgTtAzFSWBFF+yBq7mwijcs1pK0G0j0xIy+Roi1IjU5Yu
        aP0k/fbSOksXGbIqtRI660Kn3tMyZkIEL39xqB8MnhnHM0bJilJcuXzJotCd/wT0Kfmn
        7VYUvqkZhAIx6ObzZayhd6lnEtmxUFfffaBI/b16XAO8rqyFJK37Myv9qvkgI1a6+OfL
        UAFFq4hFN6e31609RcYGrHwfpNvLr9HWymMV9rwfdzSTBI7aLTqqeQp35XC7YmD0H2SY
        N0AZ1APcGZ4PLHHWfTMg10DsgrNn08raEK2755mDo9hXjcqn+QvWXz+HMagyTeRq541Y
        0QCQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sHdgC
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:17 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 00/10] Convert MSM8916 boards to use labels, reduce duplication
Date:   Mon, 20 Jul 2020 10:53:56 +0200
Message-Id: <20200720085406.6716-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Board device trees for newer SoCs reference labels to override properties
for components of the SoC. This patch series converts all MSM8916 boards to
use the same style.

Additionally, in the second part of the series I attempt to reduce duplication
within the MSM8916 board device trees a bit. If we keep copying a large number
of properties to each and every board of a SoC then (in my opinion)
it makes sense to consider if those can be shared in some include.

This will make it easier to add new boards in the future.

Stephan Gerhold (10):
  arm64: dts: qcom: apq8016-sbc: Remove properties that are already
    default
  arm64: dts: qcom: msm8916: Declare sound node in msm8916.dtsi
  arm64: dts: qcom: apq8016-sbc: Define leds outside of soc node
  arm64: dts: qcom: msm8916: Add more labels
  arm64: dts: qcom: msm8916: Use labels in board device trees
  arm64: dts: qcom: pm8916: Add resin node
  arm64: dts: qcom: msm8916: Move PM8916-specific parts to
    msm8916-pm8916.dtsi
  arm64: dts: qcom: msm8916: Move more supplies to msm8916-pm8916.dtsi
  arm64: dts: qcom: msm8916: Set default pinctrl for blsp1_uart1/2
  arm64: dts: qcom: msm8916: Move common USB properties to msm8916.dtsi

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 900 ++++++++----------
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 108 +--
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi     |  14 +-
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  |  79 ++
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 130 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  99 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |   8 +
 7 files changed, 625 insertions(+), 713 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi

--
2.27.0
