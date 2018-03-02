From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: add bindings doc for HiSilicon INNO
 USB2 PHY
Date: Fri, 2 Mar 2018 15:37:43 +0800
Message-ID: <20180302073740.GC28619@dragon>
References: <1519888940-23235-1-git-send-email-shawn.guo@linaro.org>
 <1519888940-23235-2-git-send-email-shawn.guo@linaro.org>
 <c1f60df2-20d1-53ac-6cf7-9c81baea789c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1f60df2-20d1-53ac-6cf7-9c81baea789c@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pengcheng Li <lpc.li@hisilicon.com>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Fri, Mar 02, 2018 at 11:55:57AM +0530, Kishon Vijay Abraham I wrote:
> On Thursday 01 March 2018 12:52 PM, Shawn Guo wrote:
> > From: Pengcheng Li <lpc.li@hisilicon.com>
> > 
> > It adds device tree bindings document for HiSilicon INNO USB2 PHY.
> > 
> > Signed-off-by: Pengcheng Li <lpc.li@hisilicon.com>
> > Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> > new file mode 100644
> > index 000000000000..b563cf54ca7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> > @@ -0,0 +1,52 @@
> > +HiSilicon INNO USB2 PHY
> > +
> > +Required properties:
> > +- compatible: Should be one of the following strings:
> > +	"hisilicon,inno-usb2-phy",
> > +	"hisilicon,hi3798cv200-usb2-phy".
> > +- reg: Should be the address space for PHY configuration register in peripheral
> > +  controller, e.g. PERI_USB0 for USB 2.0 PHY01 on Hi3798cv200 SoC.
> > +- #phy-cells: Should be 1. The specifier is the index of the PHY port to
> > +  reference.
> 
> This can be '0' if the consumers directly use phandle to the subnodes.

Yes, I understand that for most of PHY devices #phy-cells is just 0, and
consumers simply use the phandle without any cell number.  But for this
inno-usb2-phy, every single device contains two PHY ports, and each port
can be connected to different USB controller.  That said, for each
inno-usb2-phy device, we need to create two phy devices and register
them to PHY core system.  And the phy-cell number is used by consumers
to specify the PHY port id.

Shawn
