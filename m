From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 08/13] media: am437x-vpfe: Maintain a reference to the
 current vpfe_fmt
Date: Fri, 13 Sep 2019 08:43:17 -0500
Message-ID: <20190913134317.afnflvebna3xv35o@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
 <20190909162743.30114-9-bparrot@ti.com>
 <8b3d5c23-6784-fb1c-5e14-f3759b10aa0b@xs4all.nl>
 <20190913133245.6rvajfhlghbocuf4@ti.com>
 <693c483f-5342-ab0a-7023-222f06bd011e@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <693c483f-5342-ab0a-7023-222f06bd011e@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:34:28 +0200]:
> On 9/13/19 3:32 PM, Benoit Parrot wrote:
> > Hans Verkuil <hverkuil@xs4all.nl> wrote on Fri [2019-Sep-13 15:14:45 +0200]:
> >> On 9/9/19 6:27 PM, Benoit Parrot wrote:
> >>> Keep a reference to the currently selected struct vpfe_fmt * object.
> >>> By doing so we rename the current struct v4l2_format * member from
> >>> fmt to v_fmt.
> >>> The added struct vpfe_fmt * reference is set to "const" so we also
> >>> constify all accesses and related helper functions.
> >>
> >> This explains what you do, but not why you do it.
> > 
> > Hmm ok I'll rework this a bit.
> > 
> >>
> >> And I think fmt vs v_fmt is *very* confusing naming.
> > 
> > Well in this case v_fmt stands for "v4l2_fmt" and depending on the function
> > I was using fmt to either mean a vpfe_fmt pointer or a v4l2_format pointer
> > so tried (and apparently failed) to make it clearer which was which.
> 
> Well, v_fmt could refer to either v4l2_format or vpfe_fmt, so that prefix
> doesn't help me :-)
> 
> Since 'fmt' was already defined in struct vpfe_device as v4l2_format, I'd
> just keep that rather than causing code churn by changing it. And come up
> with a better name for when you refer to a vpfe_fmt struct.

Fair enough.

> 
> Regards,
> 
> 	Hans
> 
> > 
> >>
> >> I'd keep fmt as-is, and come up with a different name for the vpfe_fmt
> >> pointer. ref_vpfe_fmt?
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
