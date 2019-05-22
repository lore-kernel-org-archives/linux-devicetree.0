From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: Add pin names for rk3288-veyron-minnie
Date: Wed, 22 May 2019 10:01:39 +0200
Message-ID: <1983983.hLAGMFZVp3@phil>
References: <20190521203215.234898-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521203215.234898-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: briannorris@chromium.org, ryandcase@chromium.org, mka@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 21. Mai 2019, 22:32:14 CEST schrieb Douglas Anderson:
> We can now use the "gpio-line-names" property to provide the names for
> all the pins on a board.  Let's use this to provide the names for all
> the pins on rk3288-veyron-minnie.
> 
> In general the names here come straight from the schematic.  That
> means even if the schematic name is weird / doesn't have consistent
> naming conventions / has typos I still haven't made any changes.
> 
> The exception here is for two pins: the recovery switch and the write
> protect detection pin.  These two pins need to have standardized names
> since crossystem (a Chrome OS tool) uses these names to query the
> pins.  In downstream kernels crossystem used an out-of-tree driver to
> do this but it has now been moved to the gpiod API and needs the
> standardized names.
> 
> It's expected that other rk3288-veyron boards will get similar patches
> shortly.
> 
> NOTE: I have sorted the "gpio" section to be next to the "pinctrl"
> section since it seems to logically make the most sense there.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied both for 5.3 ... that is actually a pretty nifty feature for
boards whose schematics cannot be published :-)
