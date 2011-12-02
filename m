From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles,
	arrays and bools
Date: Fri, 2 Dec 2011 08:38:24 -0800
Message-ID: <CAPnjgZ0jc1uOD949q_7=r758hgTvByy0tMHY4pjy+nSGbQgNYg@mail.gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-3-git-send-email-sjg@chromium.org>
	<4ED3D5DC.10502@nvidia.com>
	<CAPnjgZ29tsNXd1+1eXdTHRjgh_MQJrXoc23_oqO9UPJ73mu7ZA@mail.gmail.com>
	<4ED8F4FD.4030002@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED8F4FD.4030002@nvidia.com>
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

On Fri, Dec 2, 2011 at 7:55 AM, Stephen Warren <swarren@nvidia.com> wrote:
> On 12/01/2011 06:01 PM, Simon Glass wrote:
>> Hi Stephen,
>>
>> On Mon, Nov 28, 2011 at 10:41 AM, Stephen Warren <swarren@nvidia.com> wr=
ote:
>>> On 11/23/2011 08:54 PM, Simon Glass wrote:
>>>> Add a function to lookup a property which is a phandle in a node, and
>>>> another to read a fixed-length integer array from an fdt property.
>>>> Also add a function to read boolean properties.
>>>>
>>>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
>>>> +/**
>>>> + * Look up a boolean property in a node and return it.
>>>> + *
>>>> + * A boolean properly is true if present in the device tree and false=
 if not
>>>> + * present, or present with a 0 value.
>>>> + *
>>>> + * @param blob =A0 =A0 =A0 FDT blob
>>>> + * @param node =A0 =A0 =A0 node to examine
>>>> + * @param prop_name =A0name of property to find
>>>> + * @return 1 if the properly is present; 0 if it isn't present or is 0
>>>> + */
>>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name=
);
>>>
>>> Does U-Boot allow use of the "bool" type here?
>>
>> Which bool type? It is returning an int.
>
> I was asking if the return type could be changed to bool.

Sorry I misunderstood -  no U-Boot does not have a bool type yet.

>
>>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
>>>> +{
>>>> + =A0 =A0 const s32 *cell;
>>>> + =A0 =A0 int len;
>>>> +
>>>> + =A0 =A0 debug("%s: %s\n", __func__, prop_name);
>>>> + =A0 =A0 cell =3D fdt_getprop(blob, node, prop_name, &len);
>>>> + =A0 =A0 if (!cell)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>>> + =A0 =A0 if (len >=3D sizeof(u32) && *cell =3D=3D 0)
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>>>> +
>>>> + =A0 =A0 return 1;
>>>> +}
>>>
>>> In the kernel, I believe that property existence is all that's usually
>>> checked. Is that wrong? Did the definition of a boolean property's value
>>> in the function description above come from the specification? If a
>>> property had a length of 0/1/2/3 with a zero value, it seems very odd to
>>> treat that as true.
>>
>> It is useful to be able to set the value to 0 or 1 (with fdtget/put),
>> rather than remove or add the property. A value with a length of less
>> than one cell is considered illegal here.
>>
>> The basic idea is that the presence of the property means that it is
>> 'true'. If it happens to have a value, then we allow that to specify
>> 'false' if it is zero.
>
> Well, it's more up to standard device tree practice, not me. I've
> certainly sent patches that used a property with 0/1 value as a bool
> and received review feedback from DT experts that DT represents bools
> as present/absent properties, both with no value, so I assume zero
> length.

Yes that is the preferred way. However, it is useful to be able to
define a meaning when the property does have a value. The value may
come into the fdt later after compilation. At that point it is easier
to change a value rather than make something present/absent. For one
thing it can be done without adjust the size of the fdt blob.

Perhaps the solution is to adjust fdtput to support boolean values
explicitly (in that it would add or remove the property based on a
command-line 0/1 value).

Still I think it is useful to support a zero value meaning false when
it is provided.

Regards,
Simon

>
> --
> nvpublic
>
