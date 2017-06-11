From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Sun, 11 Jun 2017 16:14:09 -0700
Message-ID: <593DCEC1.3030800@gmail.com>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
 <593657AF.8050208@gmail.com> <1496776974.3821.6.camel@seibold.net>
 <59374CE9.40406@gmail.com> <1496815399.6999.1.camel@seibold.net>
 <5938BF8F.2010001@gmail.com> <1496905725.7999.5.camel@seibold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496905725.7999.5.camel-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, jcm-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org
Cc: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/08/17 00:08, Stefani Seibold wrote:
> Hi Frank,
> 
> 
> On Wed, 2017-06-07 at 20:07 -0700, Frank Rowand wrote:
>> Adding Jon.
>>
>> Adding back the original distribution.
>>
>> Hi Stefani,
>>
>> On 06/06/17 23:03, Stefani Seibold wrote:
>>> Am Dienstag, den 06.06.2017, 17:46 -0700 schrieb Frank Rowand:
>>>> On 06/06/17 12:22, Stefani Seibold wrote:
>>>>> Hi Frank,
>>>>>
>>>>> On 06.06.2017, 00:20 -0700 Frank Rowand wrote::
>>>>>> On 06/05/17 05:59, Stefani Seibold wrote:
>>>>>>> From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
>>>>>>>
>>>>>>> This patch enables external references for symbols which
>>>>>>> are
>>>>>>> not
>>>>>>> exported by the current device tree. For example
>>>>>>>
>>>>>>> // RASPI example (only for testing)
>>>>>>> /dts-v1/;
>>>>>>> /plugin/;
>>>>>>>
>>>>>>> / {
>>>>>>>     compatible = "brcm,bcm2835", "brcm,bcm2708",
>>>>>>> "brcm,bcm2709";
>>>>>>>
>>>>>>>     fragment@0 {
>>>>>>>         target-path = "/soc/i2s@7e203000";
>>>>>>>         __overlay__ {
>>>>>>>             #address-cells = <0x00000001>;
>>>>>>>             #size-cells = <0x00000001>;
>>>>>>>             test = "test";
>>>>>>>             timer = <&timer>;
>>>>>>>         };
>>>>>>>     };
>>>>>>>
>>>>>>>     __external_symbols__ {
>>>>>>>         timer = "/soc/timer@7e003000";
>>>>>>>     };
>>>>>>> };
>>>>>>
>>>>>> My hope is that the dtc compiler will stop supporting 
>>>>>> specification of the __symbols__ node in dts source, and only
>>>>>> generate it automatically in the dtb. That change to dtc
>>>>>> would
>>>>>> not allow any node name specified in a dts to begin with an
>>>>>> underscore.  Thus node __external_symbols__ would not be 
>>>>>> allowed.
>>>>>>
>>>>>
>>>>> The name is not so important to me, only the solution.
>>>>>
>>>>>>> In case of the RASPI device tree this could be simple fixed
>>>>>>> by modifing the device tree source, but when the device
>>>>>>> tree
>>>>>>> is provided by a closed source BIOS this kind of missing
>>>>>>> symbol could not be fixed.
>>>>>>
>>>>>> Is there a real example of this issue, or is this a
>>>>>> theoretical concern? If this is a real example, we should be
>>>>>> discouraging such behavior.
>>>>>>
>>>>>
>>>>> Yes, I have a BIOS on some ARM64 servers which provides broken 
>>>>> device tree. It also lacks some devices in this tree which
>>>>> needs 
>>>>> references to other devices which lacks a phandle.
>>
>> I want to make sure I understand the use case, or cases.
>>
>> My interpretation of the patch email is that there is an ARM64 server
>> with a device tree that is missing a single symbol in the __symbols__
>> node.  I could also read that email as saying that there is no
>> __symbols__ node in the device tree.  Which is the actual case?
>>
>>
>>>> Jon Masters is pushing a message that if the firmware on your
>>>> arm64 server is broken, then insist that the vendor fix it.
>>>
>>> Well with this kind of arguments you can also sit and wait until a 
>>> vendor decided to provide a kernel driver for an device. As we
>>> know 
>>> this would in 99% percent of the cases never happened.
>>>
>>> So that is not a solution if the vendor does not do it. Fu....
>>> closed source is as it is. So i need a solution and i think other
>>> developer to.
>>>
>>>> I think he was talking about ACPI, but the same message should
>>>> also
>>>> apply to device tree.
>>
>> Jon, are you also interested in broken device trees?
>>
>>
>>>
>>> I talk about a device tree, not ACPI!
>>>
>>>> If you are having trouble getting your vendor to fix it, ask Jon
>>>> if he is willing to help apply pressure.
>>>>
>>>
>>> My vendor will not fix it. Believe me.
>>
>> If you are not going to try to get your vendor to fix it (or have
>> already tried and failed), can you tell us the name and model of the
>> computer so that other people can be aware of the broken device tree?
> 
> Due an NDA i am not allowed to give you this kind of information.
> 
>> And can you describe the specific way the device tree is broken?
>>
>>
> 
> In this case the device tree is broken due a missing device node which
> must refer to the network interface(s) and interrupt controller.
> 
> Since there is no symbols for the network interfaces and there are also
> missing a phandle, this information must be generated on the fly.
> 
> And that is what my patch do: provide an path to the node (symbol) and
> generate the phandle on the fly.
> 
>>> And again: We need a solution when a closed source BIOS or
>>> bootloader is not fixed by the vendor, which is also a case for
>>> devices like single board computer, settop boxes, tv, smartphones
>>> and
>>> tablets.
>>
>> The patch does not fix the general case of a broken device tree.  It
>> only potentially addresses a missing symbol from the base device tree
>> that is needed for an overlay.  The general case is an entirely
>> different discussion.
>>
> 
> IMHO i think this is the last puzzle piece for an general solution. All
> other things are there: Overlays and Symbols.
> 
> With this patch i can overwrite and modify any part of a device tree.
> 
> But here is another solution: decompile the broken device tree
>> and apply the fix to the decompiled tree.  This can be a bit
>> challenging since the original labels will be missing in the
>> decompiled tree (though you will be able to get them from the
>> __overlays__ node if that exists).
>>
> 
> You are wrong. This will not work as a general solution due some
> important information are provided by the BIOS, like the MAC addresses
> and the memory layout and the NUMA nodes and the IDs for RoCE and so
> one. 
> 
> In this case i need to decompile a lot of machines and patch them. And
> every time the memory is changed i must do this again. Thats is not
> feasible solution and very error prone.

I am guessing that every one of you machines uses the same device tree
and that the bootloader modifies the per machine information, such
as MAC addresses.  Why can't you just replace the bad device tree
with a good device tree?


>> Lack of me providing another solution is not a reason to apply a
>> patch that I disagree with.
> 
> The patch works exact the same way as the current __symbols__ node. It
> is very tiny and easy to review and has absolut no side effects.
> 
> If you have no technical objections you should apply it until you have
> a better solution.

My first reply provided a technical reason.  A leading underscore in a
node name is not valid device tree syntax.  It is currently allowed to
handle hand coded overlays, but patches have been submitted to the
device tree compiler to remove this temporary hack.  Hand coded
overlay nodes are overly complex and more likely to contain errors
than an auto-generated node.  If hand coded overlay nodes were
allowed then additional error checking would need to be added to
the kernel.

Assuming the compiler patches are accepted (which I believe is the
correct direction) the proposed special node name of __external_symbols__
will result in a compile error.

-Frank

> 
> - Stefani
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
