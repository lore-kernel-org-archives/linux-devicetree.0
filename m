From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH for-4.11 1/2] Revert "phy: Add USB3 PHY support for
 Broadcom NSP SoC"
Date: Thu, 9 Feb 2017 19:29:43 -0500
Message-ID: <CAC3K-4r6pkRiOqoOHTd79-qy_4mQAxJ5N5oCY8mDXFeXyuVpAw@mail.gmail.com>
References: <20170208233023.31922-1-zajec5@gmail.com> <82b47a03-c41b-378b-2d7c-f263eff514a9@gmail.com>
 <1b66f9ab3a9efd1bd0817a114e5b9ec9@milecki.pl> <06b6461c-9f43-3482-352f-374490056e90@gmail.com>
 <b715c193196fb2de2b95cc3d15102e1b@milecki.pl> <b2bdc1a7-4e5c-a13e-0cda-c90759d7308c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2bdc1a7-4e5c-a13e-0cda-c90759d7308c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 9, 2017 at 2:18 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> On 02/08/2017 11:21 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 2017-02-09 00:44, Florian Fainelli wrote:
>>> On 02/08/2017 03:39 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>> On 2017-02-09 00:32, Florian Fainelli wrote:
>>>>> On 02/08/2017 03:30 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>>>>>
>>>>>> This reverts commit d7bc1a7d41bf ("phy: Add USB3 PHY support for
>>>>>> Broadcom NSP SoC") as we already have driver for this PHY (shared
>>>>>> by NS
>>>>>> and NSP). It was added in commit e5666281d9ea ("phy: bcm-ns-usb3: ne=
w
>>>>>> driver for USB 3.0 PHY on Northstar").
>>>>>>
>>>>>> Instead of adding separated driver & duplicating code we should
>>>>>> work on
>>>>>> improving existing (old) one. Thanks to work done by Broadcom we kno=
w
>>>>>> there is MDIO bus we weren't aware of & we know register names which
>>>>>> makes initialization more clear. This is very valuable info and we
>>>>>> should work on using it in existing driver afterwards.
>>>>>
>>>>> Should not we first extend the old driver to support NSP and then
>>>>> revert
>>>>> d7bc1a7d41bf ("phy: Add USB3 PHY support for Broadcom NSP SoC")?
>>>>
>>>> Sounds like a weird / dirty development method to me: adding duplicate=
d
>>>> code
>>>> first then working on cleaning it. Unless you mean drivers/staging/.
>>>
>>> There was clearly a mistake in submitting this NSP USB PHY driver, and
>>> it should have been a patch against the existing NS USB PHY driver, but
>>> it was not, okay fair enough.
>>>
>>> It's one thing to address that in the future, and it's another thing to
>>> flat out revert the driver just because you don't like the duplication.
>>>
>>> I don't like that either, and we can discuss on how to improve things
>>> (like have the maintainer review that too), but duplication is a lesser
>>> evil than not having the hardware supported at all, and even more so,
>>> purposely reverting in the name of removing that duplication, that's
>>> intentionally breaking working hardware!
>>
>> Hardware support is not excuse and I don't think it ever was in the Linu=
x.
>>
>> We don't accept badly designed drivers just because they provide new hw
>> support.
>> We have various standards (for quality, style, design, code) at kernel
>> and we
>> stick to them unless it's drivers/staging/. As you said this driver
>> shouldn't be
>> pushed in the first place.
>>
>> Dropping hardware support in kernel happens. Sometimes it's about ancien=
t
>> devices, sometimes about code quality (some forgotten staging drivers
>> used to be
>> dropped AFAIK).
>>
>> Additionally you're talking about support that was *just* added and
>> isn't used
>> by anyone in the wild world yet.
>
> Except people working on it at Broadcom, but fair enough.
>
>>
>> This hardware was missing upstream support for 4 years so 2 extra months
>> won't
>> really hurt anyone.
>>
>> I really don't see excusee or need for keeping this driver.
>>
>> If you want to (and you feel it's well designed), we can keep
>> brcm,nsp-usb3-phy.txt
>
> No it's fine, let's drop it all and replace it with whatever you and Jon
> come up with next.
>
>>
>> I vote for focusing on existing driver improvements instead of looking f=
or
>> excuses for keeping driver that shouldn't be added in the first place.
>> Jon seems to be already working on this, I'm willing to help him, I'm
>> sure we
>> can get you a proper support for the next merge window.
>
> Fair enough, I dropped Dhanajay's changes ("ARM: dts: NSP: Add USB nodes
> for Northstar Plus") from devicetree/next so you and Jon can figure out
> what is the best thing to move forward and we minimize the amount of
> incompatible DT stuff to be sorted out later on. So as far as I am
> concerned, there are no board/SoC DTS changes to be patched later on, we
> could re-apply this patch as-is, or we could have to define a new binding=
.
> --
> Florian

(previous email got caught in HTML filters)

Per the discussion with Rafal, this is acceptable

Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
