From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v2 3/3] dt-bindings: net: ethernet: Update
 mt7622 docs and dts to reflect the new phylink API
Date: Tue, 27 Aug 2019 16:51:03 -0500
Message-ID: <20190827215103.GA9401@bogus>
References: <20190821144336.9259-1-opensource@vdorst.com>
 <20190821144336.9259-4-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821144336.9259-4-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 04:43:36PM +0200, René van Dorst wrote:
> This patch the removes the recently added mediatek,physpeed property.
> Use the fixed-link property speed = <2500> to set the phy in 2.5Gbit.
> See mt7622-bananapi-bpi-r64.dts for a working example.
> 
> Signed-off-by: René van Dorst <opensource@vdorst.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> --
> v1->v2:
> * SGMII port only support BASE-X at 2.5Gbit.
> ---
>  .../arm/mediatek/mediatek,sgmiisys.txt        |  2 --

Bindings and dts files should be separate patches.


>  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 28 +++++++++++++------
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  1 -
>  3 files changed, 19 insertions(+), 12 deletions(-)

In any case,

Acked-by: Rob Herring <robh@kernel.org>
