From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 13:23:45 -0700
Message-ID: <FC8FF4FE-E9F5-4C17-BF3A-01ADAA1584D7@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com> <20140219183221.GO7862@titan.lakedaemon.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140219183221.GO7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 19, 2014, at 11:32 AM, Jason Cooper wrote:

> On Tue, Feb 18, 2014 at 11:47:56AM -0800, Olof Johansson wrote:
>> On Tue, Feb 18, 2014 at 10:18 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
>> I think we have two options:
>> 
>> 1. Bring out everything in the current kernel repo to a separate one,
>> but do it my mirroring over. Changes go into the kernel repo first and
>> then comes over to this one, but other projects can mirror the
>> standalone repo without downloading a whole kernel tree.
> 
> I prefer this one.  Assuming that a separate repo is mostly agreed upon,
> this allows us to provide the tree in an easily digestible way without
> impacting the current workflow.
> 
> Also, if it works for the other projects, no one says we have to move
> beyond this step.

I just joined this list...  What's the scope of what would move into the new
repo? The dts files with the binding docs, or also the code to implement
those bindings?

Warner

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
