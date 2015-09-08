From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] DT binding documents using text markup
Date: Tue, 8 Sep 2015 14:38:08 -0500
Message-ID: <CAL_JsqJLKw=4m2GNHb-XBn8Pn0BbSxe_TGzChLWhxjHYsw8=Xg@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+qCJfLYxVfyQ4gAxPWLZ2=WNa0H21+cRcBi7dGVG0PMA@mail.gmail.com>
 <20150828171323.GA24203@beef> <CA+bK7J4Ha55oFhCYDnUcBu8ZHCP3ReB6B=7Y9Fw7CknxPcaoWQ@mail.gmail.com>
 <55E5E1E2.6040607@gmail.com> <CA+bK7J6kErnKPHs=r+X9T8KBn45HptPmtMe31CoapunKpuY34Q@mail.gmail.com>
 <CAL_Jsq+7NQdZivTpwRDwcGrCzpcQQoV5gvSkjz3NNOWNXdBhMA@mail.gmail.com> <20150908143532.GI17267@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150908143532.GI17267@beef>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 8, 2015 at 9:36 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Tue, Sep 01, 2015 at 01:24:17PM -0500, Rob Herring wrote:
>> On Tue, Sep 1, 2015 at 1:03 PM, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Tue, Sep 1, 2015 at 10:35 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >> On 9/1/2015 10:14 AM, Tim Bird wrote:
>> >>> On Fri, Aug 28, 2015 at 10:13 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >>
>> >> < snip >
>> >>
>> >>>>
>> >>>> But to answer your question, if we get a format I'll do
>> >>>> conversions and hope I'm not alone.
>> >>>
>> >>> I'm sure others will help out.  I will, and I'm pretty sure we can get
>> >>> some conversion sprints set up at conferences (I know I can set aside
>> >>> some time or resources at ELC in the spring - it might be too late for
>> >>> ELCE in October to set up a scheduled block of time, but we can start
>> >>> getting the word out.)  As I said in my other e-mail, one doesn't have
>> >>> to be a kernel coder to do this, and the conversions should be pretty
>> >>> straight-forward.
>> >>>  -- Tim
>> >>>
>> >>
>> >> A conversion sprint at ELCE sounds like a good idea if we can find a
>> >> good time to schedule it.  I can help, so there will be at least two
>> >> of us who can help people as they encounter issues.
>> >
>> > Even if we don't find a block of time, we can do something like
>> > announce a "contest", ask people to do something in their spare time,
>> > and find some way to get them a raffle ticket if they submit a patch
>> > with a conversion.  Then hold an extra prize drawing during the
>> > closing session, with just those raffle tickets, and give someone a
>> > nice award for contributing.  Of course, there's always the adage that
>> > you should be careful what you measure and reward...  We don't want a
>> > flood of crappy conversions, with a time constraint on the review.
>> > I'll think some more about this.  An alternative would be to have a
>> > contest announced ahead of the event, with enough time for people to
>> > submit and get reviewed.
>>
>> Sounds like a review nightmare. That's another reason why as much
>> automated conversion we can do, the better.
>
> I don't want to discount the value of interested people getting together
> f2f to review these and potentially clean them up for submission. That
> depends on what we thinking is the minimal "in progress" conversion
> that can be place upstream. i.e. is it simply compatible strings
> autoconverted to tags and the entire current document in comments?

That is sufficient for me (I reserve the right to change my mind).
Logistically, it needs to be a script that can be run before/during
the merge window and perhaps again after. I'd guess the long pole here
is how we validate the .yaml files.

>> > By the way - I presume the new docs will replace the existing ones,
>> > but I could imagine wanting to have them live side-by-side
>> > temporarily.  Any thoughts on this?  Will file name or location
>> > changes be allowed during the conversion?
>>
>> I proposed some ideas earlier in the thread. Either we can have both
>> side by side or do a mass conversion to YAML making the existing doc a
>> comment (add # prefix).
>>
>
> Were you thinking that this automated conversion would be sufficient
> for an initial commit? I'm not sure if I misunderstood in your separate
> comments and was looking at this as something that would be hand edited
> to move the existing doc (# prefix) into description tags where
> appropriate.

Yes, I think it is more important to have infrastructure in place to
enable others than how much is converted initially. Certainly any
changes based on existing docs will have to be manual, but we may be
able to do multiple passes of automated conversions. Sharing any
conversion scripts is important to enable others for that as well.

>> Any renames/moving should be separate (there's some clean-up I'd like
>> to there as well). Exact rules depend on the approach, but we need to
>> be able to tell which bindings conversions are not started, in
>> progress, or complete.
>
> If we add .yaml in place we can identify what's in progress by the fact
> that a .yaml exists with the same filename and then based on which
> tags have been populated (such as type: and constraints: not yet
> populated) then we know the state.

You mean keeping the .txt and .yaml until done? If we are copying in
the current doc, then I'd rather not do that. I don't think looking at
the tags will work as it would be hard to distinguish incomplete from
done. However, we could simply have an "in-progress" tag that is
removed when done (might as well take advantage of our new found
structured docs).

Rob
