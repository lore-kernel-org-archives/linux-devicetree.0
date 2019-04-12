From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 4/5] ARM: dts: rockchip: vcc33_ccd off in suspend for rk3288-veyron-chromebook
Date: Fri, 12 Apr 2019 13:16:59 +0200
Message-ID: <172807795.YDU2us2AVO@diego>
References: <20190411232157.55125-1-dianders@chromium.org> <20190411232157.55125-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-4-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 12. April 2019, 01:21:56 CEST schrieb Douglas Anderson:
> As per my comments when the device tree for rk3288-veyron-chromebook
> first landed:
> 
> > Technically I think vcc33_ccd can be off since we have
> > 'needs-reset-on-resume' down in the EHCI port (this regulator is for
> > the USB webcam that's connected to the EHCI port).
> >
> >  ...but leaving it on for now seems fine until we get suspend/resume
> > more solid.
> 
> It's probably about time to do it right.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/CAD=FV=U37Yx8Mqk75_x05zxonvdc3qRMhqp8TyTDPWGHqSuRqg@mail.gmail.com/
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.2

Thanks
Heiko
