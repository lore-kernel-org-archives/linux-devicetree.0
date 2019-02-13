From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v4 1/8] dt-bindings: ufs: Add #reset-cells for Qualcomm controllers
Date: Wed, 13 Feb 2019 15:25:19 -0800
Message-ID: <20190213232526.26995-2-evgreen@chromium.org>
References: <20190213232526.26995-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213232526.26995-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Evan Green <evgreen@chromium.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, liwei <liwei213@huawei.com>, linux-kernel@vger.kernel.org, Subhash Jadavani <subhashj@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Enable Qualcomm UFS controllers to expose the PHY reset via a reset
controller.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index 8cf59452c675..e2460b666ae4 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -47,6 +47,8 @@ Optional properties:
 -lanes-per-direction	: number of lanes available per direction - either 1 or 2.
 			  Note that it is assume same number of lanes is used both
 			  directions at once. If not specified, default is 2 lanes per direction.
+- #reset-cells		: Must be <1> for Qualcomm UFS controllers that expose
+			  PHY reset from the UFS controller.
 - resets            : reset node register
 - reset-names       : describe reset node register, the "rst" corresponds to reset the whole UFS IP.
 
@@ -76,4 +78,5 @@ Example:
 		reset-names = "rst";
 		phys = <&ufsphy1>;
 		phy-names = "ufsphy";
+		#reset-cells = <1>;
 	};
-- 
2.20.1
