From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles, arrays and
 bools
Date: Fri, 02 Dec 2011 08:55:41 -0700
Message-ID: <4ED8F4FD.4030002@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>	<1322106896-23054-3-git-send-email-sjg@chromium.org>	<4ED3D5DC.10502@nvidia.com>
 <CAPnjgZ29tsNXd1+1eXdTHRjgh_MQJrXoc23_oqO9UPJ73mu7ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ29tsNXd1+1eXdTHRjgh_MQJrXoc23_oqO9UPJ73mu7ZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/01/2011 06:01 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, Nov 28, 2011 at 10:41 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 11/23/2011 08:54 PM, Simon Glass wrote:
>>> Add a function to lookup a property which is a phandle in a node, and
>>> another to read a fixed-length integer array from an fdt property.
>>> Also add a function to read boolean properties.
>>>
>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

>>> +/**
>>> + * Look up a boolean property in a node and return it.
>>> + *
>>> + * A boolean properly is true if present in the device tree and false if not
>>> + * present, or present with a 0 value.
>>> + *
>>> + * @param blob       FDT blob
>>> + * @param node       node to examine
>>> + * @param prop_name  name of property to find
>>> + * @return 1 if the properly is present; 0 if it isn't present or is 0
>>> + */
>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name);
>>
>> Does U-Boot allow use of the "bool" type here?
> 
> Which bool type? It is returning an int.

I was asking if the return type could be changed to bool.

>>> +int fdtdec_get_bool(const void *blob, int node, const char *prop_name)
>>> +{
>>> +     const s32 *cell;
>>> +     int len;
>>> +
>>> +     debug("%s: %s\n", __func__, prop_name);
>>> +     cell = fdt_getprop(blob, node, prop_name, &len);
>>> +     if (!cell)
>>> +             return 0;
>>> +     if (len >= sizeof(u32) && *cell == 0)
>>> +             return 0;
>>> +
>>> +     return 1;
>>> +}
>>
>> In the kernel, I believe that property existence is all that's usually
>> checked. Is that wrong? Did the definition of a boolean property's value
>> in the function description above come from the specification? If a
>> property had a length of 0/1/2/3 with a zero value, it seems very odd to
>> treat that as true.
> 
> It is useful to be able to set the value to 0 or 1 (with fdtget/put),
> rather than remove or add the property. A value with a length of less
> than one cell is considered illegal here.
> 
> The basic idea is that the presence of the property means that it is
> 'true'. If it happens to have a value, then we allow that to specify
> 'false' if it is zero.

Well, it's more up to standard device tree practice, not me. I've
certainly sent patches that used a property with 0/1 value as a bool
and received review feedback from DT experts that DT represents bools
as present/absent properties, both with no value, so I assume zero
length.

-- 
nvpublic
