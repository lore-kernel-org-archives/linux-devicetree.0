From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v4 2/8] dt-bindings: phy-qcom-qmp: Add UFS PHY reset
Date: Wed, 13 Feb 2019 15:25:20 -0800
Message-ID: <20190213232526.26995-3-evgreen@chromium.org>
References: <20190213232526.26995-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213232526.26995-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Evan Green <evgreen@chromium.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a required reset to the SDM845 UFS phy to express the PHY reset
bit inside the UFS controller register space. Before this change, this
reset was not expressed in the DT, and the driver utilized two different
callbacks (phy_init and phy_poweron) to implement a two-phase
initialization procedure that involved deasserting this reset between
init and poweron. This abused the two callbacks and diluted their
purpose.

That scheme does not work as regulators cannot be turned off in
phy_poweroff because they were turned on in init, rather than poweron.
The net result is that regulators are left on in suspend that shouldn't
be.

This new scheme gives the UFS reset to the PHY, so that it can fully
initialize itself in a single callback. We can then turn regulators on
during poweron and off during poweroff.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
I realize I'm not supposed to add a required property after the fact,
but given that the UFS DT nodes that would use this binding are not
yet upstream (and this would be the first), I was hoping to squeak by.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 5d181fc3cc18..4a78ba8b85bc 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -59,7 +59,8 @@ Required properties:
 	   one for each entry in reset-names.
  - reset-names: "phy" for reset of phy block,
 		"common" for phy common block reset,
-		"cfg" for phy's ahb cfg block reset.
+		"cfg" for phy's ahb cfg block reset,
+		"ufsphy" for the PHY reset in the UFS controller.
 
 		For "qcom,ipq8074-qmp-pcie-phy" must contain:
 			"phy", "common".
@@ -74,7 +75,8 @@ Required properties:
 			"phy", "common".
 		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
 			"phy", "common".
-		For "qcom,sdm845-qmp-ufs-phy": no resets are listed.
+		For "qcom,sdm845-qmp-ufs-phy": must contain:
+			"ufsphy".
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
-- 
2.20.1
