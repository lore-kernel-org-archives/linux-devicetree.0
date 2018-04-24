From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 2/3] regulator: add support for SY8106A regulator
Date: Wed, 25 Apr 2018 07:41:35 +0800
Message-ID: <C0C1F042-221A-420F-A8C1-5FADCFC687F1@aosc.io>
References: <20180423144657.63264-1-icenowy@aosc.io> <20180423144657.63264-3-icenowy@aosc.io> <20180424170733.GD22073@sirena.org.uk>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBTMB77LAKGQEPJ4RDZQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180424170733.GD22073-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B44=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881:=
07:33, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Mon, Apr 23, 2018 at 10:46:56PM +0800, Icenowy Zheng wrote:
>
>> --- /dev/null
>> +++ b/drivers/regulator/sy8106a-regulator.c
>> @@ -0,0 +1,176 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * sy8106a-regulator.c - Regulator device driver for SY8106A
>
>Just make the entire thing a C++ comment so it looks consistent and
>joined up.

SPDX identifier is special -- it should be in a seperated
comment block.

>
>> +static int sy8106a_set_voltage_sel(struct regulator_dev *rdev,
>unsigned int sel)
>> +{
>> +	/* We use our set_voltage_sel in order to avoid unnecessary I2C
>> +	 * chatter, because the regulator_get_voltage_sel_regmap using
>> +	 * apply_bit would perform 4 unnecessary transfers instead of one,
>> +	 * increasing the chance of error.
>> +	 */
>> +	return regmap_write(rdev->regmap, rdev->desc->vsel_reg,
>> +			    sel | SY8106A_GO_BIT);
>
>Why would it do these extra transfers?  Is this just the fact that you
>didn't set up a register cache (though the r/m/w cycle should only add
>the read)?  We could put some logic in the core regmap code to detect
>that an _update_bits() call is going to write to the whole register,
>though it'd be even easier to just let this register be cached.
>
>Generally if we can usefully optimize things we should do it at the
>framework level.

Oh maybe the comment needs to be changed, but it's
needed to enable it to change voltage, as it might be
not enabled at boot.

>
>> +	if (reg & SY8106A_GO_BIT)
>> +		return reg & rdev->desc->vsel_mask;
>> +	else
>> +		return (chip->fixed_voltage - rdev->desc->min_uV) /
>> +		       rdev->desc->uV_step;
>
>You could use the standard get_voltage_sel() if you provide a mapping
>operation that set everything with _GO_BIT set to return the fixed
>voltage.  Though looking at this it seems that the fixed voltage will
>always be one that could be set via the register anyway so I'm
>wondering
>if the easiest thing here isn't to just have the driver turn off
>_GO_BIT

Do you mean "turn on" here?

>during probe() and not worry about the special case at runtime.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
