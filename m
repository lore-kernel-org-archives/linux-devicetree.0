From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] checks: Add bus checks for simple-bus buses
Date: Mon, 6 Mar 2017 04:48:18 -0600
Message-ID: <CAL_JsqJzWAiBUZeRMx0i5Y_NAFH6_jrASWcFp_U4MwVf2+=h0w@mail.gmail.com>
References: <20170228224310.14162-1-robh@kernel.org> <20170228224310.14162-3-robh@kernel.org>
 <20170303021206.GD4067@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170303021206.GD4067-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 2, 2017 at 8:12 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Feb 28, 2017 at 04:43:09PM -0600, Rob Herring wrote:
>> Add checks to identify simple-bus bus types and checks for child
>> devices. Simple-bus type is generally identified by "simple-bus"
>> compatible string. We also treat the root as a simple-bus, but only for
>> child nodes with reg property.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> v2:
>> - new patch
>>
>>  checks.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>
>> diff --git a/checks.c b/checks.c
>> index 5ed91ac50a10..c4865b4c8da0 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -817,6 +817,72 @@ static void check_pci_device_reg(struct check *c, struct dt_info *dti, struct no
>>  }
>>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
>>
>> +static const struct bus_type simple_bus = {
>> +     .name = "simple-bus",
>> +};
>> +
>> +static bool node_is_compatible(struct node *node, const char *compat)
>> +{
>> +     struct property *prop;
>> +     const char *str;
>> +
>> +     prop = get_property(node, "compatible");
>> +     if (!prop)
>> +             return false;
>> +
>> +     for (str = prop->val.val; str < prop->val.val + prop->val.len; str += strlen(str) + 1) {
>
> This isn't safe if the compatible property is filled with garbage (not
> '\0' terminated) - the strlen() could access beyond the end of the
> property value.

Okay, I guess I can check that prop->val.val[prop->val.len - 1] == 0 up front.

>
>> +             if (streq(str, compat))
>> +                     return true;
>> +     }
>> +     return false;
>> +}
>> +
>> +static void check_simple_bus_bridge(struct check *c, struct dt_info *dti, struct node *node)
>> +{
>> +     if (node_is_compatible(node, "simple-bus") || !node->parent)
>> +             node->bus = &simple_bus;
>
> I don't think it's correct to assume the root bus is always a
> simple-bus.  If it is, it really should be listed explicitly in the
> root node's compatible property.

It is in the sense that Linux treats the root the same and creates
devices for top level children and then descends for nodes with
"simple-bus". And since unit addresses are a single address space for
a given level, we can't have any other bus type. IOW, any other
defined bus type like I2C is going to be a child of its controller.

Rob
