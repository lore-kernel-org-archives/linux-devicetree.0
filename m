From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 6/7] ARM: dts: rockchip: Specify rk3288-veyron-jerry's display timings
Date: Fri, 29 Mar 2019 20:20:00 +0100
Message-ID: <7960623.ZFqGeXkhir@diego>
References: <20190328171710.31949-1-dianders@chromium.org> <20190328171710.31949-7-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328171710.31949-7-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>, linux-rockchip@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Enric =?ISO-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, mka@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 28. März 2019, 18:17:09 CET schrieb Douglas Anderson:
> Let's document the display timings that jerry has been using out in
> the field.  This uses the standard blankings but a slightly slower
> clock rate, thus getting a refresh rate 58.3 Hz.
> 
> NOTE: this won't really do anything except cause DRM to properly
> report the refresh rate since vop_crtc_mode_fixup() was rounding the
> pixel clock to 74.25 MHz anyway.  Apparently the adjusted rate isn't
> exposed to userspace so it's important that the rate we're trying to
> achieve is mostly right.
> 
> For the downstream kernel change related to this see See
> https://crrev.com/c/324558.
> 
> NOTE: minnie will be fixed up in a future patch, so for now we'll just
> delete the panel timings there.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v4:
> - rk3288-veyron-jerry patch new for v4.
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 14 ++++++++++++++

hmm, the commit message explicitly mentions jerry, but this is the
general panel definition for most veyron-chromebooks (jerry, pinky, jaq,...)?

It does work on both pinky and jerry for me, so I guess just the commit
message needs a bit adapting?


Heiko
