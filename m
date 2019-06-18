From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: set PWM delay backlight
 settings for Minnie"
Date: Tue, 18 Jun 2019 11:34:55 -0700
Message-ID: <20190618183455.GU137143@google.com>
References: <20190614224533.169881-1-mka@chromium.org>
 <45f94c6a-5bd7-92b0-d23f-ae7e0481935f@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45f94c6a-5bd7-92b0-d23f-ae7e0481935f@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,

On Tue, Jun 18, 2019 at 10:21:52AM +0200, Enric Balletbo i Serra wrote:
> Hi Matthias,
> 
> On 15/6/19 0:45, Matthias Kaehlcke wrote:
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
> 
> Could you point from where the confusion comes from? I think will be helpful for
> the record. B101EAN01.8 vs B101EAN01.1

sounds good

> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> With the above added:
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks!
