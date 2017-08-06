From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add support for rk3399 sapphire SOM
Date: Sun, 06 Aug 2017 17:41:56 +0200
Message-ID: <4583753.YODAZBW2BI@phil>
References: <1501756357-10511-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501756357-10511-1-git-send-email-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kever.yang@rock-chips.com, mark.yao@rock-chips.com, zhangqing@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 3. August 2017, 18:32:36 CEST schrieb Jacob Chen:
> Add support for the rk3399 sapphire SOM board.
> This board works in a combination with the excavator main board.
> 
> You can get more info from below link:
> http://opensource.rock-chips.com/wiki_Excavator_sapphire_board
> 
> Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>

applied for 4.14 with some property reordering and also replacing
the clkreqn pinctrl with the clkreqn_cpm pinctrl as clkreqn was removed
as nonworking, see

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=75ea96deec456c3e7aba375115ed530b425d5897
and
https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=461a00bb9d539e0a78ad48e5c593f3d145f45c13

Please double check that I didn't break anything


Thanks
Heiko
