From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v9 2/5] dt-bindings: Add a binding for Mediatek xHCI
 host controller
Date: Thu, 8 Oct 2015 19:37:32 +0800
Message-ID: <1444304252.26198.4.camel@mhfsdcap03>
References: <1443495698-32233-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1443495698-32233-3-git-send-email-chunfeng.yun@mediatek.com>
	 <560AA4E0.3030705@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <560AA4E0.3030705@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, 2015-09-29 at 17:49 +0300, Sergei Shtylyov wrote:
> On 09/29/2015 06:01 AM, Chunfeng Yun wrote:
> 
> > add a DT binding documentation of xHCI host controller for the
> > MT8173 SoC from Mediatek.
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   .../devicetree/bindings/usb/mt8173-xhci.txt        | 52 ++++++++++++++++++++++
> >   1 file changed, 52 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> >
> > diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > new file mode 100644
> > index 0000000..0c96273
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > @@ -0,0 +1,52 @@
> [...]
> > +
> > +Example:
> > +usb30: usb@11270000 {
> [...]
> > +	status = "okay";
> 
>     This line is not needed.
> 
I will remove it.

Thanks

> [...]
> 
> MBR, Sergei
> 
