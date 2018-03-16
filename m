From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 6/6] arm64: dts: rockchip: enable typec-phy0 for rk3399-puma-haikou.
Date: Fri, 16 Mar 2018 11:39:33 +0100
Message-ID: <1540740.GPTOZn9kC5@phil>
References: <20180301152515.20940-1-enric.balletbo@collabora.com> <20180301152515.20940-7-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301152515.20940-7-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: kishon@ti.com, groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Will Deacon <will.deacon@arm.com>, Rask Ingemann Lambertsen <rask@formelder.dk>, Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 1. März 2018, 16:25:15 CET schrieb Enric Balletbo i Serra:
> Commit c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port
> support for rk3399") caused a regression regarding the USB3. During
> boot, the following message appears a few times:
> 
>     dwc3: failed to initialize core
> 
> The driver is deferred waiting for the typec-phy, but this never
> happens beause is disabled. So, enable it.
> 
> Fixes: c301b327aea898af ("arm64: dts: rockchip: add usb3-phy otg-port support for rk3399")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

I've amended the message a bit to clarify that the offending commit
has been reverted for now and this change is needed for reenabling it
and also dropped the Fixes tag.

I've applied the result in my 4.17 branch, but may move that to 4.18
depending on timing. The reenablement of the otg-port will be in
4.18 only anyway.


Heiko
