From: Ian Arkver <ian.arkver.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 20/24] media: imx: Add Camera Interface subdev driver
Date: Tue, 31 Jan 2017 21:55:29 +0000
Message-ID: <2297c62c-ae9b-3942-4700-ce268a61a6d5@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-21-git-send-email-steve_longerbeam@mentor.com>
 <b7456d40-040d-41b7-45bc-ef6709ab7933@xs4all.nl>
 <20170131134252.GX27312@n2100.armlinux.org.uk>
 <b0517394-7717-3e1d-b850-e2b69a9c19e9@gmail.com>
 <20170131203340.GC27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131203340.GC27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.orgSteve Longerbeam <ste>
List-Id: devicetree@vger.kernel.org

On 31/01/17 20:33, Russell King - ARM Linux wrote:
> On Tue, Jan 31, 2017 at 10:21:26AM -0800, Steve Longerbeam wrote:
>> On 01/31/2017 05:42 AM, Russell King - ARM Linux wrote:
>>> On Fri, Jan 20, 2017 at 03:38:28PM +0100, Hans Verkuil wrote:
>>>> Should be set to something like 'platform:imx-media-camif'. v4l2-compliance
>>>> should complain about this.
>>> ... and more.
>>
>> Right, in version 3 that you are working with, no v4l2-compliance fixes were
>> in yet. A lot of the compliance errors are fixed, please look in latest
>> branch
>> imx-media-staging-md-wip at git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:slongerbeam/mediatree.git.
>
> Sorry, I'm not prepared to pull random trees from github as there's
> no easy way to see what's in the branch.
>
> I've always disliked github because its web interface makes it soo
> difficult to navigate around git trees hosted there.  You can see
> a commit, you can see a diff of the commit.  You can get a list of
> branches.  But there seems to be no way to get a list of commits
> similar to "git log" or even a one-line summary of each commit on
> a branch.  If there is, it's completely non-obvious (which I think is
> much of the problem with github, it's web interface is horrendous.)
>
> Or you can clone/pull the tree without knowing what you're fetching
> (eg, what the tree is based upon.)
>
> Or you can waste time clicking repeatedly on the "parent" commit link
> on each patch working your way back through the history...
>
> Well, it looks like it's bsaed on 4.10-rc1 with who-knows-what work
> from the linux-media tree (I didn't try and go back any further.)
> As I don't want to take a whole pile of other changes into my tree,
> I'm certainly not going to pull from your github tree.  Sorry.
>

https://github.com/slongerbeam/mediatree/compare/master...imx-media-staging-md-wip

It's under the "Compare" button from the main view. It would be nice 
though if the first commit's parent was some clearly tagged start point.

Regards,
Ian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
