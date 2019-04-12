From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 5/5] ARM: dts: rockchip: vdd_gpu off in suspend for rk3288-veyron
Date: Fri, 12 Apr 2019 13:17:11 +0200
Message-ID: <14421258.VxKPzeiCPd@diego>
References: <20190411232157.55125-1-dianders@chromium.org> <20190411232157.55125-5-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-5-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 12. April 2019, 01:21:57 CEST schrieb Douglas Anderson:
> At some point long long ago the downstream GPU driver would crash if
> we turned the GPU off during suspend.  For some context you can see:
> 
> https://chromium-review.googlesource.com/#/c/215780/5..6/arch/arm/boot/dts/rk3288-pinky-rev2.dts
> 
> At some point in time not too long after that got fixed.
> 
> It's unclear why the GPU is left enabled during suspend on the
> mainline kernel.  Everything seems fine if I turn this off, so let's
> do it.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.2

Thanks
Heiko
