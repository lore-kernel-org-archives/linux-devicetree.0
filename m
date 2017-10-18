From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Wed, 18 Oct 2017 18:35:24 +0800
Message-ID: <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017114823.58476908@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Tue, Oct 17, 2017 at 5:48 PM, Boris Brezillon
<boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hello Grant,
>
> On Mon, 9 Oct 2017 21:39:51 +0100
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>
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
>
> Not sure yet if I'll attend the DT workshop or not, but I thought I
> could ask my question here because it might be of interest to someone
> else who is attending.
>
> What happens when the DT bindings is not documented in Linux but in an
> another project because this project was the first to use it.
>
> I had the case here http://patchwork.ozlabs.org/patch/810275/, and I'm
> not sure what's the policy when this happens. Should we add a file
> under Documentation/devicetree/bindings/... that points to the external
> doc file, should we duplicate the DT bindings doc in Linux, or should
> we just leave the bindings undocumented in the kernel tree?

I'd like to add something on the topic of non-Linux projects. In this
case it's diverging DT bindings from U-boot:

https://patchwork.ozlabs.org/patch/823158/

U-boot already has a set of devicetree binding additions:
https://github.com/u-boot/u-boot/tree/master/doc/device-tree-bindings

The patch in question wants to ab(use) the regulator-name property for
driver instance binding. In my opinion this is not going to fly, as
boards are free to define the names. This either sees no use other than
as a dirty workaround for dts files that aren't following the PMIC
regulator bindings (regulator node names should follow well defined,
identifying names), or results in divergence of the DT files.

So far I've been unable to dissuade the author. Unfortunately I won't
be attending the workshop, as I had planned on some sightseeing and
the workshop is already full right now. Hope this gets discussed in
some manner.

Regards
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
