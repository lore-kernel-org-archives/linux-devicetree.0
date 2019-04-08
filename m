From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/7] ARM: dts: rockchip: Specify rk3288-veyron-chromebook's
 display timings
Date: Mon, 8 Apr 2019 08:21:14 -0700
Message-ID: <CAD=FV=VK3ow3PgA9nXiE8+0UdgsGiFbAiZd-QAmCsLHK0Yi2Cg@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-7-dianders@chromium.org> <CAPCnQJmWfnBwxj8gScNzmZTGV6eU5B1vk76sQ56A2FvpSiYRaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPCnQJmWfnBwxj8gScNzmZTGV6eU5B1vk76sQ56A2FvpSiYRaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Urja Rannikko <urjaman@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Boris Brezillon <boris.brezillon@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, Apr 6, 2019 at 6:16 PM Urja Rannikko <urjaman@gmail.com> wrote:
>
> Hi,
>
> On Mon, Apr 1, 2019 at 5:18 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Let's document the display timings that most veyron chromebooks (like
> > jaq, jerry, mighty, speedy) have been using out in the field.  This
> > uses the standard blankings but a slightly slower clock rate, thus
> > getting a refresh rate 58.3 Hz.
> >
> > NOTE: this won't really do anything except cause DRM to properly
> > report the refresh rate since vop_crtc_mode_fixup() was rounding the
> > pixel clock to 74.25 MHz anyway.  Apparently the adjusted rate isn't
> > exposed to userspace so it's important that the rate we're trying to
> > achieve is mostly right.
>
> I just thought it would be worth mentioning that I have picked &
> tested a close to 60Hz mode on two veyron speedys of mine, but thought
> it too much effort to try and upstream, especially as it was done as a
> change to the actual panel info:
> https://github.com/urjaman/linux/commit/23d46278911e18df138b7adde1bebc23f606baae
>
> The difference would be in this format just setting hfront-porch = 87
> and vback-porch = 14.
> Anyways the point is: I support moving this mode info into the dts,
> and I'd like to know how if at all should i go about getting a
> 60Hz(ish) mode upstreamed?

I'm a bit torn here.  I like the idea of actually getting 60 Hz and
you also increase the vblank time by a little bit (which means that if
anyone ever gets DDRFreq upstream it will work better).  ...but I'm
also slightly nervous changing something like this without a really
good motivation.  As you said in your commit message the pixels clocks
claimed by the spec don't actually all work and thus, to some extent,
we can only rely on trial-and-error here.  While your new mode works
well on your device (and you wisely gave it a bit of margin), it is
_possible_ that there could be devices out there where it doesn't work
(especially across various temperature extremes).  All devices were
tested in the factory with the old timings and presumably have been
running fine for years like that...

I will certainly admit that it's unlikely devices would be affected,
but at the same time I'd want to know how much of a difference going
from 58.3 Hz to 60 Hz made for you.  Could you actually notice any
visible difference, or was it just nice to be at 60 Hz?


-Doug
