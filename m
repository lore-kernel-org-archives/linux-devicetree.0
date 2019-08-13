Return-Path: <SRS0=BPCO=WJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbfHMNKA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 13 Aug 2019 09:10:00 -0400
From: Govind Singh <govinds@codeaurora.org>
Subject: [v2 0/2] Add Q6SSTOP clock controller for QCS404
Date: Tue, 13 Aug 2019 18:39:44 +0530
Message-Id: <20190813130946.16448-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: sboyd@kernel.org
Cc: bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, andy.gross@linaro.org, linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Add support for the Q6SSTOP clock control used on qcs404
based devices. This would allow wcss remoteproc driver to
control the required WCSS Q6SSTOP clock/reset controls to
bring the subsystem out of reset and shutdown the WCSS Q6DSP.

Govind Singh (2):
  dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
  clk: qcom: Add Q6SSTOP clock controller for QCS404

 .../bindings/clock/qcom,q6sstopcc.yaml        |  45 ++++
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/q6sstop-qcs404.c             | 223 ++++++++++++++++++
 .../dt-bindings/clock/qcom,q6sstopcc-qcs404.h |  18 ++
 5 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
 create mode 100644 drivers/clk/qcom/q6sstop-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,q6sstopcc-qcs404.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
