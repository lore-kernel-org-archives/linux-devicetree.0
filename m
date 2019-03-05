From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add support for the Orange Pi RK3399 board.
Date: Tue, 05 Mar 2019 01:09:02 +0100
Message-ID: <6883364.SkcVJV222b@phil>
References: <20190222184419.14469-1-aballier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222184419.14469-1-aballier@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexis Ballier <aballier@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. Februar 2019, 19:44:19 CET schrieb Alexis Ballier:
> This adds basic support for the Orange Pi RK3399 board.
> What works:
> - SD card / emmc.
> - Debug UART
> - Ethernet
> - USB: Type C, internal USB3 for SATA, 4 USB 2.0 ports
> - Sensors: All of them but the Hall sensor.
> - Buttons
> - Wifi, Bluetooth
> - HDMI out
> 
> Signed-off-by: Alexis Ballier <aballier@gentoo.org>

I did reorder some nodes and properties and also moved the binding
entry to its correct alphabetical position and applied the patch for 5.2

Thanks
Heiko
