Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 12:13:02 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH/RFC v4 2/4] usb: gadget: udc: renesas_usb3: Add register
 of usb role switch
Message-ID: <20180522171302.GA21363@rob-hp-laptop>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526990469-20739-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526990469-20739-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, May 22, 2018 at 09:01:07PM +0900, Yoshihiro Shimoda wrote:
> This patch adds role switch support for R-Car SoCs into the USB 3.0
> peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
> dual-role device controller which has the USB 3.0 xHCI host and
> Renesas USB 3.0 peripheral.
> 
> Unfortunately, the mode change register contains the USB 3.0 peripheral
> controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
> manages this register now. However, in peripheral mode, the host
> should stop. Also the host hardware needs to reinitialize its own
> registers when the mode changes from peripheral to host mode.
> Otherwise, the host cannot work correctly (e.g. detect a device as
> high-speed).
> 
> To achieve this by a driver, this role switch driver manages
> the mode change register and attach/release the xhci-plat driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 15 ++++

Please split bindings to a separate patch.

>  drivers/usb/gadget/udc/Kconfig                     |  1 +
>  drivers/usb/gadget/udc/renesas_usb3.c              | 82 ++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index 2c071bb5..f6105aa 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -19,6 +19,9 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - The connection to a usb3.0 host node needs by using OF graph bindings for
> +    usb role switch.
> +   - port@0 = USB3.0 host port.

On the host side, this might conflict with the USB connector binding. 

I would either make sure this can work with the connector binding by 
having 2 endpoints on the HS or SS port or just use the 'companion' 
property defined in usb-generic.txt.

Rob
