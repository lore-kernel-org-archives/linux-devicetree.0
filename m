From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Add dvs-gpios to rk3288-veyron-jerry
Date: Mon, 25 Mar 2019 13:30:10 +0100
Message-ID: <2671225.FaCa6N3cA0@phil>
References: <20190322165209.196926-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322165209.196926-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: mka@chromium.org, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. März 2019, 17:52:09 CET schrieb Douglas Anderson:
> When the rk3288-jerry device tree was first submitted we left out the
> dvs-gpios because I pointed out that the property "dvs-gpios" wasn't
> yet supported upstream [1].  Soon after that the property was added in
> commit bad47ad2eef3 ("regulator: rk808: fixed the overshoot when
> adjust voltage").  ...but we forgot to go back and add the property to
> the jerry device tree file.  Let's do so now.
> 
> NOTE: without this patch, jerry is likely still stable (thanks to the
> fallback of making many small jumps in the rk808 regulator code) but
> it'll take quite a bit longer to make voltage transitions.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/CAD=FV=WwFgjzbk9xF5TU_ie6UnHQMyrZ176D4+jJTWWOoaKC2Q@mail.gmail.com/
> 
> Fixes: f3ee390e4ef2 ("ARM: dts: rockchip: add veyron-jerry board")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied for 5.2

Thanks
Heiko
