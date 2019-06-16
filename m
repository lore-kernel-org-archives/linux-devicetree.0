From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Sun, 16 Jun 2019 17:41:43 +0200
Message-ID: <20190616154143.GA28583@atrey.karlin.mff.cuni.cz>
References: <20190614224533.169881-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190614224533.169881-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi!

> This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> 
> According to the commit message the AUO B101EAN01 panel on minnie
> requires a PWM delay of 200 ms, however this is not what the
> datasheet says. The datasheet mentions a *max* delay of 200 ms
> for T2 ("delay from LCDVDD to black video generation") and T3
> ("delay from LCDVDD to HPD high"), which aren't related to the
> PWM. The backlight power sequence does not specify min/max
> constraints for T15 (time from PWM on to BL enable) or T16
> (time from BL disable to PWM off).
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Enric, if you think I misinterpreted the datasheet please holler!

Was this tested? Was previous patch tested?

Does patch being reverted actually break anything? If so, cc stable?

								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
