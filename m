From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Tue, 17 Oct 2017 16:45:56 -0700
Message-ID: <59E69634.7020100@gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <39f87f46-da67-11d9-4336-213c13025568@monstr.eu>
 <8a168960-2dae-35cc-e610-0fe257c9121d@codethink.co.uk>
 <CAL_JsqJxFJSE-=778oHvNgpaBzhX9mBSzh1a0ZMvwSG69qStLw@mail.gmail.com>
 <CACxGe6vkxTwUw2ma_ykZQ0JsKUQTeffMC+g4pq6LnaN9qoY2_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vkxTwUw2ma_ykZQ0JsKUQTeffMC+g4pq6LnaN9qoY2_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/17/17 06:38, Grant Likely wrote:
> On Mon, Oct 16, 2017 at 8:45 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Mon, Oct 16, 2017 at 11:40 AM, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
>>> On 16/10/17 06:36, Michal Simek wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 9.10.2017 22:39, Grant Likely wrote:
>>>>>
>>>>> Kernel Summit is now just over 2 weeks away and it is time to pull
>>>>> together the schedule for the Devicetree workshop. Originally I
>>>>> planned on just an afternoon, but I've got the room for the whole day,
>>>>> so I've got a lot of flexibility on the schedule. Unscheduled time can
>>>>> be used for hacking.
>>>>>
>>>>> Date: 26 Oct 2017
>>>>> Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
>>>>> Location: Athens room - Hilton Prague
>>>>>
>>>>> If you plan to attend, make sure you update your OSSunmitE/ELCE
>>>>> registration to include the DT Workshop (log in to access and modify
>>>>> your registration):
>>>>>
>>>>>
>>>>> https://www.regonline.com/register/login.aspx?eventID=1883377&MethodId=0&EventsessionId=&Email_Address=&membershipID=
>>>>>
>>>>> Here is my current list of topics in no particular order, including
>>>>> the topic moderator:
>>>>>
>>>>> Runtime memory consumption (Rob Herring)
>>>>> Overlay maintenance plan (TBC)
>>>>> Stable ABI for devicetree (TBC)
>>>>> DT YAML encoding (Pantelis Antoniou)
>>>>> DT Schema format - option 1 (Pantelis Antoniou)
>>>>> DT Schema format - option 2 (Grant Likely)
>>>>> Sharing Generic bindings (TBC)
>>>>> devicetree.org update (Grant)
>>>>>
>>>>> Reply to this email if you want to propose another topic.
>>>>>
>>>>> Reply privately if there is a particular topic you want to attend but
>>>>> you are unable to be there in the morning or afternoon. I'll put the
>>>>> actual agenda together a week out from the event.
>>>>
>>>>
>>>> I would like to talk how to add support for AArch32 based on arm64 dts
>>>> file.
>>>>
>>>> And next topic is discuss criteria for adding new DTS board files to
>>>> kernel for supporting custom boards especially for arm32 which can end
>>>> up with a lot of dts files in this folder.
>>>> If make sense to permit only boards with something new or just enable
>>>> reference boards to go in.
>>>
>>>
>>> I am interested in this, as we seem to be repeating the quantity
>>> issue with the board file of having many .dts sources in the kernel.
>>
>> The problem was not so much having board files in the kernel. It was
>> how to scale support for boards and SoCs with each family structuring
>> things their own, different way.
>>
>> IIRC, the ARM tree was at ~400 boards at the start of DT conversion.
>> Now we're at ~1100 boards for arm/arm64. Plus we still have 264 that
>> aren't converted to DT.
>>
>>> I'm not sure how to deal with this, on one hand only having the
>>> reference (and possibly popular) boards is going to keep the size
>>> down. On the other hand out of tree .dts files are going to be
>>> difficult to find (or vanish with the vendor).
>>
>> Why do we care? What problem is that causing?
> 
> In fact, for many platforms that would be a good place to get to if
> the firmware is providing the .dtb. Plus the DT data formats are so
> simple that it is not difficult to get a DTB back into a DTS.

No, it _is_ difficult to convert a DTB to a useful DTS.

The DTB might not be easily extracted from a vendor provided
boot image.

You do not get a full DTS back from a decompiled DTB.  Phandle
references are integers instead of strings.  Labels are missing.


>>
>>> It seems we are still no closer to having a DT repository outside
>>> the kernel.
>>
>> In relationship to the above what problem would that solve? We've got
>> all the platform maintainers and arm-soc maintainers to handle dts
>> files. Mark and myself along with subsystem maintainers reviewing and
>> applying device bindings. If you move all that to a separate
>> repository, then you have me because no one else has volunteered. I'm
>> pretty sure no one wants me as the single point of failure.
> 


> Yes. When it comes to the bindings, and schema files when we have
> them, they should be maintained with the tools.

Totally disagree.  I'm sure we'll have the same discussion we have had
at various ELC and ELCE events, where a handful of people want to move
the DTS files out of the kernel source tree, and the vast majority of
the room is opposed to that.


> 
> g.
> .
> 
