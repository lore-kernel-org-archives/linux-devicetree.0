From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v8 4/5] scsi: ufs: Power on phy after it is initialized
Date: Thu, 9 Aug 2018 11:00:37 -0700
Message-ID: <CAE=gft4xCk2MD-oOAuCRwWz6J9mMvZGFR2J+E7vcu06+3xBZRQ@mail.gmail.com>
References: <20180731100914.19856-1-cang@codeaurora.org> <20180731100914.19856-5-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731100914.19856-5-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cang@codeaurora.org
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 3:09 AM Can Guo <cang@codeaurora.org> wrote:
>
> Before UFS PHY is initialized, powering on it has no effect but increases
> the PHY's power on count. Then when power on PHY to enable it after phy
> initialization where it is really needed, as PHY's power on count is not
> zero, again it would do nothing but directly return and leaves the PHY
> disabled. This change adds condition checks to phy power on calls which
> happen before phy initialization.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 4 +++-
>  drivers/scsi/ufs/ufs-qcom.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2b38db2..4e9d526 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -288,6 +288,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>                         __func__, ret);
>                 goto out;
>         }
> +       host->is_phy_init = true;
>
>         /* De-assert PHY reset and start serdes */
>         ufs_qcom_deassert_reset(hba);
> @@ -1147,7 +1148,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>                 return 0;
>
>         if (on && (status == POST_CHANGE)) {
> -               phy_power_on(host->generic_phy);
> +               if (host->is_phy_init)
> +                       phy_power_on(host->generic_phy);
>
>                 /* enable the device ref clock for HS mode*/
>                 if (ufshcd_is_hs_mode(&hba->pwr_info))
> diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
> index 295f4be..5747aa3 100644
> --- a/drivers/scsi/ufs/ufs-qcom.h
> +++ b/drivers/scsi/ufs/ufs-qcom.h
> @@ -242,6 +242,7 @@ struct ufs_qcom_host {
>         /* Bitmask for enabling debug prints */
>         u32 dbg_print_en;
>         struct ufs_qcom_testbus testbus;
> +       bool is_phy_init;
>  };
>
>  static inline u32
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Reviewed-by: Evan Green <evgreen@chromium.org>
