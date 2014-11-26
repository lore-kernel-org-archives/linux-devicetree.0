From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: Question about fixed regulator DT properties
Date: Wed, 26 Nov 2014 21:13:50 +0200
Message-ID: <5476266E.9040901@mentor.com>
References: <546B5EF9.3080102@mentor.com> <546CAB49.8030103@mentor.com> <20141125121749.GV7712@sirena.org.uk> <54760D6A.9080306@mentor.com> <20141126175304.GM7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126175304.GM7712-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, MarkOn 26.11.2014 19:53, Mark Brown wrote:
> On Wed, Nov 26, 2014 at 07:27:06PM +0200, Vladimir Zapolskiy wrote:
>> On 25.11.2014 14:17, Mark Brown wrote:
> 
>> b) "regulator-boot-on" does not mean that the regulator is controlled by
>> bootloader or firmware exclusively.
> 
> That's correct...
> 
>>>>> Should documentation be updated to reflect "regulator-boot-on" role that
>>>>> a regulator is re-enabled by the kernel?
> 
>>> I'm confused about this.  That's the sole purpose of the flag and as far
>>> as I can tell it's what the documentation says.
> 
>> Documentation/devicetree/bindings/regulator/regulator.txt says:
> 
>>   - regulator-boot-on: bootloader/firmware enabled regulator
> 
>> I would suggest to add Linux kernel to that list of regulator
>> controllers, if it is the intention. In its current state the
>> documentation makes an impression that "regulator-boot-on" property
>> instructs the kernel to ignore regulator setup, since it is already
>> controlled by bootloader or firmware.
> 
> No, not at all.  It's referring to the state when Linux starts.
> 

thank you for clarification, to grasp the underlying policy let me ask
for some more information.

If I want to enable a fixed regulator (not controlled by
bootloader/firmware) by Linux on boot or when fixed.ko module is bound,
shall I specify the same "regulator-boot-on" property? At least this is
the practical way to enable a fixed and/or gpio regulator right now, but
is it correct?

Or should the regulator always be enabled externally (assuming
"regulator-always-on" is omitted) after registration independently on
"regulator-boot-on" property?

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
