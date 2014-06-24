Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/6] of: Do not free memory at of_node_release
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140624141004.9E989C40B84@trevor.secretlab.ca>
Date: Tue, 24 Jun 2014 17:23:35 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E39F7E8-1141-4D6D-A251-3F0DDEA9AA29@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-2-git-send-email-pantelis.antoniou@konsulko.com> <20140624141004.9E989C40B84@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jun 24, 2014, at 5:10 PM, Grant Likely wrote:

> On Sun, 22 Jun 2014 12:40:34 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> The life-cycle of nodes and properties does not allow us to release
>> the memory taken by a device_node. Pointer to properties and nodes
>> might still be in use in drivers, so any memory free'ing is =
dangerous.
>>=20
>> Simply move all the properties to the deadprops list, and the node
>> itself to of_alldeadnodes until the life-cycles issues are resolved.
>=20
> Ummm. this looks wrong. The release function is supposed to be the =
place
> to do the freeing, and with our discussion the other day about moving =
to
> rcu, but keeping of_node_get/put() for anything that needs to hold a
> long term reference, that means the lifecycle issues are pretty much
> resolved. I don't think this patch is necessary.
>=20

Well, I thought about it too. This is the culmination of that process :)

The problem is not the node life-cycle, it's the properties. We can't
tell for sure who and where has a pointer to the properties of the node,
and when we free the node, the current code iterates over the properties
list and frees them. This works only because in my tests, =
of_node_release
only gets called when using overlays created nodes.

It is your call, but this patch makes me sleep easier at nights :)

> g.
>=20

Regards

-- Pantelis

>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/base.c | 43 ++++++++++++++++++++++++++++---------------
>> 1 file changed, 28 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index b986480..d3493e1 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -110,17 +110,27 @@ static inline struct device_node =
*kobj_to_device_node(struct kobject *kobj)
>> 	return container_of(kobj, struct device_node, kobj);
>> }
>>=20
>> +static struct device_node *of_alldeadnodes;
>> +static DEFINE_RAW_SPINLOCK(deadtree_lock);
>> +
>> /**
>>  *	of_node_release - release a dynamically allocated node
>>  *	@kref:  kref element of the node to be released
>>  *
>>  *	In of_node_put() this function is passed to kref_put()
>>  *	as the destructor.
>> + *
>> + *	Note that due to the way that node and property life-cycles
>> + *	are not completely managed, we can't free the memory of
>> + *	a node at will. Instead we move the node to the dead nodes
>> + *	list where it will remain until the life-cycle issues are
>> + *	resolved.
>>  */
>> static void of_node_release(struct kobject *kobj)
>> {
>> 	struct device_node *node =3D kobj_to_device_node(kobj);
>> -	struct property *prop =3D node->properties;
>> +	struct property *prop;
>> +	unsigned long flags;
>>=20
>> 	/* We should never be releasing nodes that haven't been =
detached. */
>> 	if (!of_node_check_flag(node, OF_DETACHED)) {
>> @@ -129,24 +139,27 @@ static void of_node_release(struct kobject =
*kobj)
>> 		return;
>> 	}
>>=20
>> -	if (!of_node_check_flag(node, OF_DYNAMIC))
>> +	pr_info("%s: dead node \"%s\"\n", __func__, node->full_name);
>> +
>> +	/* we should not be trying to release the root */
>> +	if (WARN_ON(node =3D=3D of_allnodes))
>> 		return;
>>=20
>> -	while (prop) {
>> -		struct property *next =3D prop->next;
>> -		kfree(prop->name);
>> -		kfree(prop->value);
>> -		kfree(prop);
>> -		prop =3D next;
>> +	/* can't use devtree lock; at of_node_put caller might be =
holding it */
>> +	raw_spin_lock_irqsave(&deadtree_lock, flags);
>>=20
>> -		if (!prop) {
>> -			prop =3D node->deadprops;
>> -			node->deadprops =3D NULL;
>> -		}
>> +	/* move all properties to dead properties */
>> +	while ((prop =3D node->properties) !=3D NULL) {
>> +		node->properties =3D prop->next;
>> +		prop->next =3D node->deadprops;
>> +		node->deadprops =3D prop;
>> 	}
>> -	kfree(node->full_name);
>> -	kfree(node->data);
>> -	kfree(node);
>> +
>> +	/* move node to alldeadnodes */
>> +	node->allnext =3D of_alldeadnodes;
>> +	of_alldeadnodes =3D node;
>> +
>> +	raw_spin_unlock_irqrestore(&deadtree_lock, flags);
>> }
>>=20
>> /**
>> --=20
>> 1.7.12
>>=20
>=20
