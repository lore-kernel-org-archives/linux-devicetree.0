From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC 1/2] staging: jnx: Add Juniper connector driver
Date: Fri, 7 Oct 2016 21:57:45 +0300
Message-ID: <B39C2234-7E92-4067-B403-F93CC07CC062@konsulko.com>
References: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853372-21997-2-git-send-email-pantelis.antoniou@konsulko.com> <1475857527.1945.7.camel@perches.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475857527.1945.7.camel-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alon Ronen <aronen-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Dhruva Diveneni <ddevineni-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Yu-Lin Lu <ylu-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Joe,

> On Oct 7, 2016, at 19:25 , Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>=20
> On Fri, 2016-10-07 at 18:16 +0300, Pantelis Antoniou wrote:
>> diff --git a/drivers/staging/jnx/jnx-connector.c =
b/drivers/staging/jnx/jnx-connector.c
> []
>> +struct jnx_conn_data {
>> +	struct device *dev;		/* parent (platform) device */
>> +	const char *name[NUM_OVERLAYS];	/* overlay file names */
>> +	bool enabled;			/* true if can handle interrupts =
*/
>> +	bool poweron;			/* true if assumed to be powered =
on */
>=20
> maybe use pahole and remove some of the wasteful padding
>=20

Yes, good idea; this structure sorta grew organically.

>> +	int attention_button;		/* attention button gpio pin */
>> +	bool have_attention_button;	/* true if attention button =
exists */
>> +	unsigned long attention_button_holdtime;/* button hold time, =
jiffies */
>> +	bool attention_ignore;		/* true if handled by user space =
*/
>> +	int power_enable;		/* power enable gpio pin */
>> +	bool auto_enable;		/* true if board should =
auto-enable */
>> +	struct jnx_i2c_power_seq pon;	/* power-on sequence */
> []
>> +	u32 gpio_flags;
>> +	u16 assembly_id;
>> +	int slot;			/* slot number */
>> +	int type;			/* card type */
>> +	bool static_assembly_id;	/* true if assembly_id is static =
*/
>> +	bool assembly_id_valid;		/* true if assembly_id is valid =
*/
>> +	int adapter;			/* parent i2c adapter number */
> []
>> +	struct mutex mutex;		/* mutex to protect state =
changes */
>> +	bool synchronous;		/* true if state changes are ok =
*/
>> +	struct mutex fdt_mutex;		/* mutex to protect fdt accesses =
*/
> []
>> +	bool standby_to_master;		/* standby:master_ev processing =
*/
>> +};
> []
>> +/*
>> + * jnx_conn_insert_ideeprom()
>> + *   Inserts ideeprom with a parent from OF prop
>> + */
>> +static int jnx_conn_insert_ideeprom(struct jnx_conn_data *data,
>> +				    struct i2c_adapter *adap,
>> +				    struct device_node *node,
>> +				    struct i2c_board_info *info)
>> +{
>> +	struct device *dev =3D data->dev;
>> +	struct i2c_adapter *parent =3D NULL;
>> +	struct i2c_client *client;
>> +	struct device_node *anode;
>> +	struct at24_platform_data at24_pdata =3D {
>> +		.byte_len =3D 256,
>> +		.page_size =3D 4,
>> +		.setup =3D jnx_conn_at24_callback,
>> +		.context =3D data,
>> +	};
>> +
>> +	info->platform_data =3D &at24_pdata;
>=20
> Assigning a temporary address through a pointer argument?
> Isn't there a better way?
>=20

Yeah, it is weird; it works but its risky.

I=E2=80=99ll change it.

>> +/*
>> + * jnx_conn_verify_overlay()
>> + *
>> + * Verify if overlay is compatible with this board/slot
>> + */
>> +static int jnx_conn_verify_overlay(struct jnx_conn_data *data,
>> +				   struct device_node *np)
>> +{
> []
>> +	ret =3D of_property_read_u32(np, "type", &var);
>> +	if (ret) {
>> +		dev_err(dev, "Missing type property\n");
>> +		return ret;
>> +	}
>> +	if (var !=3D data->type) {
>> +		dev_err(dev, "Wrong type: Expected %d, got %d\n",
>> +			data->type, var);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * 'assembly-ids' property must exist, and one of its entries =
must match
>> +	 * the card assembly id
>> +	 */
>> +	assembly_ids =3D of_get_property(np, "assembly-ids", &size);
>> +	if (!assembly_ids || size < sizeof(u32)) {
>> +		dev_err(dev, "Bad assembly-ids property\n");
>> +		return -EINVAL;
>> +	}
>> +	ret =3D -EINVAL;
>> +	for (i =3D 0; i < size / sizeof(u32); i++) {
>> +		if (be32_to_cpu(assembly_ids[i]) =3D=3D =
data->assembly_id) {
>> +			ret =3D 0;
>> +			break;
>> +		}
>> +	}
>> +	if (ret) {
>> +		dev_err(dev, "Assembly ID 0x%x not supported by =
overlay\n",
>> +			data->assembly_id);
>> +		return ret;
>> +	}
>=20
> Given all the direct returns above here, perhaps
>=20
> 	for (i =3D 0; i < size / sizeof(u32); i++) {
> 		if (be32_to_cpu(assembly_ids[i]) =3D=3D =
data->assembly_id)
> 			return 0;
> 	}
>=20

It does look better.

> 	dev_err(...);
> 	return -EINVAL;
>=20
>=20


Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
