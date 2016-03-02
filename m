From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: remove broken-cd from emmc and sdio
Date: Wed, 02 Mar 2016 22:46:50 +0100
Message-ID: <1583449.b52WQDyKXa@diego>
References: <1453774019-10225-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453774019-10225-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 26. Januar 2016, 10:06:59 schrieb Shawn Lin:
> Only one of "broken-cd" and "non-removable" should be supplied
> according to Documentation/devicetree/bindings/mmc/mmc.txt.
> Obviously emmc and sdio-wifi are non-removable devices, while
> broken-cd is for removable device whose card detect pin is broken.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my dts32 branch

Thanks
Heiko
