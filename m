From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add support for rk3399 excavator main board
Date: Sun, 06 Aug 2017 17:44:20 +0200
Message-ID: <1833135.MvGxPPiF9h@phil>
References: <1501756357-10511-1-git-send-email-jacob-chen@iotwrt.com> <1501756357-10511-2-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501756357-10511-2-git-send-email-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kever.yang@rock-chips.com, mark.yao@rock-chips.com, zhangqing@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. August 2017, 18:32:37 CEST schrieb Jacob Chen:
> Add support for the rk3399 excavator main board.
> This board works in a combination with the sapphire SOM.
> 
> This board have been sold as the rk3399 evaluation board for commercial customers.
> You can get more info from below link:
> http://opensource.rock-chips.com/wiki_Excavator_sapphire_board
> 
> Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>


> +&spdif {
> +	pinctrl-0 = <&spdif_bus>;

part of the core spdif node in rk3399 so dropped this one

> +	i2c-scl-rising-time-ns = <450>;
> +	i2c-scl-falling-time-ns = <15>;
> +	#sound-dai-cells = <0>;
> +	status = "okay";
> +};

applied for 4.14 with the above and some property reordering.
I've also added an entry to
	Documentation/devicetree/bindings/arm/rockchip.txt
for the board. When adding future boards, please always also add an
entry for that.


Thanks
Heiko
