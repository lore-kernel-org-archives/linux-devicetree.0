Return-Path: <SRS0=ZccN=IC=gmail.com=mats.dev.list@kernel.org>
Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic port
 power and data config
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-6-git-send-email-jun.li@nxp.com>
 <c28a8352-e960-449b-e7c1-7965d340536e@gmail.com>
 <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <74e1c164-1652-75f4-409c-bd1c214bda4d@gmail.com>
Date: Tue, 15 May 2018 22:52:57 +0200
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB3917CE86B45CBC1B6F7F576B899C0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Jun Li <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, Peter Chen <peter.chen@nxp.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 05/14/2018 11:36 AM, Jun Li wrote:

> Hi
>> -----Original Message-----
>> From: Mats Karrman [mailto:mats.dev.list@gmail.com]
>> Sent: 2018=E5=B9=B45=E6=9C=8812=E6=97=A5 3:56
>> To: Jun Li <jun.li@nxp.com>; robh+dt@kernel.org; gregkh@linuxfoundatio=
n.org;
>> heikki.krogerus@linux.intel.com; linux@roeck-us.net
>> Cc: a.hajda@samsung.com; cw00.choi@samsung.com;
>> shufan_lee@richtek.com; Peter Chen <peter.chen@nxp.com>;
>> gsomlo@gmail.com; devicetree@vger.kernel.org; linux-usb@vger.kernel.or=
g;
>> dl-linux-imx <linux-imx@nxp.com>
>> Subject: Re: [PATCH v5 05/14] usb: typec: add API to get typec basic p=
ort power
>> and data config
>>
>> Hi Li Jun,
>>
>> On 2018-05-03 02:24, Li Jun wrote:
>>
>>> This patch adds 3 APIs to get the typec port power and data type, and=

>>> preferred power role by its name string.
>>>
>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>> ---
>>>   drivers/usb/typec/class.c | 52
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>>   include/linux/usb/typec.h |  3 +++
>>>   2 files changed, 55 insertions(+)
>>>
>>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>>> index 53df10d..5981e18 100644
>>> --- a/drivers/usb/typec/class.c
>>> +++ b/drivers/usb/typec/class.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/device.h>
>>>   #include <linux/module.h>
>>>   #include <linux/mutex.h>
>>> +#include <linux/property.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/usb/typec.h>
>>>   #include <linux/usb/typec_mux.h>
>>> @@ -802,6 +803,12 @@ static const char * const typec_port_types[] =3D=
 {
>>>   	[TYPEC_PORT_DRP] =3D "dual",
>>>   };
>>>
>>> +static const char * const typec_data_types[] =3D {
>>> +	[TYPEC_PORT_DFP] =3D "host",
>>> +	[TYPEC_PORT_UFP] =3D "device",
>>> +	[TYPEC_PORT_DRD] =3D "dual",
>>> +};
>>> +
>>>   static const char * const typec_port_types_drp[] =3D {
>>>   	[TYPEC_PORT_SRC] =3D "dual [source] sink",
>>>   	[TYPEC_PORT_SNK] =3D "dual source [sink]", @@ -1252,6 +1259,51
>> @@
>>> void typec_set_pwr_opmode(struct typec_port *port,
>>>   }
>>>   EXPORT_SYMBOL_GPL(typec_set_pwr_opmode);
>>>
>>> +/**
>>> + * typec_find_power_type - Get the typec port power type
>> Why is this function called typec_find_power_type() and not
>> typec_find_port_type()?
>> It's called port_type in sysfs, having different names just adds confu=
sion.
>> (Otherwise I agree power_type is a better name but...)
> We have "port type" before the power and data role separation,
> this API name's intention is to reflect the power cap, anyway I
> leave this to be decided by Heikki then.
>>> + * @name: port type string
>>> + *
>>> + * This routine is used to find the typec_port_type by its string na=
me.
>>> + *
>>> + * Returns typec_port_type if success, otherwise negative error code=
=2E
>>> + */
>>> +int typec_find_power_type(const char *name) {
>>> +	return match_string(typec_port_types, ARRAY_SIZE(typec_port_types),=

>>> +			    name);
>>> +}
>>> +EXPORT_SYMBOL_GPL(typec_find_power_type);
>>> +
>>> +/**
>>> + * typec_find_preferred_role - Find the typec drp port preferred
>>> +power role
>> Why typec_find_preferred_role()? Could be used for any power_role so w=
hy not
>> typec_find_power_role()?
> I am not sure if I catch your point of this comment.
> For preferred role(if support try.sink or try.src) the only allowed pow=
er roles are=20
> "sink"
> "source"
> But for power role, the allowed type are=20
> "sink"
> "source"
> "dual"

Uhm, typing too fast again, I am. A better name would be just typec_find_=
role().
What I mean is that the function could be used for any situation when
someone wants to map a string to a TYPEC_{SOURCE,SINK} constant so it
is unnecessary to limit its usage to just preferred role.
// Mats

> Thanks
> Li Jun
>> BR // Mats
>>
>>> + * @name: power role string
>>> + *
>>> + * This routine is used to find the typec_role by its string name of=

>>> + * preferred power role(Try.SRC or Try.SNK).
>>> + *
>>> + * Returns typec_role if success, otherwise negative error code.
>>> + */
>>> +int typec_find_preferred_role(const char *name) {
>>> +	return match_string(typec_roles, ARRAY_SIZE(typec_roles), name); }
>>> +EXPORT_SYMBOL_GPL(typec_find_preferred_role);
>>> +
>>> +/**
>>> + * typec_find_data_type - Get the typec port data capability
>>> + * @name: data type string
>>> + *
>>> + * This routine is used to find the typec_port_data by its string na=
me.
>>> + *
>>> + * Returns typec_port_data if success, otherwise negative error code=
=2E
>>> + */
>>> +int typec_find_data_type(const char *name) {
>>> +	return match_string(typec_data_types, ARRAY_SIZE(typec_data_types),=

>>> +			    name);
>>> +}
>>> +EXPORT_SYMBOL_GPL(typec_find_data_type);
>>> +
>>>   /* ------------------------------------------ */
>>>   /* API for Multiplexer/DeMultiplexer Switches */
>>>
>>> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
>>> index 672b39b..00c93e7 100644
>>> --- a/include/linux/usb/typec.h
>>> +++ b/include/linux/usb/typec.h
>>> @@ -267,4 +267,7 @@ int typec_set_orientation(struct typec_port *port=
,
>>>   			  enum typec_orientation orientation);
>>>   int typec_set_mode(struct typec_port *port, int mode);
>>>
>>> +int typec_find_power_type(const char *name); int
>>> +typec_find_preferred_role(const char *name); int
>>> +typec_find_data_type(const char *name);
>>>   #endif /* __LINUX_USB_TYPEC_H */
