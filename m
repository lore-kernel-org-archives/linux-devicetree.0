From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong rt5514 dmic delay property for Gru
Date: Sat, 19 Aug 2017 01:07:43 +0200
Message-ID: <2229813.qu8LfHYij4@phil>
References: <20170818144808.27869-1-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170818144808.27869-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, briannorris@chromium.org, broonie@kernel.org, dianders@chromium.org, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Am Freitag, 18. August 2017, 22:48:08 CEST schrieb Jeffy Chen:
> According to rt5514 dt-binding, it should be "realtek,dmic-init-delay-ms".
> 
> Fixes: 48f4d9796d99 (arm64: dts: rockchip: add Gru/Kevin DTS)
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

applied for 4.14


Thanks
Heiko
