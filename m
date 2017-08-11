Return-Path: <SRS0=N70N=7N=rock-chips.com=wxt@kernel.org>
Subject: Re: [PATCH v2 2/5] thermal: rockchip: Support the RK3328 SOC in
 thermal driver
References: <1501833976-1100-1-git-send-email-rocky.hao@rock-chips.com>
 <1501833976-1100-3-git-send-email-rocky.hao@rock-chips.com>
From: Caesar Wang <wxt@rock-chips.com>
Message-ID: <04068b8a-e5e1-ab73-8b7a-4b4f7137e491@rock-chips.com>
Date: Fri, 11 Aug 2017 14:32:13 +0800
MIME-Version: 1.0
In-Reply-To: <1501833976-1100-3-git-send-email-rocky.hao@rock-chips.com>
Content-Type: multipart/alternative;
 boundary="------------F5EED96DE44B81665F5F602C"
Content-Language: en-US
To: Rocky Hao <rocky.hao@rock-chips.com>, rui.zhang@intel.com, edubezval@gmail.com, heiko@sntech.de, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: huangtao@rock-chips.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, cl@rock-chips.com, william.wu@rock-chips.com, jay.xu@rock-chips.com, xxx@rock-chips.com, linux-arm-kernel@lists.infradead.org, wxt@rock-chips.com
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------F5EED96DE44B81665F5F602C
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit

�� 2017��08��04�� 16:06, Rocky Hao д��:
> RK3328 SOC has one Temperature Sensor for CPU.
>
> Signed-off-by: Rocky Hao <rocky.hao@rock-chips.com>

Reviewed-by: Caesar Wang <wxt@rock-chips.com>

> ---
> Change in v2:
> - remove gerrit Change-Id
>
>   drivers/thermal/rockchip_thermal.c | 65 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 4c7796512453..206035139110 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -320,6 +320,44 @@ struct tsadc_table {
>   	{0, 125000},
>   };
>   
> +static const struct tsadc_table rk3328_code_table[] = {
> +	{0, -40000},
> +	{296, -40000},
> +	{304, -35000},
> +	{313, -30000},
> +	{331, -20000},
> +	{340, -15000},
> +	{349, -10000},
> +	{359, -5000},
> +	{368, 0},
> +	{378, 5000},
> +	{388, 10000},
> +	{398, 15000},
> +	{408, 20000},
> +	{418, 25000},
> +	{429, 30000},
> +	{440, 35000},
> +	{451, 40000},
> +	{462, 45000},
> +	{473, 50000},
> +	{485, 55000},
> +	{496, 60000},
> +	{508, 65000},
> +	{521, 70000},
> +	{533, 75000},
> +	{546, 80000},
> +	{559, 85000},
> +	{572, 90000},
> +	{586, 95000},
> +	{600, 100000},
> +	{614, 105000},
> +	{629, 110000},
> +	{644, 115000},
> +	{659, 120000},
> +	{675, 125000},
> +	{TSADCV2_DATA_MASK, 125000},
> +};
> +
>   static const struct tsadc_table rk3368_code_table[] = {
>   	{0, -40000},
>   	{106, -40000},
> @@ -790,6 +828,29 @@ static void rk_tsadcv2_tshut_mode(int chn, void __iomem *regs,
>   	},
>   };
>   
> +static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
> +	.chn_id[SENSOR_CPU] = 0, /* cpu sensor is channel 0 */
> +	.chn_num = 1, /* one channels for tsadc */
> +
> +	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
> +	.tshut_temp = 95000,
> +
> +	.initialize = rk_tsadcv2_initialize,
> +	.irq_ack = rk_tsadcv3_irq_ack,
> +	.control = rk_tsadcv3_control,
> +	.get_temp = rk_tsadcv2_get_temp,
> +	.set_alarm_temp = rk_tsadcv2_alarm_temp,
> +	.set_tshut_temp = rk_tsadcv2_tshut_temp,
> +	.set_tshut_mode = rk_tsadcv2_tshut_mode,
> +
> +	.table = {
> +		.id = rk3328_code_table,
> +		.length = ARRAY_SIZE(rk3328_code_table),
> +		.data_mask = TSADCV2_DATA_MASK,
> +		.mode = ADC_INCREMENT,
> +	},
> +};
> +
>   static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
>   	.chn_id[SENSOR_CPU] = 0, /* cpu sensor is channel 0 */
>   	.chn_id[SENSOR_GPU] = 1, /* gpu sensor is channel 1 */
> @@ -875,6 +936,10 @@ static void rk_tsadcv2_tshut_mode(int chn, void __iomem *regs,
>   		.data = (void *)&rk3288_tsadc_data,
>   	},
>   	{
> +		.compatible = "rockchip,rk3328-tsadc",
> +		.data = (void *)&rk3328_tsadc_data,
> +	},
> +	{
>   		.compatible = "rockchip,rk3366-tsadc",
>   		.data = (void *)&rk3366_tsadc_data,
>   	},


--------------F5EED96DE44B81665F5F602C
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">�� 2017��08��04�� 16:06, Rocky Hao д��:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1501833976-1100-3-git-send-email-rocky.hao@rock-chips.com">
      <pre wrap="">RK3328 SOC has one Temperature Sensor for CPU.

Signed-off-by: Rocky Hao <a class="moz-txt-link-rfc2396E" href="mailto:rocky.hao@rock-chips.com">&lt;rocky.hao@rock-chips.com&gt;</a></pre>
    </blockquote>
    <br>
    Reviewed-by: Caesar Wang <a class="moz-txt-link-rfc2396E"
      href="mailto:wxt@rock-chips.com">&lt;wxt@rock-chips.com&gt;</a><br>
    <br>
    <blockquote type="cite"
      cite="mid:1501833976-1100-3-git-send-email-rocky.hao@rock-chips.com">
      <pre wrap="">
---
Change in v2:
- remove gerrit Change-Id

 drivers/thermal/rockchip_thermal.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 4c7796512453..206035139110 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -320,6 +320,44 @@ struct tsadc_table {
 	{0, 125000},
 };
 
+static const struct tsadc_table rk3328_code_table[] = {
+	{0, -40000},
+	{296, -40000},
+	{304, -35000},
+	{313, -30000},
+	{331, -20000},
+	{340, -15000},
+	{349, -10000},
+	{359, -5000},
+	{368, 0},
+	{378, 5000},
+	{388, 10000},
+	{398, 15000},
+	{408, 20000},
+	{418, 25000},
+	{429, 30000},
+	{440, 35000},
+	{451, 40000},
+	{462, 45000},
+	{473, 50000},
+	{485, 55000},
+	{496, 60000},
+	{508, 65000},
+	{521, 70000},
+	{533, 75000},
+	{546, 80000},
+	{559, 85000},
+	{572, 90000},
+	{586, 95000},
+	{600, 100000},
+	{614, 105000},
+	{629, 110000},
+	{644, 115000},
+	{659, 120000},
+	{675, 125000},
+	{TSADCV2_DATA_MASK, 125000},
+};
+
 static const struct tsadc_table rk3368_code_table[] = {
 	{0, -40000},
 	{106, -40000},
@@ -790,6 +828,29 @@ static void rk_tsadcv2_tshut_mode(int chn, void __iomem *regs,
 	},
 };
 
+static const struct rockchip_tsadc_chip rk3328_tsadc_data = {
+	.chn_id[SENSOR_CPU] = 0, /* cpu sensor is channel 0 */
+	.chn_num = 1, /* one channels for tsadc */
+
+	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
+	.tshut_temp = 95000,
+
+	.initialize = rk_tsadcv2_initialize,
+	.irq_ack = rk_tsadcv3_irq_ack,
+	.control = rk_tsadcv3_control,
+	.get_temp = rk_tsadcv2_get_temp,
+	.set_alarm_temp = rk_tsadcv2_alarm_temp,
+	.set_tshut_temp = rk_tsadcv2_tshut_temp,
+	.set_tshut_mode = rk_tsadcv2_tshut_mode,
+
+	.table = {
+		.id = rk3328_code_table,
+		.length = ARRAY_SIZE(rk3328_code_table),
+		.data_mask = TSADCV2_DATA_MASK,
+		.mode = ADC_INCREMENT,
+	},
+};
+
 static const struct rockchip_tsadc_chip rk3366_tsadc_data = {
 	.chn_id[SENSOR_CPU] = 0, /* cpu sensor is channel 0 */
 	.chn_id[SENSOR_GPU] = 1, /* gpu sensor is channel 1 */
@@ -875,6 +936,10 @@ static void rk_tsadcv2_tshut_mode(int chn, void __iomem *regs,
 		.data = (void *)&amp;rk3288_tsadc_data,
 	},
 	{
+		.compatible = "rockchip,rk3328-tsadc",
+		.data = (void *)&amp;rk3328_tsadc_data,
+	},
+	{
 		.compatible = "rockchip,rk3366-tsadc",
 		.data = (void *)&amp;rk3366_tsadc_data,
 	},
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F5EED96DE44B81665F5F602C--
