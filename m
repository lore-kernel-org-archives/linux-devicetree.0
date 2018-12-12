From: <Andrei.Stefanescu@microchip.com>
Subject: Re: [RESEND PATCH v3 3/3] regulator: mcp16502: add regulator driver
 for MCP16502
Date: Wed, 12 Dec 2018 08:01:07 +0000
Message-ID: <6a35df06-1309-f069-9b22-8c2cc5cca56e@microchip.com>
References: <1544522876-15967-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181211164706.GL6686@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211164706.GL6686@sirena.org.uk>
Content-Language: en-US
Content-ID: <140B56071DCEC6418A084D1F57E0E1C3@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thank you for the review.

> SPDX headers need to be C++ comments - please make the entire comment
> block a C++ one so it looks more intentional.
I sent a new patch (v4) with the modified comment.
>> +#ifdef CONFIG_SUSPEND
>> +static int mcp16502_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client =3D to_i2c_client(dev);
>> +	struct mcp16502 *mcp =3D i2c_get_clientdata(client);
>> +
>> +	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_LPM);
>> +
>> +	return 0;
>> +}
> This puts the device into low power mode when the suspend function gets
> called but this might not be safe - devices using the regulator may not
> be suspended yet so could still need full regulation.  Normally a GPIO
> triggered transition like this would be being done by hardware as part
> of the process of suspending the SoC.  Is there some reason to do this
> manually?
There is a line from the MPU (SHDN) which goes low only when the MPU
turns off. That line is already connected to the PMIC and it differentiates
between suspend-to-mem and standby. To switch to low-power, the PMIC must
be controlled by the GPIO pin LPM.

The suspend sequence is:
- LPM pin goes high (PMIC enters Low-Power <-> Linux standby)
- SHDN goes low (if target suspend state is mem) and then PMIC enters=20
HIBERNATE


Best regards,
Andrei
