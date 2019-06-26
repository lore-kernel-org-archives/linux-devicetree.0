From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] Revert "ARM: dts: rockchip: set PWM delay backlight settings for Minnie"
Date: Thu, 27 Jun 2019 00:02:59 +0200
Message-ID: <2109910.Z3vxzrnhVQ@phil>
References: <20190618184531.1137-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618184531.1137-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Pavel Machek <pavel@ucw.cz>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 18. Juni 2019, 20:45:31 CEST schrieb Matthias Kaehlcke:
> This reverts commit 288ceb85b505c19abe1895df068dda5ed20cf482.
> 
> The commit assumes that the minnie panel is a AUO B101EAN01.1 (LVDS
> interface), however it is a AUO B101EAN01.8 (eDP interface). The eDP
> panel doesn't need the 200 ms delay.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

applied for 5.3

Thanks
Heiko
