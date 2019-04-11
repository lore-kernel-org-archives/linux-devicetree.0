From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ARM: dts: rockchip: Add BT_EN to the power sequence for veyron
Date: Thu, 11 Apr 2019 13:38:32 +0200
Message-ID: <5092711.5oqtbe4BJ2@phil>
References: <20190409231405.189335-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409231405.189335-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 10. April 2019, 01:14:05 CEST schrieb Matthias Kaehlcke:
> Add GPIO D5 (BT_ENABLE_L) as reset-GPIO to the power sequence for the
> Bluetooth/WiFi module. On devices with a Broadcom module the signal
> needs to be asserted to use Bluetooth.
> 
> Note that BT_ENABLE_L is a misnomer in the schematics, the signal
> actually is active-high.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

applied for 5.2 with Doug's rb.

Thanks
Heiko
