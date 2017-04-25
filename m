From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH v4 07/10] mfd: axp20x: add
 axp20x-regulator cell for AXP803
Date: Tue, 25 Apr 2017 16:37:53 +0800
Message-ID: <D61CDE77-940B-4286-A70D-955DBCEB8215@aosc.io>
References: <20170424160103.9447-1-icenowy@aosc.io> <20170424160103.9447-8-icenowy@aosc.io> <20170425075717.l4x3qektdgt6kaiq@dell>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB4EV7TDQKGQEJT2PLCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170425075717.l4x3qektdgt6kaiq@dell>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.orgLee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2017=E5=B9=B44=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:=
57:17, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =E5=86=99=E5=88=B0:
>On Tue, 25 Apr 2017, Icenowy Zheng wrote:
>
>> As axp20x-regulator now supports AXP803, add a cell for it.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>> Changes in v4:
>> - Added a trailing comma for new cell, for easier further cell
>addition.
>> Changes in v3:
>> - Make the new cell one-liner.
>>=20
>>  drivers/mfd/axp20x.c                 | 3 ++-
>>  drivers/regulator/axp20x-regulator.c | 6 +++---
>
>These 2 changes are orthogonal, thus there is no reason to send them
>bundled into a single patch.  Doing so complicates things greatly.
>Please resubmit the two changes separately, so that they may be
>absorbed by our respective subsystems.

Yes. As Chen-Yu said, I wrongly squashed the regulator renaming patch here.=
..

It should be squashed into the regulator patch.

Sorry for it.

>
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 1dc6235778eb..917b6ddc4f15 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>> @@ -848,7 +848,8 @@ static struct mfd_cell axp803_cells[] =3D {
>>  		.name			=3D "axp20x-pek",
>>  		.num_resources		=3D ARRAY_SIZE(axp803_pek_resources),
>>  		.resources		=3D axp803_pek_resources,
>> -	}
>> +	},
>> +	{	.name			=3D "axp20x-regulator" },
>>  };
>> =20
>>  static struct mfd_cell axp806_cells[] =3D {
>> diff --git a/drivers/regulator/axp20x-regulator.c
>b/drivers/regulator/axp20x-regulator.c
>> index 9356ec8a9a1f..e2608fe770b9 100644
>> --- a/drivers/regulator/axp20x-regulator.c
>> +++ b/drivers/regulator/axp20x-regulator.c
>> @@ -311,13 +311,13 @@ static const struct regulator_desc
>axp803_regulators[] =3D {
>>  		 AXP803_FLDO1_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(2)),
>>  	AXP_DESC(AXP803, FLDO2, "fldo2", "fldoin", 700, 1450, 50,
>>  		 AXP803_FLDO2_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(3)),
>> -	AXP_DESC_IO(AXP803, LDO_IO0, "ldo_io0", "ips", 700, 3300, 100,
>> +	AXP_DESC_IO(AXP803, LDO_IO0, "ldo-io0", "ips", 700, 3300, 100,
>>  		    AXP22X_LDO_IO0_V_OUT, 0x1f, AXP20X_GPIO0_CTRL, 0x07,
>>  		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
>> -	AXP_DESC_IO(AXP803, LDO_IO1, "ldo_io1", "ips", 700, 3300, 100,
>> +	AXP_DESC_IO(AXP803, LDO_IO1, "ldo-io1", "ips", 700, 3300, 100,
>>  		    AXP22X_LDO_IO1_V_OUT, 0x1f, AXP20X_GPIO1_CTRL, 0x07,
>>  		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
>> -	AXP_DESC_FIXED(AXP803, RTC_LDO, "rtc_ldo", "ips", 3000),
>> +	AXP_DESC_FIXED(AXP803, RTC_LDO, "rtc-ldo", "ips", 3000),
>>  };
>> =20
>>  static const struct regulator_linear_range axp806_dcdca_ranges[] =3D {

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
