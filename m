From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Wed, 18 Oct 2017 15:28:57 +0100
Message-ID: <00068711-a9b8-e879-8212-b7eb4141e4b7@arm.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <39f87f46-da67-11d9-4336-213c13025568@monstr.eu>
 <CABGGiswXP800Pshc8jpVv3N4O-u2hFHJs-Ut_xVe8xV9ixcJSw@mail.gmail.com>
 <52c0aa5e-4995-9c0e-babb-60ec84a3deff@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52c0aa5e-4995-9c0e-babb-60ec84a3deff-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 18/10/17 15:04, Michal Simek wrote:
> On 16.10.2017 16:11, Rob Herring wrote:
>> On Mon, Oct 16, 2017 at 12:36 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
>>> Hi,
>>>
>>> On 9.10.2017 22:39, Grant Likely wrote:
>>>> Kernel Summit is now just over 2 weeks away and it is time to pull
>>>> together the schedule for the Devicetree workshop. Originally I
>>>> planned on just an afternoon, but I've got the room for the whole day,
>>>> so I've got a lot of flexibility on the schedule. Unscheduled time can
>>>> be used for hacking.
>>>>
>>>> Date: 26 Oct 2017
>>>> Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
>>>> Location: Athens room - Hilton Prague
>>>>
>>>> If you plan to attend, make sure you update your OSSunmitE/ELCE
>>>> registration to include the DT Workshop (log in to access and modify
>>>> your registration):
>>>>
>>>> https://www.regonline.com/register/login.aspx?eventID=1883377&MethodId=0&EventsessionId=&Email_Address=&membershipID=
>>>>
>>>> Here is my current list of topics in no particular order, including
>>>> the topic moderator:
>>>>
>>>> Runtime memory consumption (Rob Herring)
>>>> Overlay maintenance plan (TBC)
>>>> Stable ABI for devicetree (TBC)
>>>> DT YAML encoding (Pantelis Antoniou)
>>>> DT Schema format - option 1 (Pantelis Antoniou)
>>>> DT Schema format - option 2 (Grant Likely)
>>>> Sharing Generic bindings (TBC)
>>>> devicetree.org update (Grant)
>>>>
>>>> Reply to this email if you want to propose another topic.
>>>>
>>>> Reply privately if there is a particular topic you want to attend but
>>>> you are unable to be there in the morning or afternoon. I'll put the
>>>> actual agenda together a week out from the event.
>>>
>>> I would like to talk how to add support for AArch32 based on arm64 dts file.
>>
>> We already have that for RPi3, but it's a bit hacky in that you have
>> to include files from one arch to the other. What I'd like to see
>> ideally is no dependency on $ARCH to build dts files. You can't build
>> dts files for an arch without a cross-compiler installed which is an
>> artificial dependency. The dtb should be independent of whether you're
>> building for 32 or 64 bit.
> 
> I wasn't aware about RPI3 but yes - I have seen the same for ZynqMP.
> 
>>
>> There's the other aspect of being able to do armv8 32-bit builds as
>> there's no explicit support for v8 in arch/arm/. But that's not a DT
>> issue.
> 
> Yep including Kconfig.platforms is required.
> 
>>
>>> And next topic is discuss criteria for adding new DTS board files to
>>> kernel for supporting custom boards especially for arm32 which can end
>>> up with a lot of dts files in this folder.
>>
>> We really should move the arm32 files into subdirs for each SoC vendor
>> IMO, but I think armsoc maintainers have been against that churn.
> 
> As you said above maybe we should consider to move all DTS files out of
> arch folder and sorted them based on SoC vendor. It sounds like a good
> topic to discuss.
> 
> 
>>> If make sense to permit only boards with something new or just enable
>>> reference boards to go in.
>>
>> The board dts files are generally pretty minimal. What's the issue
>> here? Just lots of files in arch/arm/boot/dts?
> 
> yep. A lot of files there.

I was wondering whether we should really stop providing .dts files for
*boards* in the *kernel* tree. In my impression this was more a stop-gap
measure to bridge the transition from board files to DT.

Given that the particular board files are rather boring anyway, wouldn't
it be sufficient to just include the SoC .dtsi plus one (or two) example
.dts, for instance for the official evaluation board?
This could be used as a template for creating specific board DTs.
Ideally vendors could put those on their boards: into some flash or
integrated into the firmware (as part of U-Boot, for instance).

And having a source for the .dtsi should make it easier to get a
readable de-compilation of a given .dtb.

We could collect .dts files for boards somewhere else. It's already the
case that we have some boards with a specific SoC "supported by the
kernel" and some not, for no technical reason at all, actually. It's
just whether there is someone willing to post (and push through) a .dts
file.

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
