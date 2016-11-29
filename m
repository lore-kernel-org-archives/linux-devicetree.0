From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v11 5/7] overlay: Documentation for the overlay sugar
 syntax
Date: Mon, 28 Nov 2016 20:36:07 -0800
Message-ID: <583D05B7.4040109@gmail.com>
References: <1480349141-14145-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480349141-14145-6-git-send-email-pantelis.antoniou@konsulko.com>
 <20161129031054.GI13307@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161129031054.GI13307-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/28/16 19:10, David Gibson wrote:
> On Mon, Nov 28, 2016 at 06:05:39PM +0200, Pantelis Antoniou wrote:
>> There exists a syntactic sugar version of overlays which
>> make them simpler to write for the trivial case of a single target.

It also works for multiple targets.  (See the example I provided in
my comment to v10.)


>>
>> Document it in the device tree object internals.
>>
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> 
> I'm with Frank that I think this, rather than being regarded mere
> syntactic sugar, should be considered the primary way of describing
> overlays.
> 
> Obviously we need to support the fully written out version as well.

If we need to support the fully written out version, can we make that
a discouraged, non-preferred method?  Maybe require an option to
enable compiling this style of dts?

I can imagine some reasons to support the fully written out version,
but can we document what those reasons are?

-Frank

> 
>> ---
>>  Documentation/dt-object-internal.txt | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/Documentation/dt-object-internal.txt b/Documentation/dt-object-internal.txt
>> index 026d4ee..d5b841e 100644
>> --- a/Documentation/dt-object-internal.txt
>> +++ b/Documentation/dt-object-internal.txt
>> @@ -300,3 +300,19 @@ local reference is being made. No matter how phandles are allocated from dtc
>>  the run time loader must apply an offset to each phandle in every dynamic
>>  DT object loaded. The __local_fixups__ node records the place of every
>>  local reference so that the loader can apply the offset.
>> +
>> +There is an alternative syntax to the expanded form for overlays with phandle
>> +targets which makes the format similar to the one using in .dtsi include files.
>> +
>> +So for the &ocp target example above one can simply write:
>> +
>> +/dts-v1/ /plugin/;
>> +&ocp {
>> +	/* bar peripheral */
>> +	bar {
>> +		compatible = "corp,bar";
>> +		... /* various properties and child nodes */
>> +	}
>> +};
>> +
>> +The resulting dtb object is identical.
> 
