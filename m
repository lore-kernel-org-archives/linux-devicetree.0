From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Remove unnecessary setting of UART0 SCLK rate on veyron
Date: Thu, 11 Apr 2019 13:36:41 +0200
Message-ID: <1607560.o8nNNBouYe@phil>
References: <20190410183010.21307-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410183010.21307-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 10. April 2019, 20:30:10 CEST schrieb Matthias Kaehlcke:
> Some veyron devices have a Bluetooth controller connected on UART0.
> The UART needs to operate at a high speed, however setting the clock
> rate at initialization has no practical effect. During initialization
> user space adjusts the UART baudrate multiple times, which ends up
> changing the SCLK rate. After a successful initiatalization the clk
> is running at the desired speed (48MHz).
> 
> Remove the unnecessary clock rate configuration from the DT.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.2 with Doug's RB.

Thanks
Heiko
