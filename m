From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 015/123] arm64: dts: sdm845-mtp: Reserve reserved gpios
Date: Wed,  5 Dec 2018 04:34:07 -0500
Message-ID: <20181205093555.5386-15-sashal@kernel.org>
References: <20181205093555.5386-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205093555.5386-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

[ Upstream commit 5f8d3ab136d0ccb59c4d628d8f85e0d8f2761d07 ]

With the introduction of commit 3edfb7bd76bd ("gpiolib: Show correct
direction from the beginning") the gpiolib will attempt to read the
direction of all pins, which triggers a read from protected register
regions.

The pins 0 through 3 and 81 through 84 are protected, so mark these as
reserved.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Gross <andy.gross@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 6d651f314193..6921f8dc5ebb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -31,6 +31,10 @@
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+};
+
 &uart9 {
 	status = "okay";
 };
-- 
2.17.1
