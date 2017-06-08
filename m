From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Wed, 7 Jun 2017 20:07:59 -0700
Message-ID: <5938BF8F.2010001@gmail.com>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
 <593657AF.8050208@gmail.com> <1496776974.3821.6.camel@seibold.net>
 <59374CE9.40406@gmail.com> <1496815399.6999.1.camel@seibold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496815399.6999.1.camel-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, jcm-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org
Cc: Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Jon.

Adding back the original distribution.

Hi Stefani,

On 06/06/17 23:03, Stefani Seibold wrote:
> Am Dienstag, den 06.06.2017, 17:46 -0700 schrieb Frank Rowand:
>> On 06/06/17 12:22, Stefani Seibold wrote:
>>> Hi Frank,
>>>
>>> On 06.06.2017, 00:20 -0700 Frank Rowand wrote::
>>>> On 06/05/17 05:59, Stefani Seibold wrote:
>>>>> From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
>>>>>
>>>>> This patch enables external references for symbols which are
>>>>> not
>>>>> exported by the current device tree. For example
>>>>>
>>>>> // RASPI example (only for testing)
>>>>> /dts-v1/;
>>>>> /plugin/;
>>>>>
>>>>> / {
>>>>>     compatible = "brcm,bcm2835", "brcm,bcm2708",
>>>>> "brcm,bcm2709";
>>>>>
>>>>>     fragment@0 {
>>>>>         target-path = "/soc/i2s@7e203000";
>>>>>         __overlay__ {
>>>>>             #address-cells = <0x00000001>;
>>>>>             #size-cells = <0x00000001>;
>>>>>             test = "test";
>>>>>             timer = <&timer>;
>>>>>         };
>>>>>     };
>>>>>
>>>>>     __external_symbols__ {
>>>>>         timer = "/soc/timer@7e003000";
>>>>>     };
>>>>> };
>>>>
>>>> My hope is that the dtc compiler will stop supporting 
>>>> specification of the __symbols__ node in dts source, and only
>>>> generate it automatically in the dtb. That change to dtc would
>>>> not allow any node name specified in a dts to begin with an
>>>> underscore.  Thus node __external_symbols__ would not be 
>>>> allowed.
>>>> 
>>> 
>>> The name is not so important to me, only the solution.
>>> 
>>>>> In case of the RASPI device tree this could be simple fixed
>>>>> by modifing the device tree source, but when the device tree
>>>>> is provided by a closed source BIOS this kind of missing
>>>>> symbol could not be fixed.
>>>> 
>>>> Is there a real example of this issue, or is this a
>>>> theoretical concern? If this is a real example, we should be
>>>> discouraging such behavior.
>>>> 
>>> 
>>> Yes, I have a BIOS on some ARM64 servers which provides broken 
>>> device tree. It also lacks some devices in this tree which needs 
>>> references to other devices which lacks a phandle.

I want to make sure I understand the use case, or cases.

My interpretation of the patch email is that there is an ARM64 server
with a device tree that is missing a single symbol in the __symbols__
node.  I could also read that email as saying that there is no
__symbols__ node in the device tree.  Which is the actual case?


>> Jon Masters is pushing a message that if the firmware on your
>> arm64 server is broken, then insist that the vendor fix it.
> 
> Well with this kind of arguments you can also sit and wait until a 
> vendor decided to provide a kernel driver for an device. As we know 
> this would in 99% percent of the cases never happened.
> 
> So that is not a solution if the vendor does not do it. Fu....
> closed source is as it is. So i need a solution and i think other
> developer to.
> 
>> I think he was talking about ACPI, but the same message should also
>> apply to device tree.

Jon, are you also interested in broken device trees?


> 
> I talk about a device tree, not ACPI!
> 
>> If you are having trouble getting your vendor to fix it, ask Jon
>> if he is willing to help apply pressure.
>> 
> 
> My vendor will not fix it. Believe me.

If you are not going to try to get your vendor to fix it (or have
already tried and failed), can you tell us the name and model of the
computer so that other people can be aware of the broken device tree?
And can you describe the specific way the device tree is broken?


> And again: We need a solution when a closed source BIOS or
> bootloader is not fixed by the vendor, which is also a case for
> devices like single board computer, settop boxes, tv, smartphones and
> tablets.

The patch does not fix the general case of a broken device tree.  It
only potentially addresses a missing symbol from the base device tree
that is needed for an overlay.  The general case is an entirely
different discussion.


> And my solution is a very tiny one, which works exactly in the same
> way as the __symbols__ node.
> 
>> 
>>>> The suggestion by Pantelis should work, but that is just a
>>>> hack to get you out of a bad situation, not a good practice.
>>>> 
>>> 
>>> I tried it, but it doesn't work. Look at my post to Pantelis.
>> 
>> Yes, I realized that the method Pantelis gave would also require a
>> code change.  I don't like that code change either.
>> 
> 
> If you have an other solution than provide it. Otherwise please
> apply the patch.

Lack of me providing another solution is not a reason to apply a
patch that I disagree with.

But here is another solution: decompile the broken device tree
and apply the fix to the decompiled tree.  This can be a bit
challenging since the original labels will be missing in the
decompiled tree (though you will be able to get them from the
__overlays__ node if that exists).

-Frank

> 
> - Stefani
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
