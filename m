From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v8 0/5] Support for Qualcomm UFS QMP PHY on SDM845
Date: Wed, 29 Aug 2018 23:16:04 -0700
Message-ID: <20180830061604.GM2523@minitux>
References: <20180731100914.19856-1-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731100914.19856-1-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 31 Jul 03:09 PDT 2018, Can Guo wrote:

> This patch series adds support for UFS QMP PHY on SDM845 and the
> compatible string for it. This patch series depends on the current
> proposed QMP V3 USB3 UNI PHY support for sdm845 driver [1], on
> the DT bindings for the QMP V3 USB3 PHYs based dirver [2], and also
> rebased on updated pipe_clk initialization sequence [3]. This series
> can only be merged once the dependent patches do.
> [1] http://lists-archives.com/linux-kernel/29071659-dt-bindings-phy-qcom-qmp-update-bindings-for-sdm845.html
> [2] http://lists-archives.com/linux-kernel/29071660-phy-qcom-qmp-add-qmp-v3-usb3-uni-phy-support-for-sdm845.html
> [3] https://patchwork.kernel.org/patch/10376551/
> 

Hi Can,

We still have the issue that the older non-QMP phy driver takes a direct
call to ufs_qcom_phy_set_tx_lane_enable(), which means that pointing
UFSHCD to this phy implementation results in a kernel panic.

I do however think this series is good in itself and would like to see
it merged. As any fix for this problem would be done on top of the
patches in this series.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
