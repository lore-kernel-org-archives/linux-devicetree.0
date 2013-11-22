From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 4/5] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Fri, 22 Nov 2013 10:15:51 +0000
Message-ID: <20131122101551.GJ23067@lee--X1>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385109972-28059-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Nov 2013, Krzysztof Kozlowski wrote:

> MAX14577 chip is a multi-function device which includes MUIC,
> charger and voltage regulator. The driver is located in drivers/mfd.
>=20
> This patch adds regulator driver for MAX14577 chip. There are two
> regulators in this chip:
> 1. Safeout LDO with constant voltage output of 4.9V. It can be only
>    enabled or disabled.
> 2. Current regulator for the charger. It provides current from 90mA u=
p
>    to 950mA.
> Driver supports Device Tree.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/regulator/Kconfig    |    7 ++
>  drivers/regulator/Makefile   |    1 +
>  drivers/regulator/max14577.c |  272 ++++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/max14577.h |    1 -
>  4 files changed, 280 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/regulator/max14577.c

<snip>

> +#ifdef CONFIG_OF
> +static int max14577_regulator_dt_parse_pdata(struct platform_device =
*pdev,
> +					struct max14577_platform_data *pdata)
> +{
> +	struct max14577 *max14577 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct device_node *np;
> +	struct max14577_regulator_platform_data *reg_pdata;
> +	struct of_regulator_match rmatch;
> +	int i, ret;
> +
> +	np =3D of_get_child_by_name(max14577->dev->of_node, "regulators");
> +	if (!np)
> +		return -EINVAL;

No need to do this. If instead you use a compatible string and set
it's MFD cell's .of_compatible property, the MFD core will set
pdev->dev.of_node for you.

> +	reg_pdata =3D devm_kzalloc(&pdev->dev, sizeof(*reg_pdata) *
> +			     ARRAY_SIZE(supported_regulators), GFP_KERNEL);
> +	if (!reg_pdata)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supported_regulators); i++) {
> +		rmatch.name =3D supported_regulators[i].name;
> +		ret =3D of_regulator_match(&pdev->dev, np, &rmatch, 1);
> +		if (ret !=3D 1)
> +			continue;
> +		dev_dbg(&pdev->dev, "Found regulator %d/%s\n",
> +				supported_regulators[i].id,
> +				supported_regulators[i].name);
> +		reg_pdata[i].id =3D supported_regulators[i].id;
> +		reg_pdata[i].initdata =3D rmatch.init_data;
> +		reg_pdata[i].of_node =3D rmatch.of_node;
> +	}
> +
> +	pdata->regulators =3D reg_pdata;
> +
> +	return 0;
> +}
> +#else
> +static int max14577_regulator_dt_parse_pdata(struct platform_device =
*pdev,
> +					struct max14577_platform_data *pdata)
> +{
> +	return 0;
> +}
> +#endif

No need for this either. Just check for the device's of_node.

> +static int max14577_regulator_probe(struct platform_device *pdev)
> +{
> +	struct max14577 *max14577 =3D dev_get_drvdata(pdev->dev.parent);
> +	struct max14577_platform_data *pdata =3D dev_get_platdata(max14577-=
>dev);
> +	int i, size;
> +	struct regulator_config config =3D {};
> +	struct regulator_dev **regulators;
> +
> +	if (!pdata) {
> +		/* Parent must provide pdata */
> +		dev_err(&pdev->dev, "No MFD driver platform data found.\n");
> +		return -ENODEV;
> +	}
> +
> +	if (max14577->dev->of_node) {
> +		int ret =3D max14577_regulator_dt_parse_pdata(pdev, pdata);

This will overwrite pdata which is wrong.

pdata should always take precedence over DT.

<snip>

> +	for (i =3D 0; i < ARRAY_SIZE(supported_regulators); i++) {
> +		/*
> +		 * Index of supported_regulators[] is also the id and must
> +		 * match index of pdata->regulators[].
> +		 */
> +		config.init_data =3D pdata->regulators[i].initdata;
> +		config.of_node =3D pdata->regulators[i].of_node;

I still thing this is superfluous. Why don't you run though the nodes
here instead of doing it in MFD and passing this stuff through?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
