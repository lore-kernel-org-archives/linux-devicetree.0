From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
Date: Mon, 29 Apr 2019 20:23:28 -0500
Message-ID: <20190430012328.GA25660@bogus>
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418001356.124334-4-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de, Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, zyw@rock-chips.com, mka@chromium.org, ryandcase@chromium.org, Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org, dinguyen@opensource.altera.com, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 05:13:54PM -0700, Douglas Anderson wrote:
> Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> support remote wakeup.  Allow specifying this as a device tree
> property.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> For relevant prior discussion on this patch, see:
> 
> https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org
> 
> I didn't make any changes from the prior version since I never found
> out what Rob thought of my previous arguments.  If folks want a
> change, perhaps they could choose from these options:
> 
> 1. Assume that all dwc2 hosts would like to keep their PHY on for
>    suspend if there's a USB wakeup enabled, thus we totally drop this
>    binding.  This doesn't seem super great to me since I'd bet that
>    many devices that use dwc2 weren't designed for USB wakeup (they
>    may not keep enough clocks or rails on) so we might be wasting
>    power for nothing.

1b. Use SoC specific compatible strings to enable/disable remote 
wake-up. We can debate what the default is I guess.

> 2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
>    it more obvious that this property is intended both to document
>    that wakeup from suspend is possible and that we need the PHY for
>    said wakeup.
> 3. Rename this property to "snps,can-wakeup-from-suspend" and assume
>    it's implicit that if we can wakeup from suspend that we need to
>    keep the PHY on.  If/when someone shows that a device exists using
>    dwc2 where we can wakeup from suspend without the PHY they can add
>    a new property.
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
