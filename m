From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 3/3] regulator: bd718x7: Support SNVS low power state
Date: Thu, 14 Feb 2019 09:53:04 +0200
Message-ID: <20190214075304.GE12247@localhost.localdomain>
References: <cover.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
 <f8955e8d9a1ae10e369f24e02fc80a7f9ddc6f68.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f8955e8d9a1ae10e369f24e02fc80a7f9ddc6f68.1550050645.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mazziesaccount@gmail.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com, Robin Gong <yibin.gong@nxp.com>, Elven Wang <elven.wang@nxp.com>, Anson Huang <anson.huang@nxp.com>, angus.ainslie@puri.sm
List-Id: devicetree@vger.kernel.org

Hello peeps,

A bug found from patch.

On Wed, Feb 13, 2019 at 11:50:49AM +0200, Matti Vaittinen wrote:
> read ROHM BD71837 / BD71847 specific device tree bindings for
> controlling the PMIC shutdown/reset states and voltages for
> different HW states. The PMIC was designed to be used with NXP
> i.MX8 SoC and it supports SNVS low power state which seems to
> be typical for NXP i.MX SoCs. However, when SNVS is used we must
> not allow SW to control enabling/disabling those regulators which
> are crucial for system to boot as there is a HW limitation which
> causes SW controlled regulators to be kept shut down after SNVS
> reset.
> 
> Allow setting the SNVS to be used as reset target state and allow
> marking those regulators which are critical for boot.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> --- a/drivers/regulator/bd718x7-regulator.c
> +++ b/drivers/regulator/bd718x7-regulator.c
> @@ -685,6 +817,7 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
>  			.enable_reg = BD718XX_REG_BUCK2_CTRL,
>  			.enable_mask = BD718XX_BUCK_EN,
>  			.owner = THIS_MODULE,
> +			.of_parse_cb = buck1_set_hw_dvs_levels,
This should be 
+			.of_parse_cb = buck2_set_hw_dvs_levels,

Thanks to Angus for all the testing! I'll send v3 soonish.

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes.  Just then, he vanished ~~~
