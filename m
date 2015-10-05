From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] extcon: gpio: Add the support for Device tree bindings
Date: Mon, 05 Oct 2015 19:39:31 +0900
Message-ID: <56125363.4060203@samsung.com>
References: <194162595.571031444032234245.JavaMail.weblogic@epmlwas07a>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <194162595.571031444032234245.JavaMail.weblogic@epmlwas07a>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 10=EC=9B=94 05=EC=9D=BC 17:03, MyungJoo Ham wrote:
>>  =20
>>  This patch adds the support for Device tree bindings of extcon-gpio=
 driver.
>> The extcon-gpio device tree node must include the both 'extcon-id' a=
nd
>> 'extcon-gpio' property.
>>
> []
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>=20
>=20
> Except for some beautification issues described below,
>=20
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>=20
>> ---
>> This patch is based on following patch[1].
>> [1] https://lkml.org/lkml/2015/10/3/304
>>
>> Changes from v1:
>> - Create the include/dt-bindings/extcon/extcon.h including the ident=
ification
>>   of external connector. These definitions are used in dts file.
>> - Fix error if CONFIG_OF is disabled.
>>
>>  .../devicetree/bindings/extcon/extcon-gpio.txt     |  38 +++++++
>>  drivers/extcon/extcon-gpio.c                       | 110 ++++++++++=
++++++-----
>>  include/dt-bindings/extcon/extcon.h                |  44 +++++++++
>>  include/linux/extcon/extcon-gpio.h                 |   6 +-
>>  4 files changed, 173 insertions(+), 25 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-=
gpio.txt
>>  create mode 100644 include/dt-bindings/extcon/extcon.h
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.tx=
t b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
>> new file mode 100644
>> index 000000000000..70c36f729963
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> []
>> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gp=
io.c
>> index 279ff8f6637d..7f3e24aae0c4 100644
>> --- a/drivers/extcon/extcon-gpio.c
>> +++ b/drivers/extcon/extcon-gpio.c
>> @@ -1,8 +1,8 @@
>>  /*
>>   * extcon_gpio.c - Single-state GPIO extcon driver based on extcon =
class
>>   *
>> - * Copyright (C) 2008 Google, Inc.
>> - * Author: Mike Lockwood <lockwood@android.com>
>> + * Copyright (C) 2015 Chanwoo Choi <cw00.choi@samsung.com>, Samsung=
 Electronics
>> + * Copyright (C) 2008 Mike Lockwood <lockwood@android.com>, Google,=
 Inc.
>>   *
>>   * Modified by MyungJoo Ham <myungjoo.ham@samsung.com> to support e=
xtcon
>>   * (originally switch class is supported)
>=20
> Let's make it in chronological order.
> (may need to "beautify the last two lines as well)
>=20
> I.e., 2008-->2012-->2015 or 2015-->2012-->2008.
> Not 2015-->2008-->2012

OK. I'll modify it.

>=20
>=20
>> @@ -26,12 +26,14 @@
> []
>> diff --git a/include/dt-bindings/extcon/extcon.h b/include/dt-bindin=
gs/extcon/extcon.h
>> new file mode 100644
>> index 000000000000..14c7f36b2206
>> --- /dev/null
>> +++ b/include/dt-bindings/extcon/extcon.h
> []
>> diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extc=
on/extcon-gpio.h
>> index 7cacafb78b09..bcc6d7f7116a 100644
>> --- a/include/linux/extcon/extcon-gpio.h
>> +++ b/include/linux/extcon/extcon-gpio.h
> []
>> @@ -38,7 +38,7 @@ struct gpio_extcon_pdata {
>>  	unsigned int extcon_id;
>>  	unsigned gpio;
>>  	bool gpio_active_low;
>> -	unsigned long debounce;
>> +	unsigned int debounce;
>=20
> What about u32, making it more clear?
> ( > +	device_property_read_u32(dev, "debounce-ms", &pdata->debounce);=
 )

OK.

Thanks,
Chanwoo Choi
