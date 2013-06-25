From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 3/4] pinctrl: remove slew-rate parameter from tz1090
Date: Tue, 25 Jun 2013 14:27:17 +0100
Message-ID: <51C99AB5.1080002@imgtec.com>
References: <201306251455.01540.heiko@sntech.de> <201306251456.36499.heiko@sntech.de> <51C99581.2010403@imgtec.com> <201306251521.55634.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251521.55634.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 25/06/13 14:21, Heiko St=C3=BCbner wrote:
> Am Dienstag, 25. Juni 2013, 15:05:05 schrieb James Hogan:
>> Hi Heiko,
>>
>> On 25/06/13 13:56, Heiko St=C3=BCbner wrote:
>>> As the binding for slew-rate is under discussion and seems to need
>>> more tought it will get removed for now, so it doesn't get an offic=
al
>>
>> s/tought/thought/
>> s/offical/official/
>>
>>> release.
>>>
>>> Therefore remove it again from the only current user, tz1090.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>
>> <snip>
>>
>>> diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c
>>> b/drivers/pinctrl/pinctrl-tz1090-pdc.c index 12e4808..d4f12cc 10064=
4
>>> --- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
>>> +++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
>>> @@ -809,11 +809,6 @@ static int tz1090_pdc_pinconf_group_reg(struct
>>> pinctrl_dev *pctldev,
>>>
>>>  		*width =3D 1;
>>>  		*map =3D tz1090_pdc_boolean_map;
>>>  		break;
>>>
>>> -	case PIN_CONFIG_SLEW_RATE:
>>> -		*shift =3D REG_GPIO_CONTROL2_PDC_SR_S;
>>> -		*width =3D 1;
>>> -		*map =3D tz1090_pdc_boolean_map;
>>> -		break;
>>>
>>>  	case PIN_CONFIG_DRIVE_STRENGTH:
>>>  		*shift =3D REG_GPIO_CONTROL2_PDC_DR_S;
>>>  		*width =3D 2;
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-tz1090.c
>>> b/drivers/pinctrl/pinctrl-tz1090.c index 02ff3a2..4edae08 100644
>>> --- a/drivers/pinctrl/pinctrl-tz1090.c
>>> +++ b/drivers/pinctrl/pinctrl-tz1090.c
>>> @@ -1834,11 +1834,6 @@ static int tz1090_pinconf_group_reg(struct
>>> pinctrl_dev *pctldev,
>>>
>>>  		*width =3D 1;
>>>  		*map =3D tz1090_boolean_map;
>>>  		break;
>>>
>>> -	case PIN_CONFIG_SLEW_RATE:
>>> -		*reg =3D REG_PINCTRL_SR;
>>> -		*width =3D 1;
>>> -		*map =3D tz1090_boolean_map;
>>> -		break;
>>>
>>>  	case PIN_CONFIG_DRIVE_STRENGTH:
>>>  		*reg =3D REG_PINCTRL_DR;
>>>  		*width =3D 2;
>>
>> I don't see the harm in keeping the handling of PIN_CONFIG_SLEW_RATE=
,
>> since PIN_CONFIG_SLEW_RATE is still present and you only seem to be
>> removing the device tree bindings (which is the only important bit f=
rom
>> the DT ABI point of view).
>=20
> I'm partial to this :-)
>=20
> My thoughts were that this code would never be reached when the parsi=
ng was=20
> removed and to not cause confusion to the driver when an acceptable b=
inding=20
> was found for slew-rate.
>=20
> But it of course also doesn't hurt to stay in.

Okay, fair enough.

Acked-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
