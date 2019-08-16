From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] Revert "ARM: dts: rockchip: add startup delay to rk3288-veyron panel-regulators"
Date: Fri, 16 Aug 2019 13:28:25 +0200
Message-ID: <1641883.xsURkgBn4i@phil>
References: <20190620182056.61552-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620182056.61552-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: enric.balletbo@collabora.com, mka@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 20. Juni 2019, 20:20:56 CEST schrieb Douglas Anderson:
> This reverts commit 1f45e8c6d0161f044d679f242fe7514e2625af4a.
> 
> This 100 ms mystery delay is not on downstream kernels and no longer
> seems needed on upstream kernels either [1].  Presumably something in the
> meantime has made things better.  A few possibilities for patches that
> have landed in the meantime that could have made this better are
> commit 3157694d8c7f ("pwm-backlight: Add support for PWM delays
> proprieties."), commit 5fb5caee92ba ("pwm-backlight: Enable/disable
> the PWM before/after LCD enable toggle."), and commit 6d5922dd0d60
> ("ARM: dts: rockchip: set PWM delay backlight settings for Veyron")
> 
> Let's revert and get our 100 ms back.
> 
> [1] https://lkml.kernel.org/r/2226970.BAPq4liE1j@diego
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I've rebased the change on top of Matthias' veyron display reorganization
and applied it for 5.4

Thanks
Heiko
