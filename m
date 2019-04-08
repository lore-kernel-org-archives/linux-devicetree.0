Return-Path: <SRS0=pQYc=SK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr150043.outbound.protection.outlook.com ([40.107.15.43]:6050
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfDHIE6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Apr 2019 04:04:58 -0400
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] power: supply: ltc3651-charger.c: Fix typo in device name
Date: Mon, 8 Apr 2019 08:04:47 +0000
Message-ID: <54ec5e8b-cbec-b2f6-8d76-d7db0d0a87c0@topic.nl>
References: <1553608635-29376-1-git-send-email-michael.hennerich@analog.com>
 <20190405143747.didydf5neea4iqcq@earth.universe>
 <BY1PR0301MB0901370B40482D4EBD6EE84F8E510@BY1PR0301MB0901.namprd03.prod.outlook.com>
 <20190405151145.3iplzv423u7pkq6j@earth.universe>
In-Reply-To: <20190405151145.3iplzv423u7pkq6j@earth.universe>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <9A63CBFD483F1F469C83A659E69D4B3D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Getz, Robin" <Robin.Getz@analog.com>
List-ID: <devicetree@vger.kernel.org>

On 05-04-19 17:11, Sebastian Reichel wrote:
> Hi,
>=20
> On Fri, Apr 05, 2019 at 02:58:24PM +0000, Hennerich, Michael wrote:
>>> -----Original Message-----
>>> From: Sebastian Reichel [mailto:sre@kernel.org]
>>> Sent: Freitag, 5. April 2019 16:38
>>> To: Hennerich, Michael <Michael.Hennerich@analog.com>
>>> Cc: mike.looijmans@topic.nl; robh+dt@kernel.org; linux-pm@vger.kernel.o=
rg; devicetree@vger.kernel.org; Getz, Robin
>>> <Robin.Getz@analog.com>
>>> Subject: Re: [PATCH] power: supply: ltc3651-charger.c: Fix typo in devi=
ce name
>>>
>>> Hi,
>>>
>>> On Tue, Mar 26, 2019 at 02:57:15PM +0100, michael.hennerich@analog.com =
wrote:
>>>> From: Michael Hennerich <michael.hennerich@analog.com>
>>>>
>>>> There never was a device called LTC3651, it always was just LT3651.
>>>> This circumstance makes it pretty difficult to identify what this
>>>> driver is meant to control. This patch is a minimal invasive attempt
>>>> to fix this issue without affecting existing systems.
>>>>
>>>>
>>>> Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
>>>> ---
>>>
>>> Please change subject to "power: supply: ltc3651-charger: Fix device na=
me"
>>
>> Sure
>>
>>> Also we probably should change the filenames and Kconfig name.
>>
>> If we go that far we can also fix the function prefixes as well.
>=20
> sounds good to me.
>=20
>> I'm a bit hesitant about the Kconfig name. It'll break existing kernel c=
onfigs
>> for no good reason!? Please let me know what you prefer.
>=20
> I suppose we can keep to the old Kconfig option, if this is being
> used already. Hopefully not many people search for their driver
> using raw Kconfig names :)

Well, if you don't change it now, it will never get fixed.

I'm actually in favor of completely fixing the name. It does mean that I'll=
=20
have to update a few devicetrees and configs, but in the long run, I think=
=20
it's the better choice.


>=20
> -- Sebastian
>=20
>>
>> Thanks for the review.
>>
>> -- Michael
>>
>>>
>>> -- Sebastian
>>>
>>>>   .../devicetree/bindings/power/supply/ltc3651-charger.txt         | 8=
 +++++---
>>>>   drivers/power/supply/Kconfig                                     | 6=
 +++---
>>>>   drivers/power/supply/ltc3651-charger.c                           | 9=
 +++------
>>>>   3 files changed, 11 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/supply/ltc3651-ch=
arger.txt
>>> b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.txt
>>>> index 71f2840..f012449 100644
>>>> --- a/Documentation/devicetree/bindings/power/supply/ltc3651-charger.t=
xt
>>>> +++ b/Documentation/devicetree/bindings/power/supply/ltc3651-charger.t=
xt
>>>> @@ -1,7 +1,9 @@
>>>> -ltc3651-charger
>>>> +Analog Devices LT3651 Charger Power Supply bindings: ltc3651-charger
>>>>
>>>>   Required properties:
>>>> - - compatible: "lltc,ltc3651-charger"
>>>> +- compatible: Should contain one of the following:
>>>> + * "lltc,ltc3651-charger",
>>>> + * "lltc,lt3651-charger"
>>>>    - lltc,acpr-gpios: Connect to ACPR output. See remark below.
>>>>
>>>>   Optional properties:
>>>> @@ -20,7 +22,7 @@ attributes to detect changes.
>>>>   Example:
>>>>
>>>>   	charger: battery-charger {
>>>> -		compatible =3D "lltc,ltc3651-charger";
>>>> +		compatible =3D "lltc,lt3651-charger";
>>>>   		lltc,acpr-gpios =3D <&gpio0 68 GPIO_ACTIVE_LOW>;
>>>>   		lltc,fault-gpios =3D <&gpio0 64 GPIO_ACTIVE_LOW>;
>>>>   		lltc,chrg-gpios =3D <&gpio0 63 GPIO_ACTIVE_LOW>;
>>>> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconf=
ig
>>>> index e901b9879..6816a86 100644
>>>> --- a/drivers/power/supply/Kconfig
>>>> +++ b/drivers/power/supply/Kconfig
>>>> @@ -476,11 +476,11 @@ config CHARGER_MANAGER
>>>>             with help of suspend_again support.
>>>>
>>>>   config CHARGER_LTC3651
>>>> -	tristate "LTC3651 charger"
>>>> +	tristate "Analog Devices LT3651 charger"
>>>>   	depends on GPIOLIB
>>>>   	help
>>>> -	  Say Y to include support for the LTC3651 battery charger which rep=
orts
>>>> -	  its status via GPIO lines.
>>>> +	  Say Y to include support for the Analog Devices (Linear Technology=
)
>>>> +	  LT3651 battery charger which reports its status via GPIO lines.
>>>>
>>>>   config CHARGER_MAX14577
>>>>   	tristate "Maxim MAX14577/77836 battery charger driver"
>>>> diff --git a/drivers/power/supply/ltc3651-charger.c b/drivers/power/su=
pply/ltc3651-charger.c
>>>> index eea63ff..07ed537 100644
>>>> --- a/drivers/power/supply/ltc3651-charger.c
>>>> +++ b/drivers/power/supply/ltc3651-charger.c
>>>> @@ -1,11 +1,7 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>>   /*
>>>> + *  Driver for Analog Devices (Linear Technology) LT3651 charger IC.
>>>>    *  Copyright (C) 2017, Topic Embedded Products
>>>> - *  Driver for LTC3651 charger IC.
>>>> - *
>>>> - *  This program is free software; you can redistribute it and/or mod=
ify it
>>>> - *  under  the terms of the GNU General  Public License as published =
by the
>>>> - *  Free Software Foundation;  either version 2 of the License, or (a=
t your
>>>> - *  option) any later version.
>>>>    */
>>>>
>>>>   #include <linux/device.h>
>>>> @@ -190,6 +186,7 @@ static int ltc3651_charger_probe(struct platform_d=
evice *pdev)
>>>>
>>>>   static const struct of_device_id ltc3651_charger_match[] =3D {
>>>>   	{ .compatible =3D "lltc,ltc3651-charger" },
>>>> +	{ .compatible =3D "lltc,lt3651-charger" },
>>>>   	{ }
>>>>   };
>>>>   MODULE_DEVICE_TABLE(of, ltc3651_charger_match);
>>>> --
>>>> 2.7.4
>>>>
