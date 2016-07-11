From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/5] usb: dwc3: add phyif_utmi_quirk
Date: Mon, 11 Jul 2016 09:54:47 -0500
Message-ID: <20160711145447.GA16636@rob-hp-laptop>
References: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
 <1467860066-15142-4-git-send-email-william.wu@rock-chips.com>
 <2213342.0Nx5tnEW8p@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2213342.0Nx5tnEW8p@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: William Wu <william.wu@rock-chips.com>, gregkh@linuxfoundation.org, balbi@kernel.org, linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2016 at 02:33:09PM +0200, Heiko Stuebner wrote:
> Hi William,
> 
> Am Donnerstag, 7. Juli 2016, 10:54:24 schrieb William Wu:
> > Add a quirk to configure the core to support the
> > UTMI+ PHY with an 8- or 16-bit interface. UTMI+ PHY
> > interface is hardware property, and it's platform
> > dependent. Normall, the PHYIf can be configured
> > during coreconsultant. But for some specific usb
> > cores(e.g. rk3399 soc dwc3), the default PHYIf
> > configuration value is fault, so we need to
> > reconfigure it by software.
> > 
> > And refer to the dwc3 databook, the GUSB2PHYCFG.USBTRDTIM
> > must be set to the corresponding value according to
> > the UTMI+ PHY interface.
> > 
> > Signed-off-by: William Wu <william.wu@rock-chips.com>
> > ---
> [...]
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > b/Documentation/devicetree/bindings/usb/dwc3.txt index 020b0e9..8d7317d
> > 100644
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > @@ -42,6 +42,10 @@ Optional properties:
> >   - snps,dis-u2-freeclk-exists-quirk: when set, clear the
> > u2_freeclk_exists in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
> >  			a free-running PHY clock.
> > + - snps,phyif-utmi-quirk: when set core will set phyif UTMI+ interface.
> > + - snps,phyif-utmi: the value to configure the core to support a UTMI+
> > PHY +			with an 8- or 16-bit interface. Value 0 select 8-bit
> > +			interface, value 1 select 16-bit interface.
> 
> maybe
> 	snps,phyif-utmi-width = <8> or <16>;

Seems like this could be common. Any other bindings have something 
similar already? If not "utmi-width" is fine.

> 
> devicetree is about describing the hardware, not the things that get written 
> to registers :-) . The conversion from the described width to the register 
> value can easily be done in the driver.
> 
> 
> Also I don't think you need two properties for this. If the snps,phyif-utmi 
> property is specified it indicates that you want to manually set the width 
> and if it is absent you want to use the IC default. All functions reading 
> property-values indicate if the property is missing.

Agreed.

Rob
