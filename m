From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 09/12] of: overlay: avoid race condition between applying
 multiple overlays
Date: Wed, 4 Oct 2017 20:29:59 -0700
Message-ID: <59D5A737.9090905@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <1507002826-16393-10-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKHkPp6M-aE9yVM1Bs599NTpjV33hGXvnOo-W8KKPPsJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKHkPp6M-aE9yVM1Bs599NTpjV33hGXvnOo-W8KKPPsJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On 10/04/17 08:19, Rob Herring wrote:
> On Mon, Oct 2, 2017 at 10:53 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> The process of applying an overlay consists of:
>>   - unflatten an overlay FDT (flattened device tree) into an
>>     EDT (expanded device tree)
>>   - fixup the phandle values in the overlay EDT to fit in a
>>     range above the phandle values in the live device tree
>>   - create the overlay changeset to reflect the contents of
>>     the overlay EDT
>>   - apply the overlay changeset, to modify the live device tree,
>>     potentially changing the maximum phandle value in the live
>>     device tree
>>
>> There is currently no protection against two overlay applies
>> concurrently determining what range of phandle values are in use
>> in the live device tree, and subsequently changing that range.
>> Add a mutex to prevent multiple overlay applies from occurring
>> simultaneously.
>>
>> Ignoring 2 checkpatch warnings: Prefer using '"%s...", __func__'
>> so that the WARN() string will be more easily grepped.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
>>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |  7 +++++++
>>  drivers/of/overlay.c                         | 22 ++++++++++++++++++++++
>>  drivers/of/unittest.c                        | 21 +++++++++++++++++++++
>>  include/linux/of.h                           | 19 +++++++++++++++++++
>>  4 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>> index 7a7be0515bfd..c99f7924b1c6 100644
>> --- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>> @@ -221,6 +221,11 @@ static void __init tilcdc_convert_slave_node(void)
>>                 goto out;
>>         }
>>
>> +       /*
>> +        * protect from of_resolve_phandles() through of_overlay_apply()
>> +        */
>> +       of_overlay_mutex_lock();
>> +
> 
> We can't be relying on callers to get the locking right...

Agreed.


> 
>>         overlay = tilcdc_get_overlay(&kft);
>>         if (!overlay)
>>                 goto out;
>> @@ -256,6 +261,8 @@ static void __init tilcdc_convert_slave_node(void)
>>                 pr_info("%s: ti,tilcdc,slave node successfully converted\n",
>>                         __func__);
>>  out:
>> +       of_overlay_mutex_unlock();
>> +
>>         kfree_table_free(&kft);
>>         of_node_put(i2c);
>>         of_node_put(slave);
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index a0d3222febdc..4ed372af6ce7 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -71,6 +71,28 @@ static int build_changeset_next_level(struct overlay_changeset *ovcs,
>>                 const struct device_node *overlay_node,
>>                 bool is_symbols_node);
>>
>> +/*
>> + * of_resolve_phandles() finds the largest phandle in the live tree.
>> + * of_overlay_apply() may add a larger phandle to the live tree.
>> + * Do not allow race between two overlays being applied simultaneously:
>> + *    mutex_lock(&of_overlay_phandle_mutex)
>> + *    of_resolve_phandles()
>> + *    of_overlay_apply()
>> + *    mutex_unlock(&of_overlay_phandle_mutex)
> 
> Why do these need to be separate functions? I think I mentioned it
> before, but essentially overlay_data_add() should be part of the
> overlay API. We may need to allow for callers to do each step, but
> generally I think the interface should just be "apply this fdt blob".

Yes, that is where I want to end up.

> 
> Rob
> 
