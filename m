From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sdm845: Fix DMA allocations for devices with IOMMU
Date: Wed, 16 Jan 2019 20:29:38 -0800
Message-ID: <20190117042940.25487-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These patches extends the size cells of the soc bus and define the dma-ranges,
so that DMA allocations for devices with IOMMU attached will get valid IOVAs.

Changes since v3:
- Split patch in two
- Rewrote commit message from scratch

Bjorn Andersson (2):
  arm64: dts: qcom: sdm845: Increase address and size cells for soc
  arm64: dts: qcom: sdm845: Extend ranges and describe DMA space

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 301 ++++++++++++++-------------
 1 file changed, 151 insertions(+), 150 deletions(-)

-- 
2.18.0
