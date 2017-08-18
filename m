From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Assign mic irq to correct device for Gru
Date: Sat, 19 Aug 2017 01:17:26 +0200
Message-ID: <1737976.DtYLZJGtdQ@phil>
References: <20170816092432.23991-1-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170816092432.23991-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffy Chen <jeffy.chen@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, hychao@chromium.org, briannorris@chromium.org, dianders@chromium.org, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. August 2017, 17:24:32 CEST schrieb Jeffy Chen:
> Currently we are assigning mic irq to rt5514 i2c driver, which is wrong.
> Assign it to rt5514 spi driver instead.
> 
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>

applied for 4.14


Thanks
Heiko
