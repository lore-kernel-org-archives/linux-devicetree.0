From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm845: Specify UFS device-reset GPIO
Date: Wed, 28 Aug 2019 12:17:56 -0700
Message-ID: <20190828191756.24312-4-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Specify the UFS device-reset gpio for db845c and mtp, so that the
controller will issue a reset of the UFS device.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Renamed property
- Added property to db845c

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 71bd717a4251..f5a85caff1a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -497,6 +497,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <800000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2e78638eb73b..c57548b7b250 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -388,6 +388,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
 };
-- 
2.18.0
