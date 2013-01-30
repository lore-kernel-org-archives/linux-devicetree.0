From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Wed, 30 Jan 2013 13:33:35 -0600
Message-ID: <CAKGA1bmQCSHxy=hLh9XYkt9vSzdO=vO9XGhJX1cZFBSL=jZHvw@mail.gmail.com>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <5107D253.5030400@ti.com> <20130129135336.GA3323@pengutronix.de>
 <5107D84F.80401@ti.com> <20130129143302.GF2046@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130129143302.GF2046-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: kishon <kishon-l0cyMroinI0@public.gmane.org>, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linux ARM Kernel ML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2013 at 8:33 AM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Tue, Jan 29, 2013 at 07:40:23PM +0530, kishon wrote:
>> On Tuesday 29 January 2013 07:23 PM, Wolfram Sang wrote:
>> >>>+  err = of_property_read_string(np, "phy_type", &phy_type);
>> >>>+  if (err < 0)
>> >>>+          return USBPHY_INTERFACE_MODE_NA;
>> >>
>> >>Why don't we use a u32 property type for the *phy-type*? IMHO we
>> >>should use string property only when the property should be
>> >>absolutely unambiguous (e.g., compatible property should be string).
>> >
>> >If we would use u32-numbers in the compatible entry, this would also be
>> >unambiguous, no? 0xd00dfeed would be the at24-driver. Pretty specific.
>>
>> hehe... But we don't have a corresponding *enum* representing the
>> drivers :-)
>> >
>> >I don't mind having readable devicetrees. And we have it for ethernet
>> >phys already with strings, so it would be consistent.
>>
>> Ok. Fine with it then :-)
>
> I prefer u32 here, because we have the matching enum. Otherwise we end
> up with:
>
> of_property_read_string(...,&type);
>
> if (!strcmp(type, "ulpi"))
>         foo();
> else if (!strcmp(type, "utmi"))
>         bar();
> else if (!strcmp(type, "pipe3"))
>         baz();
> else
>         BUG();
>
> and I don't like that, it's ugly and error prone. Also looks awful when
> someone needs to change that, the diff looks messy. A u32 followed by a
> switch statement looks nicer.

I wholeheartedly and vehemently disagree.

Device trees don't exist to make Linux look prettier, *OR* clean up
your source code of string comparisons when you think comparing an
integer looks or feels cleaner. They exist to provide a hardware
description. phy-type 0x3 does not describe anything except that you
have to go look up what 0x3 means, and means device trees cannot be
internally consistent within themselves or publically existing
documentation (it is certain that there is no USB PHY specification
that defines 0x3 as anything, which means the value is entirely Linux
specific).

Matching an enum or magic number encoded into a u32 in some external
source code to define a type that wasn't just an index is not
something that anyone has ever reasonably done in any traditional
IEEE1275 device tree or OpenFirmware-committee binding, and we
shouldn't just be subverting the existing standard to make Linux code
"look prettier".

Please consider other operating systems, which would need to copy the
definition of the enum which may not be possible when thinking of
Linux vs. FreeBSD or so, and in general the readability of the device
tree - phy-type 0x3 is going to require a comment in the device tree
source to remind people what that means, or a cross-reference to a
binding which is more work than most developers want to do to make
sure they specified the correct PHY type. A string is completely and
unavoidably correct - a typo in the phy-type means a match against
valid bindings is impossible and an instant bug. A mistaken u32 value
means the wrong phy-type is defined which has increased potential to
provide misconfigured phy with the wrong type and less warning than a
string literal not being absolutely identical. I think that means more
buggy device trees will get past where it doesn't actually work
properly, and more time will be spent working out WHY it doesn't
actually work properly.

It is much better to be totally unambiguous in the device tree as per
the type and a string is the best way. If you really want effective,
less error-prone code, define all the existing or useful types as
preprocessor defines (#define PHY_TYPE_UTMI_WIDE "utmiw") and use
those to match the binding. I wouldn't hand-code a property string
inline even if you offered me a million dollars to do so. Matching the
dr_mode property is already done in a drivers/of or of_phy.h include
so just move the potential match code to there and return the correct
enum (which is arguably Linux-specific) from the string and give a big
fat error from the match function if none of the valid bindings
matches up.

BTW I disagree with the use of underscores in device trees as well, I
wouldn't use an underscore for a new property. But in the case of
dr_mode it is well used already especially for Freescale controllers
on PPC where there are a significant handful of DTS (or real OF) that
implement it. It might not be a bad idea, though, to update the
binding deprecating dr_mode in favor of something that is much less
ambiguous and descriptive itself - "dr-mode" is an acceptable fix but
a "role" property or "dual-role-mode" is much more descriptive. Moving
the matching to some common code since more than one controller uses
it and then adding a new, better property name with dr_mode as an
acceptable but unrecommended fallback means this can be left to
history.

--
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Product Development Analyst, Genesi USA, Inc.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
