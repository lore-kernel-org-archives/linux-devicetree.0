Return-Path: <pantelis.antoniou@konsulko.com>
Return-Path: <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 2/6] OF: Add [__]of_find_node_by_full_name
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
In-Reply-To: <53A86ADA.9000903@roeck-us.net>
Date: Mon, 23 Jun 2014 21:00:39 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F4A55EC-744B-49CC-96FA-811C9483A43D@konsulko.com>
References: <1403430039-15085-1-git-send-email-pantelis.antoniou@konsulko.com> <1403430039-15085-3-git-send-email-pantelis.antoniou@konsulko.com> <53A86ADA.9000903@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Guenter,

On Jun 23, 2014, at 8:58 PM, Guenter Roeck wrote:

> On 06/22/2014 02:40 AM, Pantelis Antoniou wrote:
>> __of_find_node_by_full_name recursively searches for a matching node
>> with the given full name without taking any locks.
>>=20
>> of_find_node_by_full_name takes locks and takes a reference on the
>> matching node.
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>>  drivers/of/base.c  | 58 =
++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/of.h |  4 ++++
>>  2 files changed, 62 insertions(+)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d3493e1..80fef33 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1201,6 +1201,64 @@ static void =
*of_find_property_value_of_size(const struct device_node *np,
>>  }
>>=20
>>  /**
>> + * __of_find_node_by_full_name - Find a node with the full name =
recursively
>> + * @node:	Root of the tree to perform the search
>> + * @full_name:	Full name of the node to find.
>> + *
>> + * Find a node with the give full name by recursively following any =
of
>> + * the child node links.
>> + * Returns the matching node, or NULL if not found.
>> + * Note that the devtree lock is not taken, so this function is only
>> + * safe to call on either detached trees, or when devtree lock is =
already
>> + * taken.
>> + */
>> +struct device_node *__of_find_node_by_full_name(struct device_node =
*node,
>> +		const char *full_name)
>> +{
>> +	struct device_node *child, *found;
>> +
>> +	if (node =3D=3D NULL)
>> +		return NULL;
>> +
>> +	/* check */
>> +	if (of_node_cmp(node->full_name, full_name) =3D=3D 0)
>> +		return node;
>> +
>> +	__for_each_child_of_node(node, child) {
>> +		found =3D __of_find_node_by_full_name(child, full_name);
>> +		if (found !=3D NULL)
>> +			return found;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(__of_find_node_by_full_name);
>> +
>> +/**
>> + * of_find_node_by_full_name - Find a node with the full name =
recursively
>> + * @node:	Root of the tree to perform the search
>> + * @full_name:	Full name of the node to find.
>> + *
>> + * Find a node with the give full name by recursively following any =
of
>> + * the child node links.
>> + * Returns the matching node (with a ref taken), or NULL if not =
found.
>> + */
>> +struct device_node *of_find_node_by_full_name(struct device_node =
*node,
>> +		const char *full_name)
>> +{
>> +	unsigned long flags;
>> +	struct device_node *np;
>> +
>> +	raw_spin_lock_irqsave(&devtree_lock, flags);
>> +	np =3D of_find_node_by_full_name(node, full_name);
>=20
> Should this be __of_find_node_by_full_name, or am I missing something =
?
>=20

Ugh, you're not missing something. This slipped through since this is =
not=20
used in the current code

Thanks!

> Guenter
>=20

Regards

-- Pantelis

>> +	of_node_get(np);
>> +	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> +
>> +	return np;
>> +}
>> +EXPORT_SYMBOL(of_find_node_by_full_name);
>> +
>> +/**
>>   * of_property_read_u32_index - Find and read a u32 from a =
multi-value property.
>>   *
>>   * @np:		device node from which the property value is to =
be read.
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 196b34c..f7392c0 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -230,6 +230,10 @@ extern struct device_node =
*of_find_matching_node_and_match(
>>=20
>>  extern struct device_node *of_find_node_by_path(const char *path);
>>  extern struct device_node *of_find_node_by_phandle(phandle handle);
>> +struct device_node *__of_find_node_by_full_name(struct device_node =
*node,
>> +						const char *full_name);
>> +struct device_node *of_find_node_by_full_name(struct device_node =
*node,
>> +						const char *full_name);
>>  extern struct device_node *of_get_parent(const struct device_node =
*node);
>>  extern struct device_node *of_get_next_parent(struct device_node =
*node);
>>  extern struct device_node *of_get_next_child(const struct =
device_node *node,
>>=20
>=20
