From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 2/3] dt-bindings: net: dsa: mt7530: Add
 support for port 5
Date: Tue, 3 Sep 2019 18:28:53 +0100
Message-ID: <20190903172853.GA14176@bogus>
References: <20190902130226.26845-1-opensource@vdorst.com>
 <20190902130226.26845-3-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902130226.26845-3-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  2 Sep 2019 15:02:25 +0200, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= wrote:
> MT7530 port 5 has many modes/configurations.
> Update the documentation how to use port 5.
> 
> Signed-off-by: René van Dorst <opensource@vdorst.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> ---
> v2->v3:
> * Remove 'status = "okay";' lines, suggested by Rob Herring
> v1->v2:
> * Adding extra note about RGMII2 and gpio use.
> rfc->v1:
> * No change
> 
>  .../devicetree/bindings/net/dsa/mt7530.txt    | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
