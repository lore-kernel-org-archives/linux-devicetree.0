From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v7 0/5] arm64: dts: qcom: sdm845: Add UFS DT nodes
Date: Tue, 11 Dec 2018 15:56:16 +0530
Message-ID: <1d00081d-7ef5-20fb-b04b-3b51ca9cd6da@ti.com>
References: <20181210192826.241350-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210192826.241350-1-evgreen@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>, Andy Gross <andy.gross@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, Can Guo <cang@codeaurora.org>, linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/12/18 12:58 AM, Evan Green wrote:
> Update the device tree bindings for the QMP PHY to properly
> specify the registers for dual-lane PHYs. Update the driver to use
> those new registers. Add the DT nodes for UFS on SDM845 and MTP.
> Finally, fix up the USB3 PHY on SDM845, which also has a dual-lane phy
> 
> This series is now based on phy/next, and given that the changes stack,
> I guess that means Kishon will take the whole thing?

No. I'll take only the phy changes. The dts changes can probably be taken by
Andy during the early 4.21 -rc cycle.

Thanks
Kishon
> 
> Changes in v7:
>  - Rebased on top of phy/next
> 
> Changes in v6:
> - Removed resets and reset-names (Bjorn)
> - Renamed nodes (Bjorn)
> - Fix renamed nodes in MTP (Bjorn)
> 
> Changes in v5:
> - Fix incorrect register value in example, copied from real life!
> 
> Changes in v4:
> - Remove "status" from DT binding example (Rob)
> 
> Changes in v3:
>  - Removed erroneous fixup for USB UniPro PHY, which is not dual lane (Doug)
> 
> Changes in v2:
> - Added dt bindings change, corresponding driver fixup, and USB PHY fixup
> - Renamed ufsphy to phy (Vivek)
> - Removed #clock-cells (Vivek)
> 
> Can Guo (1):
>   arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
> 
> Evan Green (4):
>   dt-bindings: phy-qcom-qmp: Fix register underspecification
>   phy: qcom-qmp: Utilize fully-specified DT registers
>   arm64: dts: qcom: sdm845: add UFS controller
>   arm64: dts: qcom: sdm845: Add USB PHY lane two
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 69 +++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       | 14 ++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 68 +++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 51 ++++++++++----
>  4 files changed, 181 insertions(+), 21 deletions(-)
> 
