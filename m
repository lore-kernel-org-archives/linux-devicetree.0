From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [v7, PATCH 2/2] dt-binding: mediatek-dwmac: add binding document
 for MediaTek MT2712 DWMAC
Date: Thu, 13 Dec 2018 13:36:58 +0100
Message-ID: <20181213123658.GG1605@lunn.ch>
References: <1544666173-5121-1-git-send-email-biao.huang@mediatek.com>
 <1544666173-5121-3-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544666173-5121-3-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, liguo.zhang@mediatek.com, mark.rutland@arm.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, joabreu@synopsys.com
List-Id: devicetree@vger.kernel.org

> +- mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
> +	It should be defined for rgmii/rgmii-txid/mii/rmii interface.
> +Both delay properties need to be a multiple of 170 for fine-tune rgmii,
> +range 0~31*170.
> +Both delay properties need to be a multiple of 550 for coarse-tune rgmii,
> +range 0~31*550.
> +Both delay properties need to be a multiple of 550 for mii/rmii,
> +range 0~31*550.

You see "need to be" here, but the driver does not care. It will round
down. Please either make the driver check, or change the text to
rather say it will round down.

       Andrew
