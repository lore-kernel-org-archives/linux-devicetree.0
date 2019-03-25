From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/4] ARM: dts: rockchip: Fix gic/efuse sort ordering for rk3288
Date: Mon, 25 Mar 2019 13:35:29 +0100
Message-ID: <3934907.Ocf2yJGU5X@phil>
References: <20190320201402.114309-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320201402.114309-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: mka@chromium.org, ryandcase@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 20. März 2019, 21:13:59 CET schrieb Douglas Anderson:
> It can be seen that 0xffb40000 < 0xffc01000, thus efuse comes first.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied patch1 for 5.2 and the other 3 as fixes for 5.1

Thanks
Heiko
