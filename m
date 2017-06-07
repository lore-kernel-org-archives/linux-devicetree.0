From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] external references for device tree overlays
Date: Tue, 6 Jun 2017 17:46:33 -0700
Message-ID: <59374CE9.40406@gmail.com>
References: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
 <593657AF.8050208@gmail.com> <1496776974.3821.6.camel@seibold.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496776974.3821.6.camel-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>, Stefani Seibold <stefani.seibold.ext-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Holm Rauchfuss <holm.rauchfuss-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/06/17 12:22, Stefani Seibold wrote:
> Hi Frank,
> 
> On 06.06.2017, 00:20 -0700 Frank Rowand wrote::
>> On 06/05/17 05:59, Stefani Seibold wrote:
>>> From: Stefani Seibold <stefani-mkwtCZVSLSnR7s880joybQ@public.gmane.org>
>>>
>>> This patch enables external references for symbols which are not
>>> exported by the current device tree. For example
>>>
>>> // RASPI example (only for testing)
>>> /dts-v1/;
>>> /plugin/;
>>>
>>> / {
>>>     compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";
>>>
>>>     fragment@0 {
>>>         target-path = "/soc/i2s@7e203000";
>>>         __overlay__ {
>>>             #address-cells = <0x00000001>;
>>>             #size-cells = <0x00000001>;
>>>             test = "test";
>>>             timer = <&timer>;
>>>         };
>>>     };
>>>
>>>     __external_symbols__ {
>>>         timer = "/soc/timer@7e003000";
>>>     };
>>> };
>>
>> My hope is that the dtc compiler will stop supporting specification
>> of the
>> __symbols__ node in dts source, and only generate it automatically in
>> the dtb.
>> That change to dtc would not allow any node name specified in a dts
>> to begin
>> with an underscore.  Thus node __external_symbols__ would not be
>> allowed.
>>
> 
> The name is not so important to me, only the solution.
> 
>>> In case of the RASPI device tree this could be simple fixed by
>>> modifing
>>> the device tree source, but when the device tree is provided by a
>>> closed
>>> source BIOS this kind of missing symbol could not be fixed.
>>
>> Is there a real example of this issue, or is this a theoretical
>> concern?
>> If this is a real example, we should be discouraging such behavior.
>>
> 
> Yes, I have a BIOS on some ARM64 servers which provides broken device
> tree. It also lacks some devices in this tree which needs references
> to other devices which lacks a phandle.

Jon Masters is pushing a message that if the firmware on your arm64 server
is broken, then insist that the vendor fix it.  I think he was talking
about ACPI, but the same message should also apply to device tree.

If you are having trouble getting your vendor to fix it, ask Jon if he
is willing to help apply pressure.


>> The suggestion by Pantelis should work, but that is just a hack to
>> get
>> you out of a bad situation, not a good practice.
>>
> 
> I tried it, but it doesn't work. Look at my post to Pantelis.

Yes, I realized that the method Pantelis gave would also require
a code change.  I don't like that code change either.


> 
> - Stefani
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
