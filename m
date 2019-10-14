From: MarkLee <Mark-MC.Lee@mediatek.com>
Subject: [PATCH net,v3 1/2] net: ethernet: mediatek: Fix MT7629 missing GMII mode support
Date: Mon, 14 Oct 2019 15:15:17 +0800
Message-ID: <20191014071518.11923-2-Mark-MC.Lee@mediatek.com>
References: <20191014071518.11923-1-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191014071518.11923-1-Mark-MC.Lee@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rene van Dorst <opensource@vdorst.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub Kicinski <jakub.kicinski@netronome.com>, MarkLee <Mark-MC.Lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

In the original design, mtk_phy_connect function will set ge_mode=1
if phy-mode is GMII(PHY_INTERFACE_MODE_GMII) and then set the correct
ge_mode to ETHSYS_SYSCFG0 register. This logic was broken after apply  
mediatek PHYLINK patch(Fixes tag), the new mtk_mac_config function will
not set ge_mode=1 for GMII mode hence the final ETHSYS_SYSCFG0 setting 
will be incorrect for mt7629 GMII mode. This patch add the missing logic
back to fix it.
			 
Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
