From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: musb: Add support for MediaTek
 musb controller
Date: Tue, 8 Jan 2019 09:30:14 +0800
Message-ID: <1546911014.4433.27.camel@mhfsdcap03>
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
         <1545896066-897-2-git-send-email-min.guo@mediatek.com>
         <20190107204015.GF25910@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107204015.GF25910@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-01-07 at 14:40 -0600, Bin Liu wrote:
> Hi,
> 
> On Thu, Dec 27, 2018 at 03:34:23PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > This adds support for MediaTek musb controller in
> > host, peripheral and otg mode
> > 
> > Signed-off-by: Min Guo <min.guo@mediatek.com>
> > ---
> >  .../devicetree/bindings/usb/mediatek,musb.txt      | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > new file mode 100644
> > index 0000000..e899c9b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
> > @@ -0,0 +1,49 @@
> > +MediaTek musb DRC/OTG controller
> 
> s/DRC/DRD/

I will modify it in next patch.

> > +-------------------------------------------
> > +
> > +Required properties:
> 
> [snip]
> 
> > +Example:
> > +
> > +usb2: usb@11200000 {
> > +	compatible = "mediatek,mt2701-musb";
> 
> s/;/,/

I will modify it in next patch.

> > +		"mediatek,mtk-musb";
> 
> Regards,
> -Bin.
