From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Mon, 17 Jun 2019 09:30:30 -0700
Message-ID: <20190617163030.GS137143@google.com>
References: <20190614224533.169881-1-mka@chromium.org>
 <20190616154143.GA28583@atrey.karlin.mff.cuni.cz>
 <c88619de-45f4-9ba7-cfdc-0cedb764f6f4@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c88619de-45f4-9ba7-cfdc-0cedb764f6f4@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Pavel Machek <pavel@ucw.cz>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,

On Mon, Jun 17, 2019 at 12:08:25PM +0200, Enric Balletbo i Serra wrote:
> Hi,
> 
> On 16/6/19 17:41, Pavel Machek wrote:
> > Hi!
> > 
> >> This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> >>
> >> According to the commit message the AUO B101EAN01 panel on minnie
> >> requires a PWM delay of 200 ms, however this is not what the
> >> datasheet says. The datasheet mentions a *max* delay of 200 ms
> >> for T2 ("delay from LCDVDD to black video generation") and T3
> >> ("delay from LCDVDD to HPD high"), which aren't related to the
> >> PWM. The backlight power sequence does not specify min/max
> >> constraints for T15 (time from PWM on to BL enable) or T16
> >> (time from BL disable to PWM off).
> >>
> 
> Hmm, clearly we are not looking at the same datasheet, because in the one I have
> I don't see any reference to T15/T16 or LCDVDD. And, I assume I am probably
> wrong because you might have better access to the specific panel specs for minnie.
> 
> I looked at my archive and the datasheet I have is similar to this [1]. In page
> 21, Section 6.5 Power ON/OFF Sequence, there are two delays T3 and T4, it is
> *min* time between the pwm signal and the bl_en and it is 200 ms. That's the
> delay the patch was adding.
> 
> [1] http://www.yslcd.com.tw/docs/product/B101EAN01.1.pdf
> 
> >> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >> ---
> >> Enric, if you think I misinterpreted the datasheet please holler!
> > 
> > Was this tested? Was previous patch tested?
> > 
> 
> IIRC, It was tested measuring the backlight power on timing (although I am not
> sure if I tested this on minnie or another board with better access to the pins)
> 
> > Does patch being reverted actually break anything? If so, cc stable?
> > 
> > 								Pavel
> > 								
> > 
> 
> Probably will not break anything, I don't remember the reverted patch as a fix
> of any specific issue. IIRC it was more a fear to be out of specs but I'll not
> be surprised if the datasheet lies and this delay is not needed at all.

Indeed, we are looking at different datasheets. It turns out that
'B101EAN01' is an underspecification, minnie uses the 'B101EAN01.8'
(eDP interface), your datasheet describes the 'B101EAN01.1' (LVDS
interface).

> Matthias, are you reverting this to solve any problem?

With the patch there is a user perceptible delay between switching on
the LCD and the backlight. Not necessarily a big problem, but better
avoid it if the delay is not needed.

> Could you share your datasheet?

http://www.yslcd.com.tw/docs/product/B101EAN01.8.pdf (the server seems
to be down currently).

Thanks

Matthias
