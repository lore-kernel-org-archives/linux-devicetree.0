From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: rockchip: A few fixes for veyron-{fievel,tiger}
Date: Sat, 03 Aug 2019 00:36:10 +0200
Message-ID: <3131503.0ZxQz3Vuye@phil>
References: <20190731151527.122002-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731151527.122002-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 31. Juli 2019, 17:15:27 CEST schrieb Matthias Kaehlcke:
> Fix/improve a few things for veyron fievel/tiger:
> 
> - move 'vccsys' regulator from tiger to fievel, both boards
>   have it (and tiger includes the fievel .dtsi)
> - move 'ext_gmac' node below regulators
> - fix GPIO ids of vcc5_host1 and vcc5_host2 regulators
> - remove reset configuration from 'gmac' node, this is already done
>   in rk3288.dtsi
> - fixed style issues of some multi-line comments
> - switch 'vcc18_lcdt', 'vdd10_lcd' and 'vcc33_ccd' regulators off
>   during suspend
> - no pull-up on the Bluetooth wake-up pin, there is an external
>   pull-up. The signal is active low, add the 'bt_host_wake_l'
>   pinctrl config
> - move BC 1.2 pins up in the pinctrl config to keep 'wake only' pins
>   separate
> - add BC 1.2 pins to sleep config
> 
> Fixes: 0067692b662e ("ARM: dts: rockchip: add veyron-fievel board")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.4

Thanks
Heiko
