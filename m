From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 03/12] of: overlay: rename identifiers to more reflect
 what they do
Date: Tue, 17 Oct 2017 11:53:48 -0700
Message-ID: <59E651BC.6030802@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
 <1508203074-26917-4-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJDZFznVm0TvCePHq_J-FhNyEXoLEue_ZRhOm6LyXC5kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJDZFznVm0TvCePHq_J-FhNyEXoLEue_ZRhOm6LyXC5kQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/17/17 07:38, Rob Herring wrote:
> On Mon, Oct 16, 2017 at 8:17 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> This patch is aimed primarily at drivers/of/overlay.c, but those
>> changes also have a small impact in a few other files.
>>
>> overlay.c is difficult to read and maintain.  Improve readability:
>>   - Rename functions, types and variables to better reflect what
>>     they do and to be consistent with names in other places,
>>     such as the device tree overlay FDT (flattened device tree),
>>     and make the algorithms more clear
>>   - Use the same names consistently throughout the file
>>   - Update comments for name changes
>>   - Fix incorrect comments
>>
>> This patch is intended to not introduce any functional change.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
>>  Documentation/devicetree/overlay-notes.txt   |  12 +-
>>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   5 +-
>>  drivers/of/dynamic.c                         |   2 +-
>>  drivers/of/overlay.c                         | 506 ++++++++++++++-------------
>>  drivers/of/unittest.c                        |  20 +-
>>  include/linux/of.h                           |  12 +-
>>  6 files changed, 294 insertions(+), 263 deletions(-)
> 
> Doesn't build:
> 
> ../drivers/of/overlay.c:397:41: warning: ‘struct of_overlay_info’
> declared inside parameter list will not be visible outside of this
> definition or declaration
>    struct device_node *info_node, struct of_overlay_info *ovinfo)
>                                          ^~~~~~~~~~~~~~~
> ../drivers/of/overlay.c:396:40: warning: ‘struct of_overlay’ declared
> inside parameter list will not be visible outside of this definition
> or declaration
>  static int of_fill_overlay_info(struct of_overlay *ov,
>                                         ^~~~~~~~~~
> ../drivers/of/overlay.c: In function ‘of_fill_overlay_info’:
> ../drivers/of/overlay.c:399:8: error: dereferencing pointer to
> incomplete type ‘struct of_overlay_info’
>   ovinfo->overlay = of_get_child_by_name(info_node, "__overlay__");
>         ^~
> ../drivers/of/overlay.c: In function ‘init_overlay_changeset’:
> ../drivers/of/overlay.c:450:30: error: passing argument 1 of
> ‘of_fill_overlay_info’ from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>    ret = of_fill_overlay_info(ovcs, node, &fragments[cnt]);
>                               ^~~~
> ../drivers/of/overlay.c:396:12: note: expected ‘struct of_overlay *’
> but argument is of type ‘struct overlay_changeset *’
>  static int of_fill_overlay_info(struct of_overlay *ov,
>             ^~~~~~~~~~~~~~~~~~~~
> ../drivers/of/overlay.c:450:42: error: passing argument 3 of
> ‘of_fill_overlay_info’ from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>    ret = of_fill_overlay_info(ovcs, node, &fragments[cnt]);
>                                           ^
> ../drivers/of/overlay.c:396:12: note: expected ‘struct of_overlay_info
> *’ but argument is of type ‘struct fragment *’
>  static int of_fill_overlay_info(struct of_overlay *ov,
>             ^~~~~~~~~~~~~~~~~~~~
> 
> 
> I could have messed something up as every commit so far conflicts with
> "of: overlay: fix memory leak related to duplicated property". Can you
> rebase on to my dt/next branch too.
> 
> Rob
> 

OK, I'll rebase.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
