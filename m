From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] pinctrl: remove slew-rate parameter from tz1090
Date: Tue, 25 Jun 2013 15:22:33 +0200
Message-ID: <CACRpkdaVsKCNzQ9zAG5DXfDO2BFpcCzw5VbmARazOrXCW1kmeQ@mail.gmail.com>
References: <201306251455.01540.heiko@sntech.de>
	<201306251456.36499.heiko@sntech.de>
	<51C99581.2010403@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C99581.2010403@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2013 at 3:05 PM, James Hogan <james.hogan@imgtec.com> w=
rote:
> Hi Heiko,
>
> On 25/06/13 13:56, Heiko St=FCbner wrote:
>> As the binding for slew-rate is under discussion and seems to need
>> more tought it will get removed for now, so it doesn't get an offica=
l
>
> s/tought/thought/
> s/offical/official/
>
>> release.
>>
>> Therefore remove it again from the only current user, tz1090.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> ---
>
> <snip>
>
>> diff --git a/drivers/pinctrl/pinctrl-tz1090-pdc.c b/drivers/pinctrl/=
pinctrl-tz1090-pdc.c
>> index 12e4808..d4f12cc 100644
>> --- a/drivers/pinctrl/pinctrl-tz1090-pdc.c
>> +++ b/drivers/pinctrl/pinctrl-tz1090-pdc.c
>> @@ -809,11 +809,6 @@ static int tz1090_pdc_pinconf_group_reg(struct =
pinctrl_dev *pctldev,
>>               *width =3D 1;
>>               *map =3D tz1090_pdc_boolean_map;
>>               break;
>> -     case PIN_CONFIG_SLEW_RATE:
>> -             *shift =3D REG_GPIO_CONTROL2_PDC_SR_S;
>> -             *width =3D 1;
>> -             *map =3D tz1090_pdc_boolean_map;
>> -             break;
>>       case PIN_CONFIG_DRIVE_STRENGTH:
>>               *shift =3D REG_GPIO_CONTROL2_PDC_DR_S;
>>               *width =3D 2;
>> diff --git a/drivers/pinctrl/pinctrl-tz1090.c b/drivers/pinctrl/pinc=
trl-tz1090.c
>> index 02ff3a2..4edae08 100644
>> --- a/drivers/pinctrl/pinctrl-tz1090.c
>> +++ b/drivers/pinctrl/pinctrl-tz1090.c
>> @@ -1834,11 +1834,6 @@ static int tz1090_pinconf_group_reg(struct pi=
nctrl_dev *pctldev,
>>               *width =3D 1;
>>               *map =3D tz1090_boolean_map;
>>               break;
>> -     case PIN_CONFIG_SLEW_RATE:
>> -             *reg =3D REG_PINCTRL_SR;
>> -             *width =3D 1;
>> -             *map =3D tz1090_boolean_map;
>> -             break;
>>       case PIN_CONFIG_DRIVE_STRENGTH:
>>               *reg =3D REG_PINCTRL_DR;
>>               *width =3D 2;
>>
>
> I don't see the harm in keeping the handling of PIN_CONFIG_SLEW_RATE,
> since PIN_CONFIG_SLEW_RATE is still present and you only seem to be
> removing the device tree bindings (which is the only important bit fr=
om
> the DT ABI point of view).

I would actually like to be pretty strict about the kernel-internal mea=
ning of
these parameters as well.

Can't we just try to come up with a patch that nails down the meaning o=
f
slew rate in some meaningful manner then?

So according to:
http://en.wikipedia.org/wiki/Slew_rate
a proper expression for slew rate would be dV/dt i.e.
something like microvolts per microsecond (which then just
becomes volts/second).

What we need to figure out is what range will be applicable within
reasonable doubt for current scenarios and the next few years.

What are your datasheets specifying here, and what would be
a proper measure?

Yours,
Linus Walleij
