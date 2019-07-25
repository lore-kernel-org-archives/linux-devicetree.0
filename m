From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/5] ARM: dts: rockchip: consolidate veyron panel and backlight settings
Date: Thu, 25 Jul 2019 22:46:18 +0200
Message-ID: <3741084.UeuVJec2DR@phil>
References: <20190725162642.250709-1-mka@chromium.org> <20190725162642.250709-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725162642.250709-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 25. Juli 2019, 18:26:39 CEST schrieb Matthias Kaehlcke:
> veyron jaq, jerry, minnie and speedy have mostly redundant regulator
> and pinctrl configurations for the panel/backlight. Consolidate these
> pieces in the eDP .dtsi.
> 
> Also change the default power supply for the panel to
> 'panel_regulator', instead of overriding it in all the board files.
> pinky is the only device that uses 'vcc33_lcd' (the prior default),
> so overwrite it in this case. pinky doesn't have a complete display
> configuration, to keep things as they were delete the common nodes
> that didn't exist previously in pinky's board file.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.4

Thanks
Heiko
