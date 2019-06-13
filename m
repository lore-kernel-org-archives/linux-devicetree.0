From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
Date: Thu, 13 Jun 2019 17:06:07 -0600
Message-ID: <20190613230607.GA10347@bogus>
References: <20190520175605.2405-1-dianders@chromium.org>
 <20190520175605.2405-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520175605.2405-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de, Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, zyw@rock-chips.com, mka@chromium.org, ryandcase@chromium.org, Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 20 May 2019 10:56:03 -0700, Douglas Anderson wrote:
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
> NOTE FOR REPOST:
> - In v2 Rob said [1] he'd prefer something based on the SoC
>   compatibility string, but that doesn't work because not all boards
>   will have the regulator setup / board design / suspend logic
>   necessary to make this work.
> 
> [1] https://lkml.kernel.org/r/20190430012328.GA25660@bogus
> 
> 
> Changes in v3: None
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
