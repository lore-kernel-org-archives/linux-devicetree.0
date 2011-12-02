From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles,
	arrays and bools
Date: Thu, 1 Dec 2011 17:01:47 -0800
Message-ID: <CAPnjgZ29tsNXd1+1eXdTHRjgh_MQJrXoc23_oqO9UPJ73mu7ZA@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-3-git-send-email-sjg@chromium.org>
	<4ED3D5DC.10502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED3D5DC.10502@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, Nov 28, 2011 at 10:41 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 11/23/2011 08:54 PM, Simon Glass wrote:
>> Add a function to lookup a property which is a phandle in a node, and
>> another to read a fixed-length integer array from an fdt property.
>> Also add a function to read boolean properties.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Looking at the U-Boot custodians web page, you need to send the core DT
> changes (well, probably anything DT related) to Jerry Van Baren.

Yes the tag was there but not picked up as I didn't have Mike's alias
file in my tree. Will fix.

>
>> +/**
>> + * Look up a property in a node and return its contents in an integer
>> + * array of given length. The property must have at least enough data f=
or
>> + * the array (4*count bytes). It may have more, but this will be ignore=
d.
>> + *
>> + * @param blob =A0 =A0 =A0 =A0 =A0 =A0 =A0 FDT blob
>> + * @param node =A0 =A0 =A0 =A0 =A0 =A0 =A0 node to examine
>> + * @param prop_name =A0name of property to find
>> + * @param array =A0 =A0 =A0 =A0 =A0 =A0 =A0array to fill with data
>> + * @param count =A0 =A0 =A0 =A0 =A0 =A0 =A0number of array elements
>> + * @return 0 if ok, or -FDT_ERR_NOTFOUND if the property is not found,
>> + * =A0 =A0 =A0 =A0 =A0 or -FDT_ERR_BADLAYOUT if not enough data
>> + */
>> +int fdtdec_get_int_array(const void *blob, int node, const char *prop_n=
ame,
>> + =A0 =A0 =A0 =A0 =A0 =A0 int *array, int count);
>
> The kernel's equivalent of this function retrieves an array of U32s. Is
> one version more correct than the other?

I would prefer to have signed, but I will change it to use u32 *.

>
>> +/**
>> + * Look up a boolean property in a node and return it.
>> + *
>> + * A boolean properly is true if present in the device tree and false i=
f not
>> + * present, or present with a 0 value.
>> + *
>> + * @param blob =A0 =A0 =A0 FDT blob
>> + * @param node =A0 =A0 =A0 node to examine
>> + * @param prop_name =A0name of property to find
>> + * @return 1 if the properly is present; 0 if it isn't present or is 0
>> + */
>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
>
> Does U-Boot allow use of the "bool" type here?

Which bool type? It is returning an int.

>
>
>> +/**
>> + * Look up a property in a node and check that it has a minimum length.
>> + *
>> + * @param blob =A0 =A0 =A0 =A0 =A0 =A0 =A0 FDT blob
>> + * @param node =A0 =A0 =A0 =A0 =A0 =A0 =A0 node to examine
>> + * @param prop_name =A0name of property to find
>> + * @param min_len =A0 =A0minimum property length in bytes
>> + * @param err =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00 if ok, or -FDT_ERR_NOTFO=
UND if the property is not
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 found, or -FDT_ERR_BADLAYOUT i=
f not enough data
>> + * @return pointer to cell, which is only valid if err =3D=3D 0
>> + */
>> +static const void *get_prop_len(const void *blob, int node,
>> + =A0 =A0 =A0 =A0 =A0 =A0 const char *prop_name, int min_len, int *err)
>
> Based on the function name, I'd expect it to return the length of the
> property; perhaps get_prop_check_min_len?

Changed, thanks.
>
>> +/**
>> + * Look up a boolean property in a node and return it.
>> + *
>> + * A boolean properly is true if present in the device tree and false i=
f not
>> + * present, or present with a 0 value.
>> + *
>> + * @param blob =A0 =A0 =A0 FDT blob
>> + * @param node =A0 =A0 =A0 node to examine
>> + * @param prop_name =A0name of property to find
>> + * @return 1 if the properly is present; 0 if it isn't present or is 0
>> + */
>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
>> +{
>> + =A0 =A0 const s32 *cell;
>> + =A0 =A0 int len;
>> +
>> + =A0 =A0 debug("%s: %s\n", __func__, prop_name);
>> + =A0 =A0 cell =3D fdt_getprop(blob, node, prop_name, &len);
>> + =A0 =A0 if (!cell)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> + =A0 =A0 if (len >=3D sizeof(u32) && *cell =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 return 1;
>> +}
>
> In the kernel, I believe that property existence is all that's usually
> checked. Is that wrong? Did the definition of a boolean property's value
> in the function description above come from the specification? If a
> property had a length of 0/1/2/3 with a zero value, it seems very odd to
> treat that as true.

It is useful to be able to set the value to 0 or 1 (with fdtget/put),
rather than remove or add the property. A value with a length of less
than one cell is considered illegal here.

The basic idea is that the presence of the property means that it is
'true'. If it happens to have a value, then we allow that to specify
'false' if it is zero.

Thoughts?

Regards,
Simon

>
> --
> nvpublic
>
