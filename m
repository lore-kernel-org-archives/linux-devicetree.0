From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: sn65dsi86: Add panel-hpd-delay
Date: Mon, 22 Oct 2018 13:52:35 -0700
Message-ID: <CAD=FV=W8AeOJfOKOZoWgqeZE1f-cdef43NKJgspdNgnG8+vNKA@mail.gmail.com>
References: <20181019201940.138179-1-dianders@chromium.org> <7337055.Mnli2TfP4b@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7337055.Mnli2TfP4b@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sandeep Panda <spanda@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, ryandcase@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Oct 21, 2018 at 2:07 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Douglas,
>
> Thank you for the patch.
>
> On Friday, 19 October 2018 23:19:39 EEST Douglas Anderson wrote:
> > The timing diagram of some eDP panels says that you're supposed to
> > wait for HPD to be asserted before the aux channel is operational.
> >
> > In some cases, however, it's better to just hardcode the max delay
> > instead of trying to use HPD.  Why?
> >
> > The sn65dsi86 datasheet says that it only reports the debounced
> > HPD signal to software.  It will tell software about HPD assertion
> > as quickly as 100 ms after it's asserted, but sometimes it might
> > take 400 ms because it's timed with a very inaccurate ring
> > oscillator.  In practice it was measured at 200 ms on at least
> > one system.
> >
> > On a particular panel, HPD was asserted 84 ms after power was given.
> > This same panel specified that HPD would always be asserted within
> > 200 ms of applying power.  Thus on this panel with the measured
> > 84 ms to assert HPD + the 200 ms measured debounce we'd wait 284 ms
> > which is 84 ms longer than just hardcoding the sleep.
> >
> > Let's allow boards to explicitly choose the hardcoded delay by adding
> > a device tree attribute for it.  A few notes:
> > a) This delay can't easily be in the panel bindings because the delay
> >    wouldn't actually be needed if the same panel were hooked somewhere
> >    else (someplace with more sane HPD behavior).
>
> The delay shouldn't be handled in the panel driver, but I think it's still a
> property of the panel, and should thus be specified in the panel DT node. The
> panel driver should parse it from DT (or, if the panel driver knows about the
> specific panel model, just hardcode it), and then report it to the bridge
> driver which can then decide, based on its knowledge if the bridge internal
> HPD processing delays, to just wait for a fixed delay or use regular HPD
> handling.

OK, that's fair.

I looked a little at trying to add this but it seems like it's a
pretty specific use case and to communicate between the panel and the
bridge I believe I'd need to add a bunch of members and/or functions
into the drm_connector structures that nobody would use except this
one case.  I also still need to add a device tree attribute to the
panel to say that HPD shouldn't be used.

Before I go about doing that, I have another idea that maybe you'd be
OK with.  I've written up patches for it to hopefully make it easier
to see what it looks like.  Instead of adding the device tree
attribute for "don't use HPD" to the bridge, I can just add that to
the panel.  The panel knows that if HPD isn't connected that it will
need to insert a delay.  No abstraction violations and no need to even
communicate to the bridge.  So basically anyone using this panel w/
this bridge chip should know that HPD isn't useful and not bother
hooking it up and then set this property.  ...and in fact, on most of
our boards HPD isn't actually connected.  We just started connecting
it on some of them to see if it was the best way to fix this delay...

Patches can be found at:

https://lore.kernel.org/patchwork/patch/1002547/
[1/6] dt-bindings: drm/panel: simple: Add no-hpd property

https://lore.kernel.org/patchwork/patch/1002548/
[2/6] drm/panel: simple: Support panels with HPD where HPD isn't connected

https://lore.kernel.org/patchwork/patch/1002552/
[3/6] drm/panel: simple: Add "no-hpd" delay for Innolux TV123WAM

https://lore.kernel.org/patchwork/patch/1002549/
[4/6] drm/bridge: ti-sn65dsi86: Remove the mystery delay

https://lore.kernel.org/patchwork/patch/1002551/
[5/6] drm/panel: simple: Innolux TV123WAM is actually P120ZDG-BF1

https://lore.kernel.org/patchwork/patch/1002550/
[6/6] dt-bindings: drm/panel: simple: Innolux TV123WAM is actually P120ZDG-BF1


Thanks!

-Doug
