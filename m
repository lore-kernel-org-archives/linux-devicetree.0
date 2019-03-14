From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/2] add gpu node support on rock960 and rockpi4
Date: Thu, 14 Mar 2019 12:59:47 +0530
Message-ID: <20190314072947.GA19182@Mani-XPS-13-9360>
References: <20190314071853.32176-1-akash@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314071853.32176-1-akash@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <akash@openedev.com>
Cc: heiko@sntech.de, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vicente Bergas <vicencb@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Andrius =?utf-8?B?xaB0aWtvbmFz?= <andrius@stikonas.eu>, Linus Walleij <linus.walleij@linaro.org>, ezequiel@collabora.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 14, 2019 at 12:48:40PM +0530, Akash Gajjar wrote:
> add gpu node support on both rockchip-rk3399 board.
> performance tested with freedesktop.org panfrost mali driver.
> 
> Akash Gajjar (2):
>   arm64: dts: rockchip: add mali gpu support on rockpi4
>   arm64: dts: rockchip: add mali gpu support on rock960
> 

Eze already sent MALI support patches for the above boards and those has
been queued for v5.2.

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v5.2-armsoc/dts64

Thanks,
Mani

>  arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dts | 5 +++++
>  arch/arm64/boot/dts/rockchip/rk3399-rock960.dts   | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> -- 
> 2.17.1
> 
