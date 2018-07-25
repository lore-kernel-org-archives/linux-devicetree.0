From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: remove deprecated Type-C PHY properties on rk3399
Date: Wed, 25 Jul 2018 12:07:05 +0200
Message-ID: <3045142.hvSNBlnxT0@phil>
References: <20180709205754.29132-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709205754.29132-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, Nickey Yang <nickey.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, Yakir Yang <kuankuan.y@gmail.com>, Mark Yao <markyao0591@gmail.com>, devicetree@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>, Brian Norris <briannorris@chromium.org>, Lin Huang <hl@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-rockchip@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Caesar Wang <wxt@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 9. Juli 2018, 22:57:54 CEST schrieb Enric Balletbo i Serra:
> Commit 0fbc47d9e426 ("phy: rockchip-typec: deprecate some DT properties
> for various register fields.") deprecates some Rockchip Type-C
> properties. As these are now not needed, remove from the device tree
> file.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

applied for 4.19

Thanks
Heiko
