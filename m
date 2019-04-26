From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-mtp: Make USB1 peripheral
Date: Fri, 26 Apr 2019 12:10:25 -0700
Message-ID: <20190426191025.16131-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The MTP is a "mobile reference device", as such the default operation is
to use fastboot to boot/flash software onto it and the common case is
thereby that we boot with a USB cable connected downstream from a PC or
a hub.  And without support for the PMI8998 charger block VBUS will not
be driven by the device.

Switch to peripheral until we can enable OTG.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 02b8357c8ce8..2e78638eb73b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -404,8 +404,8 @@
 };
 
 &usb_1_dwc3 {
-	/* Until we have Type C hooked up we'll force this as host. */
-	dr_mode = "host";
+	/* Until we have Type C hooked up we'll force this as peripheral. */
+	dr_mode = "peripheral";
 };
 
 &usb_1_hsphy {
-- 
2.18.0
