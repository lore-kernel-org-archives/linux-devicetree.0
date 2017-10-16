From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Mon, 16 Oct 2017 07:36:08 +0200
Message-ID: <39f87f46-da67-11d9-4336-213c13025568@monstr.eu>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 9.10.2017 22:39, Grant Likely wrote:
> Kernel Summit is now just over 2 weeks away and it is time to pull
> together the schedule for the Devicetree workshop. Originally I
> planned on just an afternoon, but I've got the room for the whole day,
> so I've got a lot of flexibility on the schedule. Unscheduled time can
> be used for hacking.
> 
> Date: 26 Oct 2017
> Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
> Location: Athens room - Hilton Prague
> 
> If you plan to attend, make sure you update your OSSunmitE/ELCE
> registration to include the DT Workshop (log in to access and modify
> your registration):
> 
> https://www.regonline.com/register/login.aspx?eventID=1883377&MethodId=0&EventsessionId=&Email_Address=&membershipID=
> 
> Here is my current list of topics in no particular order, including
> the topic moderator:
> 
> Runtime memory consumption (Rob Herring)
> Overlay maintenance plan (TBC)
> Stable ABI for devicetree (TBC)
> DT YAML encoding (Pantelis Antoniou)
> DT Schema format - option 1 (Pantelis Antoniou)
> DT Schema format - option 2 (Grant Likely)
> Sharing Generic bindings (TBC)
> devicetree.org update (Grant)
> 
> Reply to this email if you want to propose another topic.
> 
> Reply privately if there is a particular topic you want to attend but
> you are unable to be there in the morning or afternoon. I'll put the
> actual agenda together a week out from the event.

I would like to talk how to add support for AArch32 based on arm64 dts file.

And next topic is discuss criteria for adding new DTS board files to
kernel for supporting custom boards especially for arm32 which can end
up with a lot of dts files in this folder.
If make sense to permit only boards with something new or just enable
reference boards to go in.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
