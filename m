From: David Miller <davem@davemloft.net>
Subject: Re: [v6, PATCH 0/2] add Ethernet driver support for mt2712
Date: Wed, 12 Dec 2018 15:40:59 -0800 (PST)
Message-ID: <20181212.154059.943420976868382142.davem@davemloft.net>
References: <1544607332-29921-1-git-send-email-biao.huang@mediatek.com>
        <20181212.152114.107710423985118689.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212.152114.107710423985118689.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

From: David Miller <davem@davemloft.net>
Date: Wed, 12 Dec 2018 15:21:14 -0800 (PST)

> From: Biao Huang <biao.huang@mediatek.com>
> Date: Wed, 12 Dec 2018 17:35:30 +0800
> 
>> Changes in v6:
>>  modifications according to comments from Rob/Andrew/Sean:
>>  1. use delay_ps instead of delay stage.
>>  2. add comments in driver to avoid confusion.
>>  2. rewrite set_delay function.
>>  3. modify binding document for properties: tx-delay-ps/rx-delay-ps/pericfg etc.
> 
> Series applied to net-next, thank you.

Please send me a follow-up patch to fix this:

WARNING: modpost: missing MODULE_LICENSE() in drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.o

Thank you.
