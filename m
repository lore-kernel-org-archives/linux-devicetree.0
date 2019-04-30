From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc2: Document quirk to reset
 PHY upon wakeup
Date: Mon, 29 Apr 2019 19:53:57 -0500
Message-ID: <20190430005357.GA13695@bogus>
References: <20190416215351.242246-1-dianders@chromium.org>
 <20190416215351.242246-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190416215351.242246-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 16, 2019 at 02:53:48PM -0700, Douglas Anderson wrote:
> On Rockchip rk3288 there's a hardware quirk where we need to assert
> the reset signal to the PHY when we get a remote wakeup on one of the
> two ports.  Document this quirk in the bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 6dc3c4a34483..f70f3aee4bfc 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
>  - g-rx-fifo-size: size of rx fifo size in gadget mode.
>  - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
>  - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
> +- snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
> +                          we detect a wakeup.  This is due to a hardware errata.

Synopsys or Rockchip errata?

Ideally, this should be implied by the controller or phy compatible.

Rob
