From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Tue, 17 Oct 2017 14:30:00 +0100
Message-ID: <CACxGe6uH0A9s+tuaS3SrUmnRfRPUsxCsGP8wT6vOd4Q3QxXc4w@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171014143457.72df1f54@windsurf.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171014143457.72df1f54-dFHcqWZE4ncJmsy6czSMtA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 14, 2017 at 1:34 PM, Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hello,
>
> On Mon, 9 Oct 2017 21:39:51 +0100, Grant Likely wrote:
>
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
> I'd like to propose a quick discussion on how to avoid duplicating DT
> description when a SoC is composed of aggregations of IP blocks that
> are duplicated (in 2, 4 or 8 copies).
>
> As an example, we currently have
> arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi and
> arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi that are almost
> identical, because they represent the same aggregation of IP blocks,
> present two times in the same SoC (Marvell Armada 8K). As we are going
> to have SoCs with more than 2 copies in the future, we want to find a
> way to avoid duplicating the description of those aggregations.
>
> I'd like to present the problem scope, a possible solution solely based
> on C preprocessor macros, and then open the discussion to see what is
> the right approach to solve this problem.

I'll include time for this alongside the overlay maintenance plan
topic. It seems to me that they are closely related problems.

g.

>
> I don't think that more than 10-15 minutes is needed for presenting the
> problem scope and one possible solution. The following discussion may
> be longer though.
>
> I'll be attending on both the morning and afternoon, but I'll be
> leaving at ~4:30 PM.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
