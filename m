From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: fix Rockpro64 RK808 interrupt line
Date: Sun, 29 Sep 2019 21:58:36 +0200
Message-ID: <2631784.KOmX0qhJ1H@phil>
References: <20190921131457.36258-1-sigmaris@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921131457.36258-1-sigmaris@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Akash Gajjar <Akash_Gajjar@mentor.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 21. September 2019, 15:14:57 CEST schrieb Hugh Cole-Baker:
> Fix the pinctrl and interrupt specifier for RK808 to use GPIO3_B2. On the
> Rockpro64 schematic [1] page 16, it shows GPIO3_B2 used for the interrupt
> line PMIC_INT_L from the RK808, and there's a note which translates as:
> "PMU termination GPIO1_C5 changed to this".
> 
> Tested by setting an RTC wakealarm and checking /proc/interrupts counters.
> Without this patch, neither the rockchip_gpio_irq counter for the RK808,
> nor the RTC alarm counter increment when the alarm time is reached.
> With this patch, both interrupt counters increment by 1 as expected.
> 
> [1] http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> 
> Fixes: e4f3fb4 ("arm64: dts: rockchip: add initial dts support for Rockpro64")
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>

applied as fix for 5.4

Thanks
Heiko
