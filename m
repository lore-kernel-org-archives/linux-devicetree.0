From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Mon, 16 Oct 2017 17:40:57 +0100
Message-ID: <8a168960-2dae-35cc-e610-0fe257c9121d@codethink.co.uk>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <39f87f46-da67-11d9-4336-213c13025568@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <39f87f46-da67-11d9-4336-213c13025568-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16/10/17 06:36, Michal Simek wrote:
> Hi,
> 
> On 9.10.2017 22:39, Grant Likely wrote:
>> Kernel Summit is now just over 2 weeks away and it is time to pull
>> together the schedule for the Devicetree workshop. Originally I
>> planned on just an afternoon, but I've got the room for the whole day,
>> so I've got a lot of flexibility on the schedule. Unscheduled time can
>> be used for hacking.
>>
>> Date: 26 Oct 2017
>> Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
>> Location: Athens room - Hilton Prague
>>
>> If you plan to attend, make sure you update your OSSunmitE/ELCE
>> registration to include the DT Workshop (log in to access and modify
>> your registration):
>>
>> https://www.regonline.com/register/login.aspx?eventID=1883377&MethodId=0&EventsessionId=&Email_Address=&membershipID=
>>
>> Here is my current list of topics in no particular order, including
>> the topic moderator:
>>
>> Runtime memory consumption (Rob Herring)
>> Overlay maintenance plan (TBC)
>> Stable ABI for devicetree (TBC)
>> DT YAML encoding (Pantelis Antoniou)
>> DT Schema format - option 1 (Pantelis Antoniou)
>> DT Schema format - option 2 (Grant Likely)
>> Sharing Generic bindings (TBC)
>> devicetree.org update (Grant)
>>
>> Reply to this email if you want to propose another topic.
>>
>> Reply privately if there is a particular topic you want to attend but
>> you are unable to be there in the morning or afternoon. I'll put the
>> actual agenda together a week out from the event.
> 
> I would like to talk how to add support for AArch32 based on arm64 dts file.
> 
> And next topic is discuss criteria for adding new DTS board files to
> kernel for supporting custom boards especially for arm32 which can end
> up with a lot of dts files in this folder.
> If make sense to permit only boards with something new or just enable
> reference boards to go in.

I am interested in this, as we seem to be repeating the quantity
issue with the board file of having many .dts sources in the kernel.

I'm not sure how to deal with this, on one hand only having the
reference (and possibly popular) boards is going to keep the size
down. On the other hand out of tree .dts files are going to be
difficult to find (or vanish with the vendor).

It seems we are still no closer to having a DT repository outside
the kernel.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
