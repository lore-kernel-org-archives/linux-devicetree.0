From: Urja Rannikko <urjaman@gmail.com>
Subject: Re: [PATCH v5 6/7] ARM: dts: rockchip: Specify rk3288-veyron-chromebook's
 display timings
Date: Sun, 7 Apr 2019 01:15:51 +0000
Message-ID: <CAPCnQJmWfnBwxj8gScNzmZTGV6eU5B1vk76sQ56A2FvpSiYRaw@mail.gmail.com>
References: <20190401171724.215780-1-dianders@chromium.org> <20190401171724.215780-7-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401171724.215780-7-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Boris Brezillon <boris.brezillon@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Apr 1, 2019 at 5:18 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Let's document the display timings that most veyron chromebooks (like
> jaq, jerry, mighty, speedy) have been using out in the field.  This
> uses the standard blankings but a slightly slower clock rate, thus
> getting a refresh rate 58.3 Hz.
>
> NOTE: this won't really do anything except cause DRM to properly
> report the refresh rate since vop_crtc_mode_fixup() was rounding the
> pixel clock to 74.25 MHz anyway.  Apparently the adjusted rate isn't
> exposed to userspace so it's important that the rate we're trying to
> achieve is mostly right.

I just thought it would be worth mentioning that I have picked &
tested a close to 60Hz mode on two veyron speedys of mine, but thought
it too much effort to try and upstream, especially as it was done as a
change to the actual panel info:
https://github.com/urjaman/linux/commit/23d46278911e18df138b7adde1bebc23f606baae

The difference would be in this format just setting hfront-porch = 87
and vback-porch = 14.
Anyways the point is: I support moving this mode info into the dts,
and I'd like to know how if at all should i go about getting a
60Hz(ish) mode upstreamed?

-- 
Urja Rannikko
