From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/19] dt-bindings: phy-mmp3-usb: Add bindings
Date: Wed, 21 Aug 2019 16:13:22 -0500
Message-ID: <20190821211322.GA12457@bogus>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-5-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809093158.7969-5-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 11:31:43AM +0200, Lubomir Rintel wrote:
> This is the PHY chip for USB OTG on MMP3 platform.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../devicetree/bindings/phy/phy-mmp3-usb.txt     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> new file mode 100644
> index 0000000000000..b9623b98151bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> @@ -0,0 +1,16 @@
> +Marvell MMP3 USB PHY
> +--------------------
> +
> +Required properties:
> +- compatible: must be "marvell,mmp3-usb-phy"
> +- #phy-cells: must be 0
> +
> +Example:
> +	usb-phy: usbphy@d4207000 {

usb-phy@...

> +		compatible = "marvell,mmp3-usb-phy";
> +		reg = <0xd4207000 0x40>;
> +		#phy-cells = <0>;
> +	};
> +
> +This document explains the device tree binding. For general information
> +about PHY subsystem refer to Documentation/phy.txt

Drop this statement.


> -- 
> 2.21.0
> 
