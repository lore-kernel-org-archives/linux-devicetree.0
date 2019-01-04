From: yunfei.dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: Fix MTK document for vcodec
Date: Fri, 4 Jan 2019 11:32:27 +0800
Message-ID: <1546572747.12334.3.camel@mhfsdcap03>
References: <1545978785-31375-1-git-send-email-yunfei.dong@mediatek.com>
 <20190103231722.GA22018@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190103231722.GA22018@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Qianqian Yan <qianqian.yan@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your advice, I already sent the second patch.

Change note:
1: modify the subject for 0001*
2: modify the description for 0003

Best Regards,
Yunfei Dong


On Thu, 2019-01-03 at 17:17 -0600, Rob Herring wrote:
> On Fri, Dec 28, 2018 at 02:33:03PM +0800, Yunfei Dong wrote:
> > Fix MTK binding document for MT8173 dtsi changed in order
> > to use standard CCF interface.
> > MT8173 SoC from Mediatek.
> 
> A better subject would be "add 'assigned-clocks' to vcodec examples".
> 
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek-vcodec.txt   | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index 2a615d84a682..b6b5dde6abd8 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -66,6 +66,15 @@ vcodec_dec: vcodec@16000000 {
> >                    "vencpll",
> >                    "venc_lt_sel",
> >                    "vdec_bus_clk_src";
> > +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +                      <&topckgen CLK_TOP_CCI400_SEL>,
> > +                      <&topckgen CLK_TOP_VDEC_SEL>,
> > +                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> > +                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> > +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
> > +                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> > +                             <&topckgen CLK_TOP_VCODECPLL>;
> > +    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
> >    };
> >  
> >    vcodec_enc: vcodec@18002000 {
> > @@ -105,4 +114,8 @@ vcodec_dec: vcodec@16000000 {
> >                    "venc_sel",
> >                    "venc_lt_sel_src",
> >                    "venc_lt_sel";
> > +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> > +                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> > +    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> > +                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
> >    };
> > -- 
> > 2.19.1
> > 
