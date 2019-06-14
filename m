From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] ARM: dts: rockchip: Configure BT_HOST_WAKE as wake-up signal on veyron
Date: Fri, 14 Jun 2019 11:38:03 +0200
Message-ID: <8216847.YA7l6QMt1s@phil>
References: <20190610235144.34261-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610235144.34261-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 11. Juni 2019, 01:51:44 CEST schrieb Matthias Kaehlcke:
> From: Doug Anderson <dianders@chromium.org>
> 
> This enables wake up on Bluetooth activity when the device is
> suspended. The BT_HOST_WAKE signal is only connected on devices
> with BT module that are connected through UART.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.3

Thanks
Heiko
