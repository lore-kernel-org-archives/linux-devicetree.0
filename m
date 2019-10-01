From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net 1/2] net: ethernet: mediatek: Fix MT7629 missing GMII
 mode support
Date: Tue, 1 Oct 2019 14:42:06 +0200
Message-ID: <20191001124206.GC869@lunn.ch>
References: <20191001123150.23135-1-Mark-MC.Lee@mediatek.com>
 <20191001123150.23135-2-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001123150.23135-2-Mark-MC.Lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MarkLee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@openwrt.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rene van Dorst <opensource@vdorst.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 08:31:49PM +0800, MarkLee wrote:
> Add missing configuration for mt7629 gmii mode support
> 
> Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>

Hi Mark

Since this is for net, it should have a Fixes: tag.

Thanks
	Andrew
