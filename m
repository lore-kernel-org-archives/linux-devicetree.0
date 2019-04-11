From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/3] ARM: dts: rockchip: fix PWM clock found on RK3288 Socs
Date: Thu, 11 Apr 2019 21:29:35 +0200
Message-ID: <2052522.emLDVJXZZO@diego>
References: <20190409204707.150347-1-dianders@chromium.org> <20190409204707.150347-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409204707.150347-4-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Caesar Wang <caesar.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, mka@chromium.org, ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 9. April 2019, 22:47:07 CEST schrieb Douglas Anderson:
> From: Caesar Wang <caesar.wang@rock-chips.com>
> 
> We use the new PWM IP on RK3288, but the PWM's clock indeed incorrect.
> 
> Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied into a branch for 5._3_ ... as it requires a change coming
through a different tree, the patch gets a "quarantine"-release in
between.

Thanks
Heiko
