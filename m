From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 3/5] ARM: dts: rockchip: Add DDR retention/poweroff to rk3288-veyron hogs
Date: Fri, 12 Apr 2019 13:16:46 +0200
Message-ID: <5038829.dT3Rz05rMg@diego>
References: <20190411232157.55125-1-dianders@chromium.org> <20190411232157.55125-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 12. April 2019, 01:21:55 CEST schrieb Douglas Anderson:
> Even though upstream Linux doesn't yet go into deep enough suspend to
> get DDR into self refresh, there is no harm in setting these pins up.
> They'll only actually do something if we go into a deeper suspend but
> leaving them configed always is fine.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.2

Thanks
Heiko
