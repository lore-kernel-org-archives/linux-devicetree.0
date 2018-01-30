From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 16:01:38 -0800
Message-ID: <d2ad9f6f-bf66-10bc-6156-cb006ab9447d@gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
 <1517194414-19932-2-git-send-email-frowand.list@gmail.com>
 <CABGGisyx_aXCxKO5x-5M5mEM7s=jMYZDaQZ9jdL6hapMCOyM=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABGGisyx_aXCxKO5x-5M5mEM7s=jMYZDaQZ9jdL6hapMCOyM=Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On 01/29/18 06:42, Rob Herring wrote:
> On Sun, Jan 28, 2018 at 8:53 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Move duplicating and unflattening of an overlay flattened devicetree
>> (FDT) into the overlay application code.  To accomplish this,
>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>
>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>> code, which is thus responsible for freeing the duplicate FDT.  The
>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>> original FDT.
>>
>> The unflattened device tree (aka expanded device tree, EDT) now
> 
> Not really a fan of a new acronym.
> 
>> belongs to devicetree code, which is thus responsible for freeing
>> the EDT.
>>
>> These ownership changes prevent early freeing of the duplicated FDT
>> or the EDT, which could result in use after free errors.
>>
>> of_overlay_fdt_apply() is a private function for the anticipated
>> overlay loader.
>>
>> Update unittest.c to use of_overlay_fdt_apply() instead of
>> of_overlay_apply().
>>
>> Move overlay fragments from artificial locations in
>> drivers/of/unittest-data/tests-overlay.dtsi into one devicetree
>> source file per overlay.  This led to changes in
>> drivers/of/unitest-data/Makefile and drivers/of/unitest.c.

I should have reversed the cause and effect in that sentence to
instead be:

  The changes to drivers/of/unittest.c require the test overlays
  to be in FDT form instead of unflattened devicetree form.  Move
  overlay fragments from artificial locations in
  drivers/of/unittest-data/tests-overlay.dtsi into one
  devicetree source file per overlay and thus create
  one FDT per overlay.


> Why the rearranging? That should be a separate patch.
Bisectability.

I can make the changes to the devicetree files in a second patch.
After the first patch, there will be 29 self test fails.

I will make the change unless you respond back to this saying not to.


>>   - Add overlay directives to the overlay devicetree source files so
>>     that dtc will compile them as true overlays into one FDT data
>>     chunk per overlay.
> 
> For this?
> 
>>   - Set CFLAGS for drivers/of/unittest-data/testcases.dts so that
>>     symbols will be generated for overlay resolution of overlays
>>     that are no longer artificially contained in testcases.dts
>>
>>   - Unflatten and apply each unittest overlay FDT using
>>     of_overlay_fdt_apply().
>>
>>   - Enable the of_resolve_phandles() check for whether the overlay
>>     EDT is detached.  This check was previously disabled because the
>>     overlays from tests-overlay.dtsi were not unflattened into detached
>>     trees.
>>
>>   - Other changes to unittest.c infrastructure to manage multiple test
>>     FDTs built into the kernel image (access by name instead of
>>     arbitrary number).
>>
>>   - of_unittest_overlay_high_level(): previously unused code to add
>>     properties from the overlay_base devicetree to the live tree
>>     was triggered by the restructuring of tests-overlay.dtsi and thus
>>     testcases.dts.  This exposed two bugs: (1) the need to dup a
>>     property before adding it, and (2) property 'name' is
>>     auto-generated in the unflatten code and thus will be a duplicate
>>     in the __symbols__ node - do not treat this duplicate as an error.
>>
>> Errors while developing the patch exposed inadequate error messages
>> to debug problems when overlay devicetree fragment nodes contain
>> an invalid target path.  Improved the messages in find_target_node().
> 
> Sounds like another separate patch.

Will do.


> 
> Rob
> 
