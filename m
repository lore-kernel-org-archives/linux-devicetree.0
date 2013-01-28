From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH RESEND 1/4] mfd: tps65090: add DT support for tps65090
Date: Mon, 28 Jan 2013 08:52:29 -0700
Message-ID: <51069EBD.7060104@wwwdotorg.org>
References: <1359277035-16854-1-git-send-email-ldewangan@nvidia.com> <1359277035-16854-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359277035-16854-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 01/27/2013 01:57 AM, Laxman Dewangan wrote:
> Add device tree support for the TI PMIC TPS65090.
> The device can be registered through platform or DT.
> 
> Add device tree binding document for this device.

> diff --git a/Documentation/devicetree/bindings/regulator/tps65090.txt b/Documentation/devicetree/bindings/regulator/tps65090.txt

> +Required properties:
> +- compatible: "ti,tps65090"
> +- reg: I2C slave address
> +- interrupts: the interrupt outputs of the controller
> +- regulators: A node that houses a sub-node for each regulator within the
> +  device. Each sub-node is identified using the node's name (or the deprecated
> +  regulator-compatible property if present), with valid values listed below.

It may not be worth mentioning deprecated stuff in a new binding doc.

> +  The content of each sub-node is defined by the standard binding for
> +  regulators; see regulator.txt.
> +  dcdc[1-3], fet[1-7] and ldo[1-2] respectively.
> +- vsys[1-3]-supply: The input supply for DCDC[1-3] respectively.
> +- infet[1-7]-supply: The input supply for FET[1-7] respectively.
> +- vsys_l[1-2]-supply: The input supply for LDO[1-2] respectively.

_ in a DT property name is unusual; perhaps use - instead?

> +Optional properties:
> +- ti,enable-ext-control: This is applicable for DCDC1, DCDC2 and DCDC3.
> +  If DCDCs are externally controlled then this property should be there.
> +- gpio: This is applicable for DCDC1, DCDC2 and DCDC3. If DCDCs are
> +  extrenally controlled and if it is from GPIO then gpio number should

s/extrenally/externally/

GPIO should always be capitalized it text.

"gpio" is a rather generic property name. "dcdc-gpios" or
"dcdc-ext-control-gpios" might be better?

> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c

> @@ -155,9 +188,22 @@ static int tps65090_i2c_probe(struct i2c_client *client,
>  	struct tps65090 *tps65090;
>  	int ret;
>  
> -	if (!pdata) {
> +	if (client->dev.of_node) {
> +		const struct of_device_id *match;
> +
> +		match = of_match_device(of_match_ptr(tps65090_of_match),
> +				&client->dev);
> +		if (!match) {
> +			dev_err(&client->dev, "No match device found\n");
> +			return -ENODEV;
> +		}

Is that useful; "match" doesn't seem to be used anywhere, and this
driver won't be instantiated through DT unless the driver/I2C core found
a matching entry in tps65090_of_match already.

> +	if (!pdata && client->dev.of_node)
> +		pdata = of_get_tps65090_platform_data(&client->dev);
> +	if (IS_ERR_OR_NULL(pdata)) {
>  		dev_err(&client->dev, "tps65090 requires platform data\n");
> -		return -EINVAL;
> +		return (pdata) ? PTR_ERR(pdata) : -EINVAL;
>  	}

Does the driver really /require/ pdata?
