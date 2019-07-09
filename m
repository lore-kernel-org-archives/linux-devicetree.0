From: Anson.Huang@nxp.com
Subject: [PATCH 1/3] opp: of: Support multiple suspend OPPs defined in DT
Date: Tue,  9 Jul 2019 15:10:54 +0800
Message-ID: <20190709071056.26361-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, leonard.crestez@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, angus@akkea.ca, andrew.smirnov@gmail.com, agx@sigxcpu.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

With property "opp-supported-hw" introduced, the OPP table
in DT could be a large OPP table and ONLY a subset of OPPs
are available, based on the version of the hardware running
on. That introduces restriction of using "opp-suspend"
property to define the suspend OPP, as we are NOT sure if the
OPP containing "opp-suspend" property is available for the
hardware running on, and the of opp core does NOT allow multiple
suspend OPPs defined in DT OPP table.

To eliminate this restrition, make of opp core allow multiple
suspend OPPs defined in DT, and pick the OPP with highest rate
and with "opp-suspend" property present to be suspend OPP, it
can speed up the suspend/resume process.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/opp/of.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index b313aca..7e8ec6c 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -617,9 +617,12 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
 	/* OPP to select on device suspend */
 	if (of_property_read_bool(np, "opp-suspend")) {
 		if (opp_table->suspend_opp) {
-			dev_warn(dev, "%s: Multiple suspend OPPs found (%lu %lu)\n",
-				 __func__, opp_table->suspend_opp->rate,
-				 new_opp->rate);
+			/* Pick the OPP with higher rate as suspend OPP */
+			if (new_opp->rate > opp_table->suspend_opp->rate) {
+				opp_table->suspend_opp->suspend = false;
+				new_opp->suspend = true;
+				opp_table->suspend_opp = new_opp;
+			}
 		} else {
 			new_opp->suspend = true;
 			opp_table->suspend_opp = new_opp;
-- 
2.7.4
