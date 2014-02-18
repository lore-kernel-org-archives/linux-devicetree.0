From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Tue, 18 Feb 2014 11:43:23 +0100
Message-ID: <5303394B.2020004@samsung.com>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de>
 <CAL_Jsq+U9zU1i+STLHMBjY5BeEP6djYnJVE5X1ix-D2q_zWztQ@mail.gmail.com>
 <20140217181451.7EB7FC4044D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140217181451.7EB7FC4044D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/02/14 19:14, Grant Likely wrote:
> On Tue, 11 Feb 2014 07:56:33 -0600, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Tue, Feb 11, 2014 at 5:45 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>>> > > From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> > >
>>> > > This patch moves the parsing helpers used to parse connected graphs
>>> > > in the device tree, like the video interface bindings documented in
>>> > > Documentation/devicetree/bindings/media/video-interfaces.txt, from
>>> > > drivers/media/v4l2-core to drivers/of.
>> > 
>> > This is the opposite direction things have been moving...
>> > 
>>> > > This allows to reuse the same parser code from outside the V4L2 framework,
>>> > > most importantly from display drivers. There have been patches that duplicate
>>> > > the code (and I am going to send one of my own), such as
>>> > > http://lists.freedesktop.org/archives/dri-devel/2013-August/043308.html
>>> > > and others that parse the same binding in a different way:
>>> > > https://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg100761.html
>>> > >
>>> > > I think that all common video interface parsing helpers should be moved to a
>>> > > single place, outside of the specific subsystems, so that it can be reused
>>> > > by all drivers.
>> > 
>> > Perhaps that should be done rather than moving to drivers/of now and
>> > then again to somewhere else.
>
> This is just parsing helpers though, isn't it? I have no problem pulling
> helper functions into drivers/of if they are usable by multiple
> subsystems. I don't really understand the model being used though. I
> would appreciate a description of the usage model for these functions
> for poor folks like me who can't keep track of what is going on in
> subsystems.

Yes, this is (mostly) just parsing helpers to walk graph of connected (sub-)
devices. Originally I though about adding this code to drivers/of/of_video.c, 
nevertheless it ended up in drivers/media/vl2-core/v4l2-of.c. However those
helpers, likely only after some improvements/enhancements, could be used 
in other subsystems like drivers/video or drivers/gpu/drm, wherever a whole
device consists of multiple connected sub-devices. 

These helpers are supposed to be used (generically) to walk a graph of 
sub-devices, e.g. to find a remote sub-device (e.g. a data transmitter) 
to some sub-device (e.g. a data receiver) in order to configure it for 
data transmission.

This parsing helpers code could be somehow related to rmk's componentized 
device handling [1], in a sense it is supposed to be similarly generic.

I think having those helpers in a common location and shared by subsystems
could be useful in terms of consistent DT bindings for same devices (e.g.
displays) handled currently by multiple kernel subsystems, e.g. DRM, FB, 
V4L2.

Of course there might be still some work needed so these helpers are usable
for all (e.g. simplifying corresponding DT binding to have less bloated
description for very simple devices - this has been on my todo list), but 
it would be really nice to first agree to the common location. 


[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/base/component.c?id=2a41e6070dd7ef539d0f3b1652b4839d04378e11
 
--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
