From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v8 0/5] Support for Qualcomm UFS QMP PHY on SDM845
Date: Thu, 30 Aug 2018 16:14:22 +0530
Message-ID: <CAFp+6iGDvt9UX8y7HCwC+QdTdyCLxuj5pNWbbttJAHGEPW+tyw@mail.gmail.com>
References: <20180731100914.19856-1-cang@codeaurora.org> <20180830061604.GM2523@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830061604.GM2523@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Can Guo <cang@codeaurora.org>, Subhash Jadavani <subhashj@codeaurora.org>, asutoshd@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2018 at 11:46 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 31 Jul 03:09 PDT 2018, Can Guo wrote:
>
> > This patch series adds support for UFS QMP PHY on SDM845 and the
> > compatible string for it. This patch series depends on the current
> > proposed QMP V3 USB3 UNI PHY support for sdm845 driver [1], on
> > the DT bindings for the QMP V3 USB3 PHYs based dirver [2], and also
> > rebased on updated pipe_clk initialization sequence [3]. This series
> > can only be merged once the dependent patches do.
> > [1] http://lists-archives.com/linux-kernel/29071659-dt-bindings-phy-qcom-qmp-update-bindings-for-sdm845.html
> > [2] http://lists-archives.com/linux-kernel/29071660-phy-qcom-qmp-add-qmp-v3-usb3-uni-phy-support-for-sdm845.html
> > [3] https://patchwork.kernel.org/patch/10376551/
> >
>
> Hi Can,
>
> We still have the issue that the older non-QMP phy driver takes a direct
> call to ufs_qcom_phy_set_tx_lane_enable(), which means that pointing
> UFSHCD to this phy implementation results in a kernel panic.

Hi Bjorn,

I have a series that removes couple of these function calls -
ufs_qcom_phy_set_tx_lane_enable(), and
ufs_qcom_phy_save_controller_version() from ufs-qcom, and
make phy-qcom-ufs-qmp-20nm as broken.
I can post it out if that sounds okay.

Best regards
Vivek

[snip]


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
