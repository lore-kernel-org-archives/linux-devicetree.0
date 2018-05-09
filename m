From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH v2 4/4] rtc: ds1307: add freq_test sysfs attribute to
 check tick on m41txx
Date: Wed, 9 May 2018 20:46:09 +0200
Message-ID: <de96728f-c5c6-0d2e-4814-21105c0683ed@micronovasrl.com>
References: <20180509182812.17646-1-giulio.benetti@micronovasrl.com>
 <20180509182812.17646-4-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509182812.17646-4-giulio.benetti@micronovasrl.com>
Content-Language: it
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sorry everybody,

Il 09/05/2018 20:28, Giulio Benetti ha scritto:
>   static int ds1307_probe(struct i2c_client *client,
>   			const struct i2c_device_id *id)
>   {
> @@ -1783,6 +1851,24 @@ static int ds1307_probe(struct i2c_client *client,
>   	if (err)
>   		return err;
>   
> +	/* Export sysfs entries */
> +	err = sysfs_create_group(&(&client->dev)->kobj, &rtc_calib_attr_group);
> +	if (err) {
> +		dev_err(&client->dev, "Failed to create sysfs group: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	err = devm_add_action_or_reset(&client->dev,
> +				       rtc_calib_remove_sysfs_group,
> +				       &client->dev);
> +	if (err) {
> +		dev_err(&client->dev,
> +			"Failed to add sysfs cleanup action: %d\n",
> +			err);
> +		return err;
> +	}
> +
>   	if (chip->nvram_size) {
>   		struct nvmem_config nvmem_cfg = {
>   			.name = "ds1307_nvram",
> 

Adding sysfs must be done only for mt41xx series.
I correct and submit V3 patchest.
Sorry again.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ¤ 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
