From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] dt-bindings: ARM: dts: rockchip: Add rk3288-veyron-jerry rev 10-15
Date: Mon, 25 Mar 2019 13:25:20 +0100
Message-ID: <22847786.E0k6fS2MZ4@phil>
References: <20190322195924.70448-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190322195924.70448-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: mka@chromium.org, ryandcase@chromium.org, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexis Ballier <aballier@gentoo.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. März 2019, 20:59:23 CET schrieb Douglas Anderson:
> As far as I can tell/remember rev10 was originally created to support
> making a SKU of jerry that had a different LCD.  rev11-rev15 were
> added to give some wiggle room for future builds.  Downstream has a
> separate device tree for rev10-rev15 (compared to rev3-rev7) with the
> expectation that differences relating to the LCD would be accounted
> for there but nothing was ever added to the rev10-rev15 making it
> identical to the rev3-rev7 one.
> 
> It's likely nothing actually shipped with rev10-rev15 but they are
> listed in the downstream kernel's device tree and it seems like it
> should add a little safety if we match them here just in case
> something actually shipped with one of these revisions and that device
> will break if we don't claim support.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied both for 5.2

Thanks
Heiko
