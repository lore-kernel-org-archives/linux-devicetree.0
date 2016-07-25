From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: RE: [RFC] regulator: da9052/53: da9052-i2c.txt binding document
 changes
Date: Mon, 25 Jul 2016 11:31:27 +0000
Message-ID: <6ED8E3B22081A4459DAC7699F3695FB70173DB39F6@NB-EX-MBX02.diasemi.com>
References: <6ED8E3B22081A4459DAC7699F3695FB70173DAC199@SW-EX-MBX02.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6ED8E3B22081A4459DAC7699F3695FB70173DAC199@SW-EX-MBX02.diasemi.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: DEVICTREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, "Ying-Chun Liu (PaulLiu" <paul.liu@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Shawn Guo <shawn.guo@linaro.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 22 July 2016 11:36, Steve Twiss wrote:

> The binding file for DA9052/53 exists in the kernel and was originally
> submitted by Ying-Chun Liu from Linaro way back in 2012.
[...]
> > git show 58d114b
 [...]
> regulator names are added to the binding document but not used in the driver,
> also they are named incorrectly compared to the datasheets and Linux driver,
> and are misleading and confusing.
> 
> +Sub-nodes:
> +- regulators : Contain the regulator nodes. The DA9052/53 regulators are
> +  bound using their names as listed below:
> +
> +    buck0     : regulator BUCK0
> +    buck1     : regulator BUCK1
> +    buck2     : regulator BUCK2
> +    buck3     : regulator BUCK3
> +    ldo4      : regulator LDO4
> +    ldo5      : regulator LDO5
> +    ldo6      : regulator LDO6
> +    ldo7      : regulator LDO7
> +    ldo8      : regulator LDO8
> +    ldo9      : regulator LDO9
> +    ldo10     : regulator LDO10
> +    ldo11     : regulator LDO11
> +    ldo12     : regulator LDO12
> +    ldo13     : regulator LDO13

Never mind, I guess this is solved now.

There are already several device tree files using a naming scheme different to that found
in the binding text document. Since those have been used for real already, I will just follow
those existing DT file naming conventions instead.

./arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
./arch/arm/boot/dts/imx53-qsb.dts

Those board files files use the naming convention:
{ buck1, buck2, buck3, buck4 }
{ ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }

So, instead of the naming convention used in the existing binding text file (listed above)
I will send a patch to update that file to use with the existing usage already found in the
kernel board files.

Regards,
Steve
