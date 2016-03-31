From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] checks: Add infrastructure for setting bus type of nodes
Date: Thu, 31 Mar 2016 10:17:46 -0500
Message-ID: <CAL_JsqKTarcy2UHKD5m2F7TNP3stNnpCdxTrptGeiTXJJHiGaA@mail.gmail.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org> <20160331052247.GD416@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331052247.GD416-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 12:22 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Wed, Mar 23, 2016 at 07:40:19PM -0500, Rob Herring wrote:
>> In preparation to support bus specific checks, add the necessary
>> infrastructure to determine the bus type for nodes. Initially, PCI and
>> simple bus are supported.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> David,
>
> Sorry it's taken me a while to look at this.  I've been a mixture of
> busy and sick :/

No problem.

[...]

>> +static bool is_pci_bridge(struct node *node)
>> +{
>> +     struct property *prop;
>> +
>> +     if (!node)
>> +             return false;
>> +
>> +     prop = get_property(node, "device_type");
>> +     if (!prop)
>> +             return false;
>> +
>> +     if (strcmp(prop->val.val, "pci") == 0)
>> +             return true;
>> +
>> +     return false;
>> +}
>
> So, I don't love using device_type here, since that's generally
> discouraged in modern flat trees, but I don't know of a better way to
> detect a pci bridge, so I guess it's ok.

True, but pci, cpu, and memory remain as accepted uses. We'd have to
define a "pci-bridge" or "pci-bus" compatible to replace it.

>> +struct bus_type pci_bus_type = {
>> +        .expected_addr_cells = 3,
>> +        .expected_size_cells = 2,
>
> I'm a bit torn here.  Part of me wants to suggest a 'check_bridge'
> function which handles this and can also make more subtle checks, but
> then just the expected cells values will handle nearly all real cases
> more succinctly.

I left them as you had them, but I'm not so sure these are all that
useful. It works for PCI as the sizes are fixed, but then we could
just check against fixed values. For simple-bus, we need more
flexibility because the size could be 1 or 2. For other cases like I2C
or SPI buses, we know the sizes, but we can't really detect those
buses.

Rob
