From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Tue, 17 Oct 2017 09:21:53 -0400
Message-ID: <20171017132153.GH12015@bill-the-cat>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171017114823.58476908@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 11:48:23AM +0200, Boris Brezillon wrote:
> Hello Grant,
> 
> On Mon, 9 Oct 2017 21:39:51 +0100
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> > Kernel Summit is now just over 2 weeks away and it is time to pull
> > together the schedule for the Devicetree workshop. Originally I
> > planned on just an afternoon, but I've got the room for the whole day,
> > so I've got a lot of flexibility on the schedule. Unscheduled time can
> > be used for hacking.
> > 
> > Date: 26 Oct 2017
> > Time: 9:00am-5:30pm (Lunch from 12:30-2:30)
> > Location: Athens room - Hilton Prague
> > 
> > If you plan to attend, make sure you update your OSSunmitE/ELCE
> > registration to include the DT Workshop (log in to access and modify
> > your registration):
> > 
> > https://www.regonline.com/register/login.aspx?eventID=1883377&MethodId=0&EventsessionId=&Email_Address=&membershipID=
> > 
> > Here is my current list of topics in no particular order, including
> > the topic moderator:
> > 
> > Runtime memory consumption (Rob Herring)
> > Overlay maintenance plan (TBC)
> > Stable ABI for devicetree (TBC)
> > DT YAML encoding (Pantelis Antoniou)
> > DT Schema format - option 1 (Pantelis Antoniou)
> > DT Schema format - option 2 (Grant Likely)
> > Sharing Generic bindings (TBC)
> > devicetree.org update (Grant)
> > 
> > Reply to this email if you want to propose another topic.
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

I really hope (and have tried pushing via some other channels) that
given Android's embrace of devicetree for Android 8 they will have
people present as there's going to be issues like the above cropping up
now.

-- 
Tom
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
