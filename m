Return-Path: <SRS0=2R+r=HA=linux.intel.com=heikki.krogerus@kernel.org>
Date: Wed, 11 Apr 2018 10:26:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: role: rcar-usb3-role-switch: add support for R-Car
 SoCs
Message-ID: <20180411072606.GA7517@kuha.fi.intel.com>
References: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523361826-8772-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 10, 2018 at 09:03:46PM +0900, Yoshihiro Shimoda wrote:
> This patch adds role switch support for R-Car SoCs. Some R-Car SoCs
> (e.g. R-Car H3) have USB 3.0 dual-role device controller which has
> the USB 3.0 xHCI host and Renesas USB 3.0 peripheral.
> 
> Unfortunately, the mode change register contains the USB 3.0 peripheral
> controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
> manages this register. However, in peripheral mode, the host should
> stop. Also the host hardware needs to reinitialize its own registers
> when the mode changes from peripheral to host mode. Otherwise,
> the host cannot work correctly (e.g. detect a device as high-speed).
> 
> To achieve this by a driver, this role switch driver manages
> the mode change register and attach/release the xhci-plat driver.
> The renesas_usb3 udc driver should call devm_of_platform_populate()
> to probe this driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../bindings/usb/renesas,rcar-usb3-role-sw.txt     |  23 +++
>  drivers/usb/roles/Kconfig                          |  12 ++
>  drivers/usb/roles/Makefile                         |   1 +
>  drivers/usb/roles/rcar-usb3-role-switch.c          | 200 +++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
>  create mode 100644 drivers/usb/roles/rcar-usb3-role-switch.c
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
> new file mode 100644
> index 0000000..752bc16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-usb3-role-sw.txt
> @@ -0,0 +1,23 @@
> +Renesas Electronics R-Car USB 3.0 role switch driver
> +
> +A renesas_usb3's node can contain this node.
> +
> +Required properties:
> + - compatible: Must contain "renesas,rcar-usb3-role-switch".
> + - renesas,host: phandle of the usb3.0 host.
> +
> +Example of R-Car H3 ES2.0:
> +	usb3_peri0: usb@ee020000 {
> +		compatible = "renesas,r8a7795-usb3-peri",
> +			     "renesas,rcar-gen3-usb3-peri";
> +		reg = <0 0xee020000 0 0x400>;
> +		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cpg CPG_MOD 328>;
> +		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +		resets = <&cpg 328>;
> +
> +		usb3-role-sw {
> +			compatible = "renesas,rcar-usb3-role-switch";
> +			renesas,host = <&xhci0>;

I pretty sure you should model that connection using OF graph
bindings. That way I believe this will also fit nicely to the
usb-connector bindings. Check bindings/connector/usb-connector.txt

> +		};
> +	};


Br,

-- 
heikki
