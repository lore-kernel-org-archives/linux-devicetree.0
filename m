From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v2 4/5] net-next: ethernet: mediatek: add
 device_node of GMAC pointing into the netdev instance
Date: Wed, 22 Mar 2017 11:23:03 -0700
Message-ID: <7a6d4273-bdac-42f5-9f50-a43bdd952495@gmail.com>
References: <1490088910-19405-1-git-send-email-sean.wang@mediatek.com>
 <1490088910-19405-5-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1490088910-19405-5-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, matthias.bgg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, davem@davemloft.net, Landen.Chao@mediatek.com, keyhaede@gmail.com, objelf@gmail.com
List-Id: devicetree@vger.kernel.org

On 03/21/2017 02:35 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> the patch adds the setup of the corresponding device node of GMAC into the
> netdev instance which could allow other modules such as DSA to find the
> instance through the node in dt-bindings using of_find_net_device_by_node()
> call.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
