From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI
 binding document
Date: Mon, 15 Oct 2018 13:22:16 -0500
Message-ID: <20181015182216.GA29537@bogus>
References: <1538000414-24873-1-git-send-email-alcooperx@gmail.com>
 <1538000414-24873-2-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538000414-24873-2-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Cooper <alcooperx@gmail.com>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jianguo Sun <sunjianguo1@huawei.com>, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-f
List-Id: devicetree@vger.kernel.org

On Wed, Sep 26, 2018 at 06:20:10PM -0400, Al Cooper wrote:
> Add DT bindings document for Broadcom STB USB OHCI, EHCI and
> XHCI drivers.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  .../devicetree/bindings/usb/brcm,ehci-brcm.txt     | 22 +++++++++++++++++++++
>  .../devicetree/bindings/usb/brcm,ohci-brcm.txt     | 22 +++++++++++++++++++++
>  .../devicetree/bindings/usb/brcm,xhci-brcm.txt     | 23 ++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt b/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
> new file mode 100644
> index 000000000000..020b5ec40f5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
> @@ -0,0 +1,22 @@
> +Broadcom STB USB EHCI controller
> +
> +Required properties:
> +- compatible: should be "brcm,ehci-brcm-v2"

Needs an SoC specific compatible string.

> +- reg: should contain one register range i.e. start and length
> +- interrupts: description of the interrupt line
> +- phys: phandle + phy specifier pair
> +  The specifier should be 0 for the OHCI/EHCI PHY and 1 for the XHCI PHY

0 or 1 depends on the phy binding. This binding just needs to say how 
many phy specifiers there are.

> +
> +Optional properties:
> +- clocks: A list of phandles for the clocks

Need to say how many and the order.

> +
> +Example:
> +
> +ehci@f0b00300 {
> +	compatible = "brcm,ehci-brcm-v2";
> +	reg = <0xf0b00300 0xa8>;
> +	interrupts = <0x0 0x5a 0x0>;
> +	interrupt-names = "usb0_ehci_0";
> +	phys = <&usbphy_0 0x0>;
> +	clocks = <&usb20>
> +};

Similar comments in the other 2 files.
