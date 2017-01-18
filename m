From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] Documentation: mtk-quadspi: update DT bindings
Date: Wed, 18 Jan 2017 16:08:09 -0600
Message-ID: <20170118220809.pmaa2f3kwiddehti@rob-hp-laptop>
References: <1484291609-20195-1-git-send-email-guochun.mao@mediatek.com>
 <1484291609-20195-2-git-send-email-guochun.mao@mediatek.com>
 <20170113151326.11e9451a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113151326.11e9451a@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guochun Mao <guochun.mao@mediatek.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 03:13:26PM +0100, Boris Brezillon wrote:
> On Fri, 13 Jan 2017 15:13:28 +0800
> Guochun Mao <guochun.mao@mediatek.com> wrote:
> 
> > Add "mediatek,mt2701-nor" for nor flash node's compatible.
> > 
> > Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> > ---
> >  .../devicetree/bindings/mtd/mtk-quadspi.txt        |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > index fb314f0..f83d31d 100644
> > --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> > @@ -1,7 +1,9 @@
> >  * Serial NOR flash controller for MTK MT81xx (and similar)
> >  
> >  Required properties:
> > -- compatible: 	  should be "mediatek,mt8173-nor";
> > +- compatible: 	  should contain:
> > +		  "mediatek,mt2701-nor" for MT2701,
> > +		  "mediatek,mt8173-nor" for MT8173.
> 
> Do you need to define a new compatible? If the IPs are exactly the same
> in both SoCs it shouldn't be needed.

Rather the 2701 should contain both strings in that case.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
