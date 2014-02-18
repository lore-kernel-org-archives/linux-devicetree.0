From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 18 Feb 2014 11:47:56 -0800
Message-ID: <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	<20140218155750.GS17250@pengutronix.de>
	<20140218181854.GB7862@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218181854.GB7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 10:18 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
>> On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> ...
>> >   - Is the Linux development workflow ready for devicetree to move out
>> >     of the Linux Kernel?
>>
>> I hope so since keeping the devicetrees in sync with the kernel is a
>> pain for all external users.
>
> Well, I haven't heard any screams yet.  I suspect people are waiting for
> details on the exact form it would take before complaining...

I'M SCREAMING NOW. :-)

Honestly though, I think we need to do this carefully. Even though we
don't like it, there are still lots of bindings in flux and
cross-dependencies between two independent repos will be a major pain.

I think we have two options:

1. Bring out everything in the current kernel repo to a separate one,
but do it my mirroring over. Changes go into the kernel repo first and
then comes over to this one, but other projects can mirror the
standalone repo without downloading a whole kernel tree.

2. Remove the kernel contents and move it over to the new repo. This
should be done independently for each platform, and the maintainers
get to decide if, when and how they do it. Some platforms are ready
for it (some have been for a long time), others are not. And it's up
to the maintainer, since they are the ones we will yell at when they
make our life miserable by adding cross-dependencies with an external
repo. Breakage due to the move is something we should have to put up
with, etc.

>> I'll likely need some barebox specific additions to the devicetrees.
>> Right now our idea is to leave the provided devicetrees untouched and
>> instead of compiling the board dts files directly we create
>> <boardname>-barebox.dts files which include the original board files.
>> That would allow us to provide additional information to barebox
>> without having to carry patches for the devicetrees.
>
> So the resulting <boardname>-barebox.dtb is compiled into the barebox
> binary?  Is the dtb passed to the kernel independently upgradeable?
>
> Why not post binding/dts patches for 'barebox,...' attributes that you
> need?

+1. These should ideally be posted and reviewed too -- maybe they make
sense to share between barebox and other firmware stacks, for example.

>
>> > Other thoughts I may have missed?
>>
>> It will be interesting to see which rules should apply for merging new
>> bindings. I know that devicetrees should be OS agnostic, but sometimes
>> they are modelled after how Linux currently works. What happens when the
>> *BSD guys have different ideas how a good binding looks like? How will
>> such conflicts be resolved?
>
> That's more a question for Grant.  I assume we'll all put on our big-boy
> pants and pick the best technical solution based on their merits. :)

A good binding focuses on describing hardware, so as long as we keep
our focus on that instead of how a specific implementation of a driver
will use it, I think we can avoid at least some of the potential
conflicts.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
