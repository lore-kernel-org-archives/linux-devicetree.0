Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 4/4] of: dynamic: Handle special properties changes
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140729055729.2DCBDC40C93@trevor.secretlab.ca>
Date: Tue, 29 Jul 2014 09:28:25 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4E20FCC-BE25-457E-9B5F-2284EEC3B13B@konsulko.com>
References: <1406578009-30154-1-git-send-email-pantelis.antoniou@konsulko.com> <1406578009-30154-5-git-send-email-pantelis.antoniou@konsulko.com> <20140729055729.2DCBDC40C93@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,
On Jul 29, 2014, at 8:57 AM, Grant Likely wrote:

> On Mon, 28 Jul 2014 23:06:49 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> Some node properties are 'special', that is fields in the node
>> are pointing at it. These are "name", "device_type", and
>> the phandles ("phandle", "linux,phandle" & "ibm,handle").
>>=20
>> Instead of trying to handle them at node attachment, handle
>> them when the property changes.
>=20
> Why?
>=20

Because that's the only way for those properties to be correct.

Take for instance the case where one attaches a subtree to a node
of the live tree.

The sequence will be:

attach_node
add_property
add_property
....

At the moment of attachment the special properties are unknown.

You could argue about attaching the node after the properties
attachment, but that's makes the sequence of attachment unnatural,
and imposes an arbitrary limitation to the users of that API.

On top of that if you update one of those special properties while
the node is attached you are SOL with the check being on node attach.

Performing the check when the actual properties are added is more
natural IMO, and is guaranteed to work under all conditions.

Regards

-- Pantelis

>>=20
>> Note that name properties are neither removable or updatable.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/base.c    | 26 ++++++++++++++++++++++++++
>> drivers/of/dynamic.c | 16 ++++------------
>> 2 files changed, 30 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 108d1f7..d5324a7 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1645,6 +1645,27 @@ int of_count_phandle_with_args(const struct =
device_node *np, const char *list_na
>> }
>> EXPORT_SYMBOL(of_count_phandle_with_args);
>>=20
>> +/* handle special properties actions */
>> +static void __of_handle_special_property(struct device_node *np,
>> +		struct property *prop, unsigned long action)
>> +{
>> +	int remove =3D action =3D=3D OF_RECONFIG_REMOVE_PROPERTY;
>> +
>> +	if (!of_prop_cmp(prop->name, "name")) {
>> +		/* name properties are non-modifiable */
>> +		if (action !=3D OF_RECONFIG_ADD_PROPERTY)
>> +			return;
>> +		np->name =3D prop->value;
>> +	} else if (!of_prop_cmp(prop->name, "device_type"))
>> +		np->type =3D !remove ? prop->value : "<NULL>";
>> +	else if (!of_prop_cmp(prop->name, "phandle") ||
>> +		!of_prop_cmp(prop->name, "linux,phandle") ||
>> +		(IS_ENABLED(PPC_PSERIES) &&
>> +			!of_prop_cmp(prop->name, "ibm,handle")))
>> +		np->phandle =3D !remove && prop->length >=3D 4 ?
>> +			be32_to_cpup(prop->value) : 0;
>> +}
>> +
>> /**
>>  * __of_add_property - Add a property to a node without lock =
operations
>>  */
>> @@ -1663,6 +1684,7 @@ int __of_add_property(struct device_node *np, =
struct property *prop)
>> 	}
>> 	*next =3D prop;
>>=20
>> +	__of_handle_special_property(np, prop, =
OF_RECONFIG_ADD_PROPERTY);
>> 	return 0;
>> }
>>=20
>> @@ -1708,6 +1730,8 @@ int __of_remove_property(struct device_node =
*np, struct property *prop)
>> 	prop->next =3D np->deadprops;
>> 	np->deadprops =3D prop;
>>=20
>> +	__of_handle_special_property(np, prop, =
OF_RECONFIG_REMOVE_PROPERTY);
>> +
>> 	return 0;
>> }
>>=20
>> @@ -1772,6 +1796,8 @@ int __of_update_property(struct device_node =
*np, struct property *newprop,
>> 		*next =3D newprop;
>> 	}
>>=20
>> +	__of_handle_special_property(np, newprop, =
OF_RECONFIG_UPDATE_PROPERTY);
>> +
>> 	return 0;
>> }
>>=20
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 87fb684..b033239 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -191,18 +191,10 @@ int of_property_notify(int action, struct =
device_node *np,
>>=20
>> void __of_attach_node(struct device_node *np)
>> {
>> -	const __be32 *phandle;
>> -	int sz;
>> -
>> -	np->name =3D __of_get_property(np, "name", NULL) ? : "<NULL>";
>> -	np->type =3D __of_get_property(np, "device_type", NULL) ? : =
"<NULL>";
>> -
>> -	phandle =3D __of_get_property(np, "phandle", &sz);
>> -	if (!phandle)
>> -		phandle =3D __of_get_property(np, "linux,phandle", &sz);
>> -	if (IS_ENABLED(PPC_PSERIES) && !phandle)
>> -		phandle =3D __of_get_property(np, "ibm,phandle", &sz);
>> -	np->phandle =3D (phandle && (sz >=3D 4)) ? be32_to_cpup(phandle) =
: 0;
>> +	if (!np->name)
>> +		np->name =3D "<NULL>";
>> +	if (!np->type)
>> +		np->type =3D "<NULL>";
>>=20
>> 	np->child =3D NULL;
>> 	np->sibling =3D np->parent->child;
>> --=20
>> 1.7.12
>>=20
>=20
