From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: overlay: correctly apply overlay node with
 unit-address
Date: Mon, 10 Jul 2017 10:28:00 -0700
Message-ID: <5963B920.4010106@gmail.com>
References: <1499473725-13361-1-git-send-email-frowand.list@gmail.com>
 <1499473725-13361-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKLVX-nNiVcuxiZdpUa8LvQsX37XwpfVfO9r7oCw8woiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKLVX-nNiVcuxiZdpUa8LvQsX37XwpfVfO9r7oCw8woiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/10/17 09:08, Rob Herring wrote:
> On Fri, Jul 7, 2017 at 7:28 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Correct existing node name detection when overlay node name has
>> a unit-address.
>>
>> Expected test result is overlay will update the nodes and properties
>> for /testcase-data-2/fairway-1/ride@100/ after the patch is applied.
>>
>> Before this patch is applied:
>>
>>    Console error message near end of unittest:
>>       OF: Duplicate name in fairway-1, renamed to "ride@100#1"
>>
>>    $ cd /proc/device-tree/testcase-data-2/fairway-1/
>>    $ # extra node: ride@100#1
>>    $ ls
>>    #address-cells  linux,phandle   phandle         ride@200
>>    #size-cells     name            ride@100        status
>>    compatible      orientation     ride@100#1
>>    $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
>>    $ ls track@3/incline_up
>>    ls: track@3/incline_up: No such file or directory
>>    $ ls track@4/incline_up
>>    ls: track@4/incline_up: No such file or directory
>>
>> After this patch is applied:
>>
>>    Console error message no longer occurs
>>
>>    $ cd /proc/device-tree/testcase-data-2/fairway-1/
>>    $ # no extra node: ride@100#1
>>    $ ls
>>    #address-cells  compatible      name            phandle         ride@200
>>    #size-cells     linux,phandle   orientation     ride@100        status
>>    $ cd /proc/device-tree/testcase-data-2/fairway-1/ride@100/
>>    $ ls track@3/incline_up
>>    track@3/incline_up
>>    $ ls track@4/incline_up
>>    track@4/incline_up
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
>>  drivers/of/overlay.c | 20 +++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index c0e4ee1cd1ba..30aef51eeee5 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -118,6 +118,24 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
>>         return of_changeset_update_property(&ov->cset, target, propn);
>>  }
>>
>> +static struct device_node *child_by_full_name(const struct device_node *np,
> 
> It's not really the full name which currently means the whole path (my
> full_name work is going to change that), but the unit_name (at least
> that's what dtc calls it).

Yes, thanks.  I would change this name, but your next comment below
allows me to remove this function instead.


>> +               const char *cname)
>> +{
>> +       struct device_node *child;
>> +       struct device_node *prev;
>> +
>> +       child = np->child;
>> +       while (child) {
> 
> Doesn't for_each_child_of_node() work here?

Yes, thanks.  And it makes the code compact enough that I can just
put it inside of_overlay_apply_single_device_node() instead of
creating this extra function.


>> +               of_node_get(child);
>> +               if (!of_node_cmp(cname, kbasename(child->full_name)))
>> +                       break;
>> +               prev = child;
>> +               child = child->sibling;
>> +               of_node_put(prev);
>> +       }
>> +       return child;
>> +}
>> +
>>  static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>>                 struct device_node *target, struct device_node *child)
>>  {
>> @@ -130,7 +148,7 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
>>                 return -ENOMEM;
>>
>>         /* NOTE: Multiple mods of created nodes not supported */
>> -       tchild = of_get_child_by_name(target, cname);
>> +       tchild = child_by_full_name(target, cname);
>>         if (tchild != NULL) {
>>                 /* new overlay phandle value conflicts with existing value */
>>                 if (child->phandle)
>> --
>> Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
