From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net,v2 1/2] net: ethernet: mediatek: Fix MT7629 missing
 GMII mode support
Date: Mon, 07 Oct 2019 18:29:51 +0000
Message-ID: <20191007182951.Horde.3g45LJ1CPqFA0OM9CNZND4A@www.vdorst.com>
References: <20191007070844.14212-1-Mark-MC.Lee@mediatek.com>
 <20191007070844.14212-2-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007070844.14212-2-Mark-MC.Lee@mediatek.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: MarkLee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting MarkLee <Mark-MC.Lee@mediatek.com>:

> Add missing configuration for mt7629 gmii mode support
>
> Fixes: 7e538372694b ("net: ethernet: mediatek: Re-add support SGMII")
> Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
> --
> v1->v2:
> * no change
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c  
> b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index c61069340f4f..703adb96429e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -261,6 +261,7 @@ static void mtk_mac_config(struct phylink_config  
> *config, unsigned int mode,
>  		ge_mode = 0;
>  		switch (state->interface) {
>  		case PHY_INTERFACE_MODE_MII:
> +		case PHY_INTERFACE_MODE_GMII:
>  			ge_mode = 1;
>  			break;
>  		case PHY_INTERFACE_MODE_REVMII:
> --
> 2.17.1

Reviewed-by: René van Dorst <opensource@vdorst.com>
