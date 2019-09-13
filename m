From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 00/15] arm64: dts: imx8: architecture improvement and
 adding imx8qm support
Date: Fri, 13 Sep 2019 16:43:38 +0000
Message-ID: <AM0PR04MB42117BD6A60E4FEA1456954080B30@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1568302252-28066-1-git-send-email-aisheng.dong@nxp.com>
 <20190913121608.GD16292@optiplex>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190913121608.GD16292@optiplex>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oliver Graute <oliver.graute@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Oliver Graute <oliver.graute@gmail.com>
> Sent: Friday, September 13, 2019 8:16 PM
> 
> On 12/09/19, Dong Aisheng wrote:
> > IMX SCU based platforms (e.g. MX8QM/MX8QXP) are comprised of a
> number
> > of SS (Subsystems), those SS may be shared between different SoCs
> > while most of them can be reused like Devices Resources, Clocks, Power
> domains and etc.
> >
> > This patch series aims to improve the MX8 architecture to comply with
> > the HW design to save a lot of duplicated codes and benefits us a
> > better maintainability and scalability in the future.
> >
> > This patch series depends on another clk new binding series:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
> >
> hwork.kernel.org%2Fcover%2F11046287%2F&amp;data=02%7C01%7Caishen
> g.dong
> > %40nxp.com%7C2dffe4b2a0734c5a031408d738447876%7C686ea1d3bc2b
> 4c6fa92cd9
> >
> 9c5c301635%7C0%7C1%7C637039739035971290&amp;sdata=JsAy8vUkkCp
> n5HYh79oC
> > vekH3SJAICg7VQnLMP01O3c%3D&amp;reserved=0
> 
> Thx for your update of this patch series. I'am running into the issue that my
> linux next-20190904 unfortunately is not booting with it on my imx8QM
> board. Kernel is just stuck during boot see below.
> 
> I applied your v5 of your clock binding patches series and applied this series in
> v3. Your former two patch series worked well with next-20190716.
> 
> The last messages from the kernel are:
> 
> [    1.019208] imx-scu scu: mbox_request_channel_byname() could not
> locate channel named "gip3"
> [    1.027316] imx-scu scu: failed to request mbox chan gip3, ret -22
> [    1.033480] imx-scu scu: failed to enable general irq channel: -22
> [    1.039646] imx-scu scu: NXP i.MX SCU Initialized
> [    1.047414] a35_clk: failed to get clock rate -22
> [    1.058682]  lcd0-pwm0: failed to power up resource 188 ret -22
> [    1.064314] imx-scu-clk: probe of pwm_clk failed with error -22
> [    1.070538]  lcd0: failed to power up resource 187 ret -22
> [    1.075690] imx-scu-clk: probe of lcd_clk failed with error -22
> [    1.085965] mipi_csi0_core_clk: failed to attached the power domain -2
> [    1.092359] mipi_csi0_esc_clk: failed to attached the power domain -2
> [    1.098777] mipi_csi0_i2c0_clk: failed to attached the power domain -2
> [    1.105278] mipi_csi0_pwm0_clk: failed to attached the power domain -2
> [    1.115744] imx8qm-pinctrl scu:pinctrl: initialized IMX pinctrl driver
> [    1.123923] gpio-mxc 5d080000.gpio: IRQ index 1 not found
> [    1.130276] gpio-mxc 5d090000.gpio: IRQ index 1 not found
> 
> I see similar messages also with your older working patches, only the last two
> lines are new errors.
> 

Those warnings are because we are still missing some domains added into the
pd driver support, it does not block the booting.

But I did miss to send another power domain patch to avoid gate of console domain
which may result in the console hang.

Please try below patch:
>From 4685f604938b2a8d91d9b14081c15cb554c5711f Mon Sep 17 00:00:00 2001
From: Dong Aisheng <aisheng.dong@nxp.com>
Date: Sun, 7 Jul 2019 19:37:33 +0800
Subject: [PATCH 1/1] firmware: imx: scu-pd: do not power off console domain

Do not power off console domain in runtime pm.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/firmware/imx/scu-pd.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
index b556612..770e368 100644
--- a/drivers/firmware/imx/scu-pd.c
+++ b/drivers/firmware/imx/scu-pd.c
@@ -85,6 +85,8 @@ struct imx_sc_pd_soc {
 	u8 num_ranges;
 };
 
+int imx_con_rsrc;
+
 static const struct imx_sc_pd_range imx8qxp_scu_pd_ranges[] = {
 	/* LSIO SS */
 	{ "pwm", IMX_SC_R_PWM_0, 8, true, 0 },
@@ -173,6 +175,23 @@ to_imx_sc_pd(struct generic_pm_domain *genpd)
 	return container_of(genpd, struct imx_sc_pm_domain, pd);
 }
 
+static void imx_sc_pd_get_console_rsrc(void)
+{
+	struct of_phandle_args specs;
+	int ret;
+
+	if (!of_stdout)
+		return;
+
+	ret = of_parse_phandle_with_args(of_stdout, "power-domains",
+					 "#power-domain-cells",
+					 0, &specs);
+	if (ret)
+		return;
+
+	imx_con_rsrc = specs.args[0];
+}
+
 static int imx_sc_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct imx_sc_msg_req_set_resource_power_mode msg;
@@ -233,6 +252,7 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
 		      const struct imx_sc_pd_range *pd_ranges)
 {
 	struct imx_sc_pm_domain *sc_pd;
+	bool is_off = true;
 	int ret;
 
 	sc_pd = devm_kzalloc(dev, sizeof(*sc_pd), GFP_KERNEL);
@@ -251,6 +271,10 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
 			 "%s", pd_ranges->name);
 
 	sc_pd->pd.name = sc_pd->name;
+	if (imx_con_rsrc == sc_pd->rsrc) {
+		sc_pd->pd.flags = GENPD_FLAG_RPM_ALWAYS_ON;
+		is_off = false;
+	}
 
 	if (sc_pd->rsrc >= IMX_SC_R_LAST) {
 		dev_warn(dev, "invalid pd %s rsrc id %d found",
@@ -260,7 +284,7 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
 		return NULL;
 	}
 
-	ret = pm_genpd_init(&sc_pd->pd, NULL, true);
+	ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
 	if (ret) {
 		dev_warn(dev, "failed to init pd %s rsrc id %d",
 			 sc_pd->name, sc_pd->rsrc);
@@ -326,6 +350,8 @@ static int imx_sc_pd_probe(struct platform_device *pdev)
 	if (!pd_soc)
 		return -ENODEV;
 
+	imx_sc_pd_get_console_rsrc();
+
 	return imx_scu_init_pm_domains(&pdev->dev, pd_soc);
 }
 
-- 
2.7.4


Regards
Aisheng

> Best regards,
> 
> Oliver
