From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] checks: add phandle with arg property checks
Date: Thu, 24 Aug 2017 12:23:16 -0500
Message-ID: <CAL_Jsq+0Njjs_PHBSD-B7W9YFzdfpB2ApBcBD=48+BoXQKv2pw@mail.gmail.com>
References: <20170822230208.20987-1-robh@kernel.org> <20170822230208.20987-2-robh@kernel.org>
 <20170824020338.GV5379@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170824020338.GV5379-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 23, 2017 at 9:03 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Aug 22, 2017 at 06:02:06PM -0500, Rob Herring wrote:
>> Many common bindings follow the same pattern of client properties
>> containing a phandle and N arg cells where N is defined in the provider
>> with a '#<specifier>-cells' property such as:
>>
>>       intc0: interrupt-controller@0 {
>>               #interrupt-cells = <3>;
>>       };
>>       intc1: interrupt-controller@1 {
>>               #interrupt-cells = <2>;
>>       };
>>
>>       node {
>>               interrupts-extended = <&intc0 1 2 3>, <&intc1 4 5>;
>>       };
>>
>> Add checks for properties following this pattern.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> v2:
>> - Make each property a separate check
>> - Iterate over raw cells rather than markers
>> - Fix property length check for 2nd to Nth items
>> - Improve error messages. If cell sizes are wrong, the next iteration can
>>   get a bad (but valid) phandle.
>> - Add a test
>>
>>  checks.c                    | 104 ++++++++++++++++++++++++++++++++++++++++++++
>>  dtc.h                       |   1 +
>>  livetree.c                  |   6 +++
>>  tests/bad-phandle-cells.dts |  11 +++++
>>  tests/run_tests.sh          |   1 +
>>  5 files changed, 123 insertions(+)
>>  create mode 100644 tests/bad-phandle-cells.dts
>>
>> diff --git a/checks.c b/checks.c
>> index afabf64337d5..548d7e118c42 100644
>> --- a/checks.c
>> +++ b/checks.c
>> @@ -956,6 +956,93 @@ static void check_obsolete_chosen_interrupt_controller(struct check *c,
>>  WARNING(obsolete_chosen_interrupt_controller,
>>       check_obsolete_chosen_interrupt_controller, NULL);
>>
>> +struct provider {
>> +     const char *prop_name;
>> +     const char *cell_name;
>> +     bool optional;
>
> AFAICT you don't actually use this optional flag, even in the followup
> patches; it's always false.

Yes, it is. Here:

>> +WARNING_PROPERTY_PHANDLE_CELLS(msi_parent, "msi-parent", "#msi-cells", true);

Well hidden, isn't it. :)

>
>> +};
>> +
>> +static void check_property_phandle_args(struct check *c,
>> +                                       struct dt_info *dti,
>> +                                       struct node *node,
>> +                                       struct property *prop,
>> +                                       const struct provider *provider)
>> +{
>> +     struct node *root = dti->dt;
>> +     int cell, cellsize = 0;
>> +
>> +     for (cell = 0; cell < prop->val.len / sizeof(cell_t); cell += cellsize + 1) {
>> +             struct node *provider_node;
>> +             struct property *cellprop;
>> +             int phandle;
>> +
>> +             phandle = propval_cell_n(prop, cell);
>> +             if (phandle == 0 || phandle == -1) {
>> +                     cellsize = 0;
>> +                     continue;
>
> I'm not clear what case this is handling.  If the property has an
> invalid (or unresolved) phandle value, shouldn't that be a FAIL?  As
> it is we interpret the next cell as a phandle, and since we couldn't
> resolve the first phandle, we can't be at all sure that it really is a
> phandle.

It is valid to have a "blank" phandle when you have optional entries,
but need to preserve the indexes of the entries. Say an array of gpio
lines and some may not be hooked up. Not widely used, but it does
exist in kernel dts files.


>> +             }
>> +
>> +             provider_node = get_node_by_phandle(root, phandle);
>> +             if (!provider_node) {
>> +                     FAIL(c, dti, "Could not get phandle node for %s:%s(cell %d)",
>> +                          node->fullpath, prop->name, cell);
>> +                     break;
>> +             }
>> +
>> +             cellprop = get_property(provider_node, provider->cell_name);
>> +             if (cellprop) {
>> +                     cellsize = propval_cell(cellprop);
>> +             } else if (provider->optional) {
>> +                     cellsize = 0;
>> +             } else {
>> +                     FAIL(c, dti, "Missing property '%s' in node %s or bad phandle (referred from %s:%s[%d])",
>> +                          provider->cell_name,
>> +                          provider_node->fullpath,
>> +                          node->fullpath, prop->name, cell);
>> +                     break;
>> +             }
>> +
>> +             if (prop->val.len < ((cell + cellsize + 1) * sizeof(cell_t))) {
>> +                     FAIL(c, dti, "%s property size (%d) too small for cell size %d in %s",
>> +                          prop->name, prop->val.len, cellsize, node->fullpath);
>> +             }
>
> How will this cope if the property is really badly formed - e.g. a 3
> byte property, so you can't even grab a whole first phandle?  I think
> it will trip the assert() in propval_cell_n() which isn't great.

At least for your example, we'd exit the loop (cell < 3/4). But I need
to a check for that because it would be silent currently. I'll add a
check that the size is a multiple of 4 and greater than 0.

However, the check here is not perfect because we could have
"<&phandle1 1 2>" when really it should be "<&phandle1 &phandle2
&phandle3>". We don't fail until we're checking the 2nd phandle.
That's why I added the "or bad phandle" and the cell # in the message
above. In the opposite case, we'd be silent. One thing that could be
done is double check things against the markers if they are present.

Rob
