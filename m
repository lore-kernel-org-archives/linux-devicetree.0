From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] DT binding documents using text markup
Date: Tue, 8 Sep 2015 10:28:29 -0400
Message-ID: <20150908142829.GH17267@beef>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+qCJfLYxVfyQ4gAxPWLZ2=WNa0H21+cRcBi7dGVG0PMA@mail.gmail.com>
 <20150828171323.GA24203@beef>
 <CA+bK7J4Ha55oFhCYDnUcBu8ZHCP3ReB6B=7Y9Fw7CknxPcaoWQ@mail.gmail.com>
 <55E5E1E2.6040607@gmail.com>
 <CA+bK7J6kErnKPHs=r+X9T8KBn45HptPmtMe31CoapunKpuY34Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+bK7J6kErnKPHs=r+X9T8KBn45HptPmtMe31CoapunKpuY34Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 01, 2015 at 11:03:50AM -0700, Tim Bird wrote:
> On Tue, Sep 1, 2015 at 10:35 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On 9/1/2015 10:14 AM, Tim Bird wrote:
> >> On Fri, Aug 28, 2015 at 10:13 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >
> > < snip >
> >
> >>>
> >>> But to answer your question, if we get a format I'll do
> >>> conversions and hope I'm not alone.
> >>
> >> I'm sure others will help out.  I will, and I'm pretty sure we can get
> >> some conversion sprints set up at conferences (I know I can set aside
> >> some time or resources at ELC in the spring - it might be too late for
> >> ELCE in October to set up a scheduled block of time, but we can start
> >> getting the word out.)  As I said in my other e-mail, one doesn't have
> >> to be a kernel coder to do this, and the conversions should be pretty
> >> straight-forward.
> >>  -- Tim
> >>
> >
> > A conversion sprint at ELCE sounds like a good idea if we can find a
> > good time to schedule it.  I can help, so there will be at least two
> > of us who can help people as they encounter issues.
> 
> Even if we don't find a block of time, we can do something like
> announce a "contest", ask people to do something in their spare time,
> and find some way to get them a raffle ticket if they submit a patch
> with a conversion.  Then hold an extra prize drawing during the
> closing session, with just those raffle tickets, and give someone a
> nice award for contributing.  Of course, there's always the adage that
> you should be careful what you measure and reward...  We don't want a
> flood of crappy conversions, with a time constraint on the review.
> I'll think some more about this.  An alternative would be to have a
> contest announced ahead of the event, with enough time for people to
> submit and get reviewed.
> 
> By the way - I presume the new docs will replace the existing ones,
> but I could imagine wanting to have them live side-by-side
> temporarily.  Any thoughts on this?  Will file name or location
> changes be allowed during the conversion?

Good question. As a starting point I simply changed the file extension
and they live in the same directory structure with the .txt versions.
I can't think of an advantage to moving locations or file names
initially. Certainly some file names could use improvement but
changing them introduces confusion.

-Matt
