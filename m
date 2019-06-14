From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add support for Khadas Edge/Edge-V/Captain boards
Date: Fri, 14 Jun 2019 13:32:41 +0200
Message-ID: <4566563.QzcLDyM7tj@phil>
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com> <1560153473-17190-1-git-send-email-xieqinick@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560153473-17190-1-git-send-email-xieqinick@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xieqinick@gmail.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, nick@khadas.com
List-Id: devicetree@vger.kernel.org

Am Montag, 10. Juni 2019, 09:57:53 CEST schrieb xieqinick@gmail.com:
> From: Nick Xie <nick@khadas.com>
> 
> Add devicetree support for Khadas Edge/Edge-V/Captain boards.
> Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.
> Khadas Captain is the carrier board for Khadas Edge.
> Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>

applied for 5.3 after doing some style-fixes to the edge.dtsi
(2 missing gpio constants, some newlines and sdio-regulator
references were missing "<..>")

Please double-check the result


Thanks
Heiko
