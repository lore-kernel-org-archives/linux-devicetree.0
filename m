From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4 1/4] of: change overlay apply input data from
 unflattened to FDT
Date: Thu, 1 Mar 2018 15:38:18 -0800
Message-ID: <b627b147-b8b6-a6a6-35bb-b02e46879313@gmail.com>
References: <1519927256-4868-1-git-send-email-frowand.list@gmail.com>
 <1519927256-4868-2-git-send-email-frowand.list@gmail.com>
 <CAL_JsqL9r8d4wZ0qrsE2fbK4siVWwuyq_9x4RcFJta_7RRhUyg@mail.gmail.com>
 <53b47afa-f7df-777a-6a96-d0b986a389fb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53b47afa-f7df-777a-6a96-d0b986a389fb@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On 03/01/18 14:36, Frank Rowand wrote:
> On 03/01/18 13:02, Rob Herring wrote:
>> On Thu, Mar 1, 2018 at 12:00 PM,  <frowand.list@gmail.com> wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> Move duplicating and unflattening of an overlay flattened devicetree
>>> (FDT) into the overlay application code.  To accomplish this,
>>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>>
>>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>>> code, which is thus responsible for freeing the duplicate FDT.  The
>>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>>> original FDT.
>>>
>>> The unflattened devicetree now belongs to devicetree code, which is
>>> thus responsible for freeing the unflattened devicetree.
>>>
>>> These ownership changes prevent early freeing of the duplicated FDT
>>> or the unflattened devicetree, which could result in use after free
>>> errors.
>>>
>>> of_overlay_fdt_apply() is a private function for the anticipated
>>> overlay loader.
>>>
>>> Update unittest.c to use of_overlay_fdt_apply() instead of
>>> of_overlay_apply().
>>>
>>> Move overlay fragments from artificial locations in
>>> drivers/of/unittest-data/tests-overlay.dtsi into one devicetree
>>> source file per overlay.  This led to changes in
>>> drivers/of/unitest-data/Makefile and drivers/of/unitest.c.
>>>
>>>   - Add overlay directives to the overlay devicetree source files so
>>>     that dtc will compile them as true overlays into one FDT data
>>>     chunk per overlay.
>>>
>>>   - Set CFLAGS for drivers/of/unittest-data/testcases.dts so that
>>>     symbols will be generated for overlay resolution of overlays
>>>     that are no longer artificially contained in testcases.dts
>>>
>>>   - Unflatten and apply each unittest overlay FDT using
>>>     of_overlay_fdt_apply().
>>>
>>>   - Enable the of_resolve_phandles() check for whether the unflattened
>>>     overlay is detached.  This check was previously disabled because the
>>>     overlays from tests-overlay.dtsi were not unflattened into detached
>>>     trees.
>>>
>>>   - Other changes to unittest.c infrastructure to manage multiple test
>>>     FDTs built into the kernel image (access by name instead of
>>>     arbitrary number).
>>>
>>>   - of_unittest_overlay_high_level(): previously unused code to add
>>>     properties from the overlay_base devicetree to the live tree
>>>     was triggered by the restructuring of tests-overlay.dtsi and thus
>>>     testcases.dts.  This exposed two bugs: (1) the need to dup a
>>>     property before adding it, and (2) property 'name' is
>>>     auto-generated in the unflatten code and thus will be a duplicate
>>>     in the __symbols__ node - do not treat this duplicate as an error.
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>> ---

< snip >

>>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>>> index 7a9abaae874d..2d706039ac96 100644
>>> --- a/drivers/of/unittest.c
>>> +++ b/drivers/of/unittest.c

< snip >

>>> @@ -1263,25 +1264,19 @@ static void of_unittest_destroy_tracked_overlays(void)
>>>         } while (defers > 0);
>>>  }
>>>
>>> -static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
>>> +static int __init of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
>>>                 int *overlay_id)
>>
>> Why __init? Really, we want to move towards building the unittests as
>> a module and we don't want __init for that. Though maybe __init is a
>> nop for modules, I don't remember offhand.
> 
> It has to be a nop for modules.
> 
> __init makes sense when the unittests are an initcall.
> 
> 
>> In any case, seems like a separate change.
> 
> Correct.  It was a gratuitous clean up when I was making other changes
> to the function.  I'll remove it from this series.

Now I remember, after trying to remove the __init.  I get a modpost warning
when I build the kernel.

Before the patches, the old overlay tests did not apply the overlays from
overlay FDTs.  Instead the overlay fragment nodes were hand coded into
the testcases dts, and the overlay apply code just grabbed the fragment
nodes from the live testcases tree and called the overlay code to apply
the fragment nodes.

With the new FDT based overlay API, I was able to make the test overlays
actual overlay dts files and dtbs. This change involved changing
of_unittest_apply_overlay() to no longer call of_overlay_apply() (which
passed in a pointer to a node from the live testcases tree), but
instead call overlay_data_apply() (which handles finding the requested
fdt and applies it).  overlay_data_apply() is already an __init() function.

There are a few more functions that I would expect modpost to warn
about, but it does not.

> There is a mix of some functions being marked __init and some not,
> so that will be worth another patch someday.
> 
> 
>>
>> Rob
>>
> 
> 
