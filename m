From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Mon, 17 Jun 2019 09:16:25 -0700
Message-ID: <20190617161625.GR137143@google.com>
References: <20190614224533.169881-1-mka@chromium.org>
 <20190616154143.GA28583@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616154143.GA28583@atrey.karlin.mff.cuni.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Sun, Jun 16, 2019 at 05:41:43PM +0200, Pavel Machek wrote:
> Hi!
> 
> > This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> > 
> > According to the commit message the AUO B101EAN01 panel on minnie
> > requires a PWM delay of 200 ms, however this is not what the
> > datasheet says. The datasheet mentions a *max* delay of 200 ms
> > for T2 ("delay from LCDVDD to black video generation") and T3
> > ("delay from LCDVDD to HPD high"), which aren't related to the
> > PWM. The backlight power sequence does not specify min/max
> > constraints for T15 (time from PWM on to BL enable) or T16
> > (time from BL disable to PWM off).
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> > Enric, if you think I misinterpreted the datasheet please holler!
> 
> Was this tested?

I performed limited manually testing.

minnie ships with the Chrome OS 3.14 downstream, which doesn't include
this delay, to my knowledge there are no open display related bugs for
minnie. One could argue that a the configuration without the delay was
widely field tested

> Does patch being reverted actually break anything?

To my knowledge it doesn't really break anything, however there is a
short user perceptible delay between switching on the LCD and
switching on the backlight. It's not the end of the world, but if it's
not actually needed better avoid it.

> If so, cc stable?

I guess this is an edge case, were you could go either way. I'm fine
with respinning and cc-ing stable.
