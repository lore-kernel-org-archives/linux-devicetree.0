From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] scsi: ufs-qcom: Implement device_reset vops
Date: Mon, 02 Sep 2019 14:38:51 +0100
Message-ID: <5d6d1b6c.1c69fb81.e1729.0655@mx.google.com>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org> <20190828191756.24312-3-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828191756.24312-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Andy Gross <agross@kernel.org>, Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2019 12:17:55 -0700, Bjorn Andersson wrote:
> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. Acquire the device-reset GPIO and use this
> to implement the device_reset vops, to allow resetting the attached
> memory.
> 
> Based on downstream support implemented by Subhash Jadavani
> <subhashj@codeaurora.org>.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Renamed device-reset-gpios to just reset-gpios.
> - Explicitly bail on !host->device_reset, to not rely on passing NULL to
>   gpiod_set_value_cansleep()
> 
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
>  drivers/scsi/ufs/ufs-qcom.c                   | 36 +++++++++++++++++++
>  drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
>  3 files changed, 42 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
