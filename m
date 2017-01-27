From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] checks: Add bus checks for PCI buses
Date: Fri, 27 Jan 2017 16:54:46 -0600
Message-ID: <CAL_Jsq+wavm6VBOotR7wVo_e5MuzEUhGxeCnqMLphGHP9tKOwQ@mail.gmail.com>
References: <20170124174534.3865-1-robh@kernel.org> <20170124174534.3865-6-robh@kernel.org>
 <148538384894.3179.13621971850704403546@sboyd-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <148538384894.3179.13621971850704403546@sboyd-linaro>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 25, 2017 at 4:37 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Rob Herring (2017-01-24 09:45:34)
>> @@ -587,7 +592,88 @@ static void fixup_path_references(struct check *c, struct dt_info *dti,
>>  }
>>  ERROR(path_references, fixup_path_references, NULL, &duplicate_node_names);
>>
>> +static bool is_pci_bridge(struct node *node)
>> +{
>> +       struct property *prop;
>> +
>> +       prop = get_property(node, "device_type");
>> +       if (!prop)
>> +               return false;
>> +
>> +       if (strcmp(prop->val.val, "pci") == 0)
>> +               return true;
>> +
>> +       return false;
>
> This could be simplified?
>
>         return strcmp(prop->val.val, "pci") == 0;

Duh, OC!

>
>> +}
>> +
> [...]
>> +
>> +struct bus_type pci_bus_type = {
>
> static? const?
>
>> +        .bridge_is_type = is_pci_bridge,
>> +        .check_bridge = pci_check_bridge,
>> +        .check_device = pci_check_device,
>> +};
>> +
>>  struct bus_type *bus_types[] = {
>
> static? const?

Yes. Fixed these 2 and everywhere else.

Rob
