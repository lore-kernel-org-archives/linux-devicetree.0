From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.16 243/272] dt-bindings: display: msm/dsi: Fix the PHY regulator supply props
Date: Mon, 28 May 2018 12:04:36 +0200
Message-ID: <20180528100300.706127633@linuxfoundation.org>
References: <20180528100240.256525891@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180528100240.256525891@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Sasha Levin <alexander.levin@microsoft.com>
List-Id: devicetree@vger.kernel.org

4.16-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Archit Taneja <architt@codeaurora.org>

[ Upstream commit 8c4905fd4939c59e0f7993ba34883e328eef4b59 ]

The PHY regulator supply names vary across different PHY versions.
Mention explicitly which PHYs require which supplies.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt |    4 ++++
 1 file changed, 4 insertions(+)

--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -102,7 +102,11 @@ Required properties:
 - clocks: Phandles to device clocks. See [1] for details on clock bindings.
 - clock-names: the following clocks are required:
   * "iface"
+  For 28nm HPM/LP, 28nm 8960 PHYs:
 - vddio-supply: phandle to vdd-io regulator device node
+  For 20nm PHY:
+- vddio-supply: phandle to vdd-io regulator device node
+- vcca-supply: phandle to vcca regulator device node
 
 Optional properties:
 - qcom,dsi-phy-regulator-ldo-mode: Boolean value indicating if the LDO mode PHY
