From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 0/3] Qualcomm UFS device reset support
Date: Wed, 28 Aug 2019 12:17:53 -0700
Message-ID: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This series adds a new ufs vops to allow platform specific methods for
resetting an attached UFS device, then implements this for the Qualcomm driver.
This reset seems to be necessary for the majority of Dragonboard845c devices.

Bean requested in v3 that a software fallback mechanism, using
UIC_CMD_DME_END_PT_RST. I have not been successful in validating that this
works for me, so I'm postponing this effort and hoping we can add it
incrementally at a later time.

Bjorn Andersson (3):
  scsi: ufs: Introduce vops for resetting device
  scsi: ufs-qcom: Implement device_reset vops
  arm64: dts: qcom: sdm845: Specify UFS device-reset GPIO

 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  2 ++
 drivers/scsi/ufs/ufs-qcom.c                   | 36 +++++++++++++++++++
 drivers/scsi/ufs/ufs-qcom.h                   |  4 +++
 drivers/scsi/ufs/ufshcd.c                     |  6 ++++
 drivers/scsi/ufs/ufshcd.h                     |  8 +++++
 7 files changed, 60 insertions(+)

-- 
2.18.0
