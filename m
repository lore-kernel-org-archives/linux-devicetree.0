Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/5] of: Do not free memory at of_node_release option
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <20140707131018.7E33EC409D5@trevor.secretlab.ca>
Date: Mon, 7 Jul 2014 16:13:42 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <21848B64-6661-4D22-A3D4-4E85E38EB758@konsulko.com>
References: <1404493129-8914-1-git-send-email-pantelis.antoniou@konsulko.com> <1404493129-8914-2-git-send-email-pantelis.antoniou@konsulko.com> <20140707131018.7E33EC409D5@trevor.secretlab.ca>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Grant,

On Jul 7, 2014, at 4:10 PM, Grant Likely wrote:

> On Fri,  4 Jul 2014 19:58:45 +0300, Pantelis Antoniou =
<pantelis.antoniou@konsulko.com> wrote:
>> Introduce an option whether to free or not the memory of a node
>> and it's properties when of_node_release is called.
>>=20
>> The option is located in the chosen node, and its name is
>> of-node-keep. When this boolean property is missing the default
>> behaviour of freeing is preserved.
>=20
> No way. The problem is buggy kernel code. We've got a plan to fix =
that.
> In the mean time I'm okay with a CONFIG_ option that inhibits freeing,
> or *maybe* a runtime global option that causes free() to not be =
called.
>=20
> What this patch does is not helpful.
>=20

Well, it was a long shot. FWIW I don't need it for overlays, this is =
just to
make sure we don't crash in case we have a buggy driver calling =
of_node_put()
twice or something.

I'm open to suggestions on how to track and fix those.

> g.
>=20

Regards

-- Pantelis

>>=20
>> The rational behind this option is as follows:
>>=20
>> The life-cycle of nodes and properties does not allow us to release
>> the memory taken by a device_node. Pointer to properties and nodes
>> might still be in use in drivers, so any memory free'ing is =
dangerous.
>>=20
>> Simply move all the properties to the deadprops list, and the node
>> itself to of_alldeadnodes until the life-cycles issues are resolved.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/dynamic.c | 74 =
+++++++++++++++++++++++++++++++++++++++++-----------
>> 1 file changed, 59 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index a5d6f4f..0e8457c 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -180,17 +180,29 @@ int of_detach_node(struct device_node *np)
>> 	return rc;
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
>> + *	There is an option to not free the node, since due to the
>> + *	way that node and property life-cycles are not completely
>> + *	managed, we can't free the memory of a node at will.
>> + *	Instead we move the node to the dead nodes list where it will
>> + *	remain until the life-cycle issues are resolved.
>>  */
>> -static void of_node_release(struct kobject *kobj)
>> +void of_node_release(struct kobject *kobj)
>> {
>> +	/*  we probe the of-node-keep chosen prop once */
>> +	static int node_keep =3D -1;
>> 	struct device_node *node =3D kobj_to_device_node(kobj);
>> -	struct property *prop =3D node->properties;
>> +	struct property *prop;
>> +	unsigned long flags;
>>=20
>> 	/* We should never be releasing nodes that haven't been =
detached. */
>> 	if (!of_node_check_flag(node, OF_DETACHED)) {
>> @@ -199,23 +211,55 @@ static void of_node_release(struct kobject =
*kobj)
>> 		return;
>> 	}
>>=20
>> -	if (!of_node_check_flag(node, OF_DYNAMIC))
>> +	/* we should not be trying to release the root */
>> +	if (WARN_ON(node =3D=3D of_allnodes))
>> 		return;
>>=20
>> -	while (prop) {
>> -		struct property *next =3D prop->next;
>> +	/* read the chosen boolean property "of-node-keep" once */
>> +	if (node_keep =3D=3D -1)
>> +		node_keep =3D of_property_read_bool(of_chosen, =
"of-node-keep");
>>=20
>> -		kfree(prop->name);
>> -		kfree(prop->value);
>> -		kfree(prop);
>> -		prop =3D next;
>> +	/* default is to free everything */
>> +	if (!node_keep) {
>>=20
>> -		if (!prop) {
>> -			prop =3D node->deadprops;
>> -			node->deadprops =3D NULL;
>> +		/* free normal properties */
>> +		while ((prop =3D node->properties) !=3D NULL) {
>> +			node->properties =3D prop->next;
>> +			kfree(prop->name);
>> +			kfree(prop->value);
>> +			kfree(prop);
>> 		}
>> +
>> +		/* free deap properties */
>> +		while ((prop =3D node->deadprops) !=3D NULL) {
>> +			node->deadprops =3D prop->next;
>> +			kfree(prop->name);
>> +			kfree(prop->value);
>> +			kfree(prop);
>> +		}
>> +
>> +		/* free the node */
>> +		kfree(node->full_name);
>> +		kfree(node->data);
>> +		kfree(node);
>> +		return;
>> 	}
>> -	kfree(node->full_name);
>> -	kfree(node->data);
>> -	kfree(node);
>> +
>> +	pr_info("%s: dead node \"%s\"\n", __func__, node->full_name);
>> +
>> +	/* can't use devtree lock; at of_node_put caller might be =
holding it */
>> +	raw_spin_lock_irqsave(&deadtree_lock, flags);
>> +
>> +	/* move all properties to dead properties */
>> +	while ((prop =3D node->properties) !=3D NULL) {
>> +		node->properties =3D prop->next;
>> +		prop->next =3D node->deadprops;
>> +		node->deadprops =3D prop;
>> +	}
>> +
>> +	/* move node to alldeadnodes */
>> +	node->allnext =3D of_alldeadnodes;
>> +	of_alldeadnodes =3D node;
>> +
>> +	raw_spin_unlock_irqrestore(&deadtree_lock, flags);
>> }
>> --=20
>> 1.7.12
>>=20
>=20
