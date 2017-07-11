From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] of: overlay: add overlay unittest data for node
 names and symbols
Date: Mon, 10 Jul 2017 21:52:25 -0700
Message-ID: <59645989.5050502@gmail.com>
References: <1499713523-19184-1-git-send-email-frowand.list@gmail.com>
 <1499713523-19184-2-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+dq0nngUePGvuyELmtexJyUMaTpnN1D8uEBbSPjphVyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+dq0nngUePGvuyELmtexJyUMaTpnN1D8uEBbSPjphVyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/10/17 19:31, Rob Herring wrote:
> On Mon, Jul 10, 2017 at 2:05 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Add nodes and properties to overlay_base and overlay dts files to
>> test for
>>    - incorrect existing node name detection when overlay node name
>>      has a unit-address
>>    - adding overlay __symbols__ properties to live tree when an
>>      overlay is added to the live tree
>>
>> Expected result from patch 2/3 is overlay will update the nodes and
>> properties for /testcase-data-2/fairway-1/ride@100/
>>
>> Before patch 2/3 is applied:
> 
> This is good information, but what is patch 2/3 is less clear when
> this is committed.

Yes, but that is the best way I've figured out to convey the information.
I'm expecting the three patches to be three consecutive commits in the
history.  I'd love to have a way to specify what the commit id of
patch 3 will be in the patch 1 commit message.  Given the way that
I think git works, I don't think there is any way the git wizards
will be able to add that feature.  Maybe it would be clearer to
reference the short description of patch 2 and patch 3 instead.


> And 1 and 2 are probably stable material? I'd just
> note in this patch what the failures are and show before and after
> results in the patch that changes them.

I consider overlays to be a not yet functional feature, that
still needs a some more code before being usable. In that case,
I don't think it is worth marking the patches for stable.


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
> 
> [...]
> 
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index 6e00a9c69e58..dae2fe23cd2e 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -1,11 +1,13 @@
>>  obj-y += testcases.dtb.o
>>  obj-y += overlay.dtb.o
>>  obj-y += overlay_bad_phandle.dtb.o
>> +obj-y += overlay_bad_symbol.dtb.o
>>  obj-y += overlay_base.dtb.o
> 
> There's no reason for these all to be 1 per line.

OK.  Do you prefer something like:

   obj-y += testcases.dtb.o overlay.dtb.o overlay_bad_phandle.dtb.o \
            overlay_bad_symbol.dtb.o overlay_base.dtb.o

My preference is to keep the objects in alphabetic order.  That might
argue for something easier to read and update, like:

   obj-y += testcases.dtb.o \
            overlay.dtb.o \
            overlay_bad_phandle.dtb.o \
            overlay_bad_symbol.dtb.o \
            overlay_base.dtb.o


> Also, should the
> overlay dtb's be conditioned on CONFIG_OF_OVERLAY (or whatever we call
> it)?

I think so.  I'll verify that it doesn't break anything (and if so fix
the breakage).


> 
> But this is fine. That can all be a followup patch.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
