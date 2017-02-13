From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] checks: Add bus checks for PCI buses
Date: Mon, 13 Feb 2017 14:49:45 -0600
Message-ID: <CAL_JsqLkfbFhL34y=xyKB0ooSWDUKON2may50MH6zfFG_YVEaQ@mail.gmail.com>
References: <20170210164717.1234-1-robh@kernel.org> <20170210164717.1234-5-robh@kernel.org>
 <20170213050355.GZ25381@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170213050355.GZ25381@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 12, 2017 at 11:03 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Fri, Feb 10, 2017 at 10:47:17AM -0600, Rob Herring wrote:
>> Add PCI bridge and device node checks. We identify PCI bridges with
>> 'device_type = "pci"' as only PCI bridges should set that property. For
>> bridges, check that ranges is present and #address-cells and
>>
>> For devices, the primary check is the reg property and the unit address.
>> Device unit addresses are in the form DD or DD,F where DD is the
>> device 0-0x1f and F is the function 0-7.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> v2:
>> - Remove bus_type functions. Combine test for bus_type and bridge check
>>   into single check.
>> - Add a check that PCI bridge node name is pci or pcie.
>>
>>  checks.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  dtc.h    |  7 ++++++
>>  2 files changed, 90 insertions(+)
>>
>> diff --git a/checks.c b/checks.c
>> index 16d17d20caec..9ebb148f947a 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -702,6 +702,86 @@ static void check_ranges_format(struct check *c, struct dt_info *dti,
>>  }
>>  WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
>>
>> +static const struct bus_type pci_bus = {
>> +     .type = PCI_BUS_TYPE,
>
> Since you can use the struct pointer itself as a handle on the bus
> type, I don't think there's any value to having the enum-style type
> value.  What _would_ be useful is a human readable bus type name.

Okay.

>> +};
>> +
>> +static void check_pci_bridge(struct check *c, struct dt_info *dti, struct node *node)
>> +{
>> +     struct property *prop;
>> +
>> +     prop = get_property(node, "device_type");
>> +     if (!prop || strcmp(prop->val.val, "pci"))
>> +             return;
>> +
>> +     node->bus = &pci_bus;
>> +
>> +     if (strncmp(node->name, "pci", node->basenamelen) &&
>> +         strncmp(node->name, "pcie", node->basenamelen))
>> +             FAIL(c, "Node %s node name is not \"pci\" or \"pcie\"",
>> +                          node->fullpath);
>
> Please use the strneq() macro - I frequently get confused about
> whether strcmp()/strncmp() comparisons need an ! or not for equality
> testing.  streq() / strneq() help me remember.
>
>> +
>> +     prop = get_property(node, "ranges");
>> +     if (!prop)
>> +             FAIL(c, "Node %s missing ranges for PCI bridge (or not a bridge)",
>> +                          node->fullpath);
>> +
>> +     if (node_addr_cells(node) != 3)
>> +             FAIL(c, "Node %s incorrect #address-cells for PCI bridge",
>> +                          node->fullpath);
>> +     if (node_size_cells(node) != 2)
>> +             FAIL(c, "Node %s incorrect #size-cells for PCI bridge",
>> +                          node->fullpath);
>> +}
>> +WARNING(pci_bridge, check_pci_bridge, NULL,
>> +     &device_type_is_string, &addr_size_cells);
>> +
>> +static void check_pci_device(struct check *c, struct dt_info *dti, struct node *node)
>> +{
>> +     struct property *prop;
>> +     const char *unitname = get_unitname(node);
>> +     char unit_addr[5];
>> +     unsigned int dev, func, reg;
>> +
>> +     if (!node->parent || !node->parent->bus ||
>> +         (node->parent->bus->type != PCI_BUS_TYPE))
>
> You can just use node->parent->bus != &pci_bus here.
>
>> +             return;
>> +
>> +     prop = get_property(node, "reg");
>> +     if (!prop)
>> +             return;
>> +
>> +     reg = fdt32_to_cpu(*((cell_t *)prop->val.val));
>> +
>> +     dev = (reg & 0xf800) >> 11;
>> +     func = (reg & 0x700) >> 8;
>> +
>> +     if (reg & 0xff000000)
>> +             FAIL(c, "Node %s PCI reg address is not configuration space",
>> +                          node->fullpath);
>> +
>> +     if (dev > 0x1f)
>> +             FAIL(c, "Node %s PCI device number out of range",
>> +                          node->fullpath);
>> +     if (func > 7)
>> +             FAIL(c, "Node %s PCI function number out of range",
>> +                  node->fullpath);

BTW, I just noticed these 2 checks I can drop. They can never be true
since I'm masking the values.

>> +
>> +     if (func == 0) {
>> +             snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
>> +             if (!strcmp(unitname, unit_addr))
>> +                     return;
>> +     }
>> +
>> +     snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
>> +     if (!strcmp(unitname, unit_addr))
>> +             return;
>
> So as mentioned in my comments to 3/4, the test above, I would put
> back into unit_address_vs_reg, using a callback in the bus_type which
> formats a reg into the correct unit address.

Humm, that doesn't really work. The unit address can be in 2 different
forms when func# is 0. We can have either <dev> or <dev>,0.

Rob
