From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] of/fdt: only store the device node basename in
 full_name
Date: Wed, 18 Oct 2017 14:40:17 -0700
Message-ID: <59E7CA41.5060802@gmail.com>
References: <20170821151651.25096-1-robh@kernel.org>
 <20170821151651.25096-6-robh@kernel.org>
 <CANk1AXTLT9gB_f0GZLODpppjkxqDAp1x1RZmQ8O1i+UHckimxw@mail.gmail.com>
 <CABGGisxU2OPZz-rrWYZYgCQ0iGM9w5vL9Ob9BTHALFN8JyxeJQ@mail.gmail.com>
 <59E69786.2030406@gmail.com>
 <CANk1AXStoiNtJfU0iNug1wKASurqH6OrNoaN=UtSh6xxSB088Q@mail.gmail.com>
 <CAL_JsqKR3Jg+tgZr4xGPtcWnZW7ng741YjuyUFaS2SXKXbxGtg@mail.gmail.com>
 <1508341985.25643.12.camel@hp800z>
 <CANk1AXS1f_z4jWmBhioccBdNgiA6eQPK4YAG=zLH0EUST9XF8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXS1f_z4jWmBhioccBdNgiA6eQPK4YAG=zLH0EUST9XF8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, David Laight <David.Laight-JxhZ9S5GRejQT0dZR+AlfA@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yves Vandervennet <yves.vandervennet-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/18/17 11:39, Alan Tull wrote:
> On Wed, Oct 18, 2017 at 10:53 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On Wed, 2017-10-18 at 10:44 -0500, Rob Herring wrote:
>>> On Wed, Oct 18, 2017 at 10:12 AM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>> On Tue, Oct 17, 2017 at 6:51 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> On 10/17/17 14:46, Rob Herring wrote:
>>>>>> On Tue, Oct 17, 2017 at 4:32 PM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>>>> On Mon, Aug 21, 2017 at 10:16 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>>>>>
>>>>>>> Hi Rob,
>>>>>>>
>>>>>>>> With dependencies on a statically allocated full path name converted to
>>>>>>>> use %pOF format specifier, we can store just the basename of node, and
>>>>>>>> the unflattening of the FDT can be simplified.
>>>>>>>>
>>>>>>>> This commit will affect the remaining users of full_name. After
>>>>>>>> analyzing these users, the remaining cases should only change some print
>>>>>>>> messages. The main users of full_name are providing a name for struct
>>>>>>>> resource. The resource names shouldn't be important other than providing
>>>>>>>> /proc/iomem names.
>>>>>>>>
>>>>>>>> We no longer distinguish between pre and post 0x10 dtb formats as either
>>>>>>>> a full path or basename will work. However, less than 0x10 formats have
>>>>>>>> been broken since the conversion to use libfdt (and no one has cared).
>>>>>>>> The conversion of the unflattening code to be non-recursive also broke
>>>>>>>> pre 0x10 formats as the populate_node function would return 0 in that
>>>>>>>> case.
>>>>>>>>
>>>>>>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>>>>> ---
>>>>>>>> v2:
>>>>>>>> - rebase to linux-next
>>>>>>>>
>>>>>>>>  drivers/of/fdt.c | 69 +++++++++-----------------------------------------------
>>>>>>>>  1 file changed, 11 insertions(+), 58 deletions(-)
>>>>>>>
>>>>>>> I've just updated to the latest next branch and am finding problems
>>>>>>> applying overlays.   Reverting this commit alleviates things.  The
>>>>>>> errors I get are:
>>>>>>>
>>>>>>> [   88.498704] OF: overlay: Failed to apply prop @/__symbols__/clk_0
>>>>>>> [   88.513447] OF: overlay: apply failed '/__symbols__'
>>>>>>> [   88.518423] create_overlay: Failed to create overlay (err=-12)
>>>>>>
>>>>>> Frank's series with overlay updates should fix this.
>>>>>
>>>>> Yes, it does:
>>>>>
>>>>>   [PATCH v3 11/12] of: overlay: remove a dependency on device node full_name
>>>>
>>>> Thanks for the fast response.  I fetched the dt/next branch to test
>>>> this but there are sufficient changes that Pantelis' "OF: DT-Overlay
>>>> configfs interface (v7)" is broken now.  I've been adding that
>>>> downstream since 4.4.  We're using it as an interface for applying
>>>> overlays to program FPGAs.  If we fix it again, is there any chance
>>>> that can go upstream now?
>>>
>>> With a drive-by posting once every few years, no.
>>>
>> I take offense to that. There's nothing changed in the patch for years.
>> Reposting the same patch without changes would achieve nothing.
>>
>>> The issue remains that the kernel is not really setup to deal with any
>>> random property or node to be changed at any point in run-time.
> 
> Yeah, I'm not super surprised :)  I have some whitelist ideas below.
> 
>>> I
>>> think there needs to be some restrictions around what the overlays can
>>> touch. We can't have it be wide open and then lock things down later
>>> and break users. One example of what you could do is you can only add
>>> sub-trees to whitelisted nodes. That's probably acceptable for your
>>> usecase.
> 
> I can take a look at making OF_OVERLAY_PRE_APPLY and
> OF_OVERLAY_PRE_REMOVE notifiers mandatory if that's interesting.  The
> behavior would be: If an overlay is applied, there's got to be some
> handler in the kernel that verifies that it is acceptable.   In my
> case, the handler for FPGA regions would look at the overlay and see
> it only added stuff under a FPGA region.
> 
> And we would change the default to be: if there is no handler, reject
> the overlay.

I think the responsibility belongs to the device tree core code.  It
should be centralized and consistent.

In the fpga case, I think the connector paradigm should be adequate.
The connector describes what is available to the fpga and provides
access to those things.  The fpga overlay does not reach outside
the connector to touch anything else in the device tree.


>> Defining what can and what cannot be changed is not as trivial as a
>> list of white-listed nodes.
>>
>> In some cases there is a whole node hierarchy being inserted (like in
>> a FPGA).
> 
> For FPGA, the insertion points are always FPGA regions.
> 
>> In others, it's merely changing a status property to "okay" and
>> a few device parameters.
>>
>> The real issue is that the kernel has no way to verify that a given
>> device tree, either at boot time or at overlay application time, is
>> correct.
>>
>> When the tree is wrong at boot-time you'll hang (if you're lucky).
>> If the tree is wrong at run-time you'll get some into some unidentified
>> funky state.
>>
>> Finally what is, and what is not 'correct' is not for the kernel to
>> decide arbitrarily, it's a matter of policy, different for each
>> use-case.
>>
>>> Rob
>>
>> Regards
>>
>> -- Pantelis
> 
> Alan Tull
> 
>>
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
