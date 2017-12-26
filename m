From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 2/2] net: mediatek: remove superfluous pin setup
 for MT7622 SoC
Date: Tue, 26 Dec 2017 12:06:10 -0500 (EST)
Message-ID: <20171226.120610.873465773072675214.davem@davemloft.net>
References: <e366efc29985d3292c8a1afb1389b5eac57c9037.1513762066.git.sean.wang@mediatek.com>
        <e3bd43a5337df719e791bc9902135a0916a951ff.1513762066.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3bd43a5337df719e791bc9902135a0916a951ff.1513762066.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, john@phrozen.org, nbd@openwrt.org, nelson.chang@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: <sean.wang@mediatek.com>
Date: Wed, 20 Dec 2017 17:47:06 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Remove superfluous pin setup to get out of accessing invalid I/O pin
> registers because the way for pin configuring tends to be different from
> various SoCs and thus it should be better being managed and controlled by
> the pinctrl driver which MT7622 already can support.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied to net-next.
