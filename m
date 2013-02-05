From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 08/13] USB: ehci-omap: Add device tree support and
 binding information
Date: Tue, 5 Feb 2013 12:33:46 +0000
Message-ID: <20130205123346.GB26842@e106331-lin.cambridge.arm.com>
References: <1359993540-20780-1-git-send-email-rogerq@ti.com>
 <1359993540-20780-9-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1359993540-20780-9-git-send-email-rogerq@ti.com>
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: "tony@atomide.com" <tony@atomide.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 04, 2013 at 03:58:55PM +0000, Roger Quadros wrote:
> Allows the OMAP EHCI controller to be specified via device tree.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  .../devicetree/bindings/usb/omap-ehci.txt          |   34 ++++++++++++++++++
>  drivers/usb/host/ehci-omap.c                       |   36 +++++++++++++++++++-
>  2 files changed, 69 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/omap-ehci.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/omap-ehci.txt b/Documentation/devicetree/bindings/usb/omap-ehci.txt
> new file mode 100644
> index 0000000..90e6e3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/omap-ehci.txt
> @@ -0,0 +1,34 @@
> +OMAP HS USB EHCI controller
> +
> +This device is usually the child of the omap-usb-host
> +Documentation/devicetree/bindings/mfd/omap-usb-host.txt
> +
> +Required properties:
> +
> +- compatible: should be "ti,omap-ehci"
> +- reg: should contain one register range i.e. start and length
> +- interrupt-parent: phandle to the interrupt controller
> +- interrupts: description of the interrupt line
> +
> +Optional properties:
> +
> +- phy: list of phandles to PHY nodes.
> +  This property is required if at least one of the ports are in
> +  PHY mode i.e. OMAP_EHCI_PORT_MODE_PHY

Any reason for not calling this "phys", given it's a list?

[...]

Thanks,
Mark.

