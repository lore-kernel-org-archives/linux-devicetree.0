From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix override mode for rk3399-kevin panel
Date: Thu, 10 Oct 2019 23:42:21 +0200
Message-ID: <29647267.xx61tplHq2@phil>
References: <20191008124949.1.I674acd441997dd0690c86c9003743aacda1cf5dd@changeid>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008124949.1.I674acd441997dd0690c86c9003743aacda1cf5dd@changeid>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>, devicetree@vger.kernel.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. Oktober 2019, 21:49:54 CEST schrieb Douglas Anderson:
> When I re-posted Sean's original commit to add the override mode for
> the kevin panel, for some reason I didn't notice that the pixel clock
> wasn't quite right.  Looking at /sys/kernel/debug/clk/clk_summary on
> downstream kernels it can be seen that the VOP clock is supposed to be
> 266,666,667 Hz achieved by dividing the 800 MHz PLL by 3.
> 
> Looking at history, it seems that even Sean's first patch [1] had this
> funny clock rate.  I'm not sure where it came from since the commit
> message specifically mentioned 26666 kHz and the Chrome OS tree [2]
> can be seen to request 266667 kHz.
> 
> In any case, let's fix it up.  This together with my patch [3] to do
> the proper rounding when setting the clock rate makes the VOP clock
> more proper as seen in /sys/kernel/debug/clk/clk_summary.
> 
> [1] https://lore.kernel.org/r/20180206165626.37692-4-seanpaul@chromium.org
> [2] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.4/drivers/gpu/drm/panel/panel-simple.c#1172
> [3] https://lkml.kernel.org/r/20191003114726.v2.1.Ib233b3e706cf6317858384264d5b0ed35657456e@changeid
> 
> Fixes: 84ebd2da6d04 ("arm64: dts: rockchip: Specify override mode for kevin panel")
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied as fix for 5.4

Thanks
Heiko
