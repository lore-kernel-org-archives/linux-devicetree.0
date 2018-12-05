From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v10 0/6] Support for Qualcomm UFS QMP PHY on SDM845
Date: Wed, 5 Dec 2018 12:31:57 +0530
Message-ID: <CAFp+6iH9sz3NsejvxLdgAy+E-6Rff9RDA74EtnSidWOuZN=q9w@mail.gmail.com>
References: <1540269361-28185-1-git-send-email-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540269361-28185-1-git-send-email-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>
Cc: Subhash Jadavani <subhashj@codeaurora.org>, asutoshd@codeaurora.org, evgreen@chromium.org, Manu Gautam <mgautam@codeaurora.org>, kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 10:07 AM Can Guo <cang@codeaurora.org> wrote:
>
> This patch series adds support for UFS QMP PHY on SDM845 and the
> compatible string for it. This patch series depends on the current
> proposed QMP V3 USB3 UNI PHY support for sdm845 driver [1], on
> the DT bindings for the QMP V3 USB3 PHYs based dirver [2], and also
> rebased on updated pipe_clk initialization sequence [3]. This series
> can only be merged once the dependent patches do.
> [1] http://lists-archives.com/linux-kernel/29071659-dt-bindings-phy-qcom-qmp-update-bindings-for-sdm845.html
> [2] http://lists-archives.com/linux-kernel/29071660-phy-qcom-qmp-add-qmp-v3-usb3-uni-phy-support-for-sdm845.html
> [3] https://patchwork.kernel.org/patch/10376551/

Besides my comment for PATCH 4/6, I have already reviewed the entire series,
and it looks good.
If adding new bindings for sdm845 needs a further review, can you separate out
just the phy patches from this series (patch 1, 2, 3 & 6), and re-send them.
We can ask Kishon if he can pull them in for this merge window.
Thanks.

best regards
Vivek

>
> Changes since v9:
> - Incorporated review comments from Rob.
>
> Changes since v8:
> - Add one new change to support ufs core reset.
> - Incorporated review comments from Evan, Vivek.
>
> Changes since v7:
> - Add one new change to update UFS PHY power on sequence
> - Incorporated review comments from Evan, Vivek and Manu.
>
> Changes since v6:
> - Add one new change to clean up some structs and field
> - Updates the PHY power control sequence.
> - Incorporated review comments from Vivek and Manu.
>
> Changes since v5:
> - Updates the PHY power control sequence.
> - Updates UFS PHY power on condition check.
>
> Changes since v4:
> - Adds 'ref_aux' clock back to SDM845 UFS PHY clock list.
> - Power on PHY before serdes configuration starts.
> - Updates the UFS PHY initialization sequence.
> - Updates a few UFS PHY registers.
> - Incorporated review comments from Vivek and Manu.
>
> Changes since v3:
> - Incorporated review comments from Vivek and Rob.
>
> Changes since v2:
> - Incorporated review comments from Vivek and Rob.
> - Remove "ref_aux" from sdm845 ufs phy clock list structure.
>
> Changes since v1:
> - Incorporated review comments from Vivek and Manu.
> - Update the commit title of patch 2.
>
> Can Guo (5):
>   phy: Update PHY power control sequence
>   phy: General struct and field cleanup
>   phy: Add QMP phy based UFS phy support for sdm845
>   scsi: ufs: Power on phy after it is initialized
>   dt-bindings: phy-qcom-qmp: Add UFS phy compatible string for sdm845
>
> Dov Levenglick (1):
>   scsi: ufs: Add core reset support
>
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   4 +-
>  drivers/phy/qualcomm/phy-qcom-qmp.c                | 216 +++++++++++++++++++--
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  15 ++
>  drivers/scsi/ufs/ufs-qcom.c                        |  34 +++-
>  drivers/scsi/ufs/ufs-qcom.h                        |   1 +
>  drivers/scsi/ufs/ufshcd-pltfrm.c                   |  22 +++
>  drivers/scsi/ufs/ufshcd.c                          |  13 ++
>  drivers/scsi/ufs/ufshcd.h                          |  12 ++
>  8 files changed, 296 insertions(+), 21 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
