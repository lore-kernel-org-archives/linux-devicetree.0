From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: usb: mtk-xhci: add an optional xhci_ck
 clock
Date: Fri, 12 Jul 2019 09:53:54 +0800
Message-ID: <1562896434.32589.26.camel@mhfsdcap03>
References: <5e06482a0be15476c7b5825f155accf98275afa8.1560246390.git.chunfeng.yun@mediatek.com>
         <9b6ad8dee142d73b56d653ecb7475c4ed28e5eb8.1560246390.git.chunfeng.yun@mediatek.com>
         <20190709142235.GA11951@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709142235.GA11951@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Jumin Li <jumin.li@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-09 at 08:22 -0600, Rob Herring wrote:
> On Wed, Jun 12, 2019 at 01:55:19PM +0800, Chunfeng Yun wrote:
> > Add a new optional clock xhci_ck
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > index 266c2d917a28..91c0704b586b 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
> > @@ -29,6 +29,7 @@ Required properties:
> >  	"sys_ck": controller clock used by normal mode,
> >  	the following ones are optional:
> >  	"ref_ck": reference clock used by low power mode etc,
> > +	"xhci_ck": controller clock,
> >  	"mcu_ck": mcu_bus clock for register access,
> >  	"dma_ck": dma_bus clock for data transfer by DMA
> 
> A new clock should go at the end to stay backwards compatible.
Ok, will fix it, thanks
> 
> >  
> > @@ -100,7 +101,7 @@ Required properties:
> >   - clocks : a list of phandle + clock-specifier pairs, one for each
> >  	entry in clock-names
> >   - clock-names : must contain "sys_ck", and the following ones are optional:
> > -	"ref_ck", "mcu_ck" and "dma_ck"
> > +	"ref_ck", "xhci_ck", "mcu_ck" and "dma_ck"
> >  
> >  Optional properties:
> >   - vbus-supply : reference to the VBUS regulator;
> > -- 
> > 2.21.0
> > 
