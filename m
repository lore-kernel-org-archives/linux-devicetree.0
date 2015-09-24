From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/2] usb: doc: Add bindings for ULPI platform driver
Date: Thu, 24 Sep 2015 11:14:06 -0500
Message-ID: <CAL_Jsq+=ZafWLj6nScGgVeBOS7qg=h-=Qri43932HdJiSxGExg@mail.gmail.com>
References: <1443012841-13673-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443012841-13673-1-git-send-email-sbhatta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Cc: Felipe Balbi <balbi@ti.com>, Peter Chen <peter.chen@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 7:54 AM, Subbaraya Sundeep Bhatta
<subbaraya.sundeep.bhatta@xilinx.com> wrote:
> This patch adds binding doc info for generic ULPI PHYs
> platform driver.
>
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
> ---
>  .../devicetree/bindings/usb/ulpi-platform-phy.txt  |   34 ++++++++++++++++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> new file mode 100644
> index 0000000..7b8cbb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> @@ -0,0 +1,34 @@
> +Platform driver for generic ULPI PHYs

Platform driver has nothing to do with DT bindings.

> +
> +Required properties:
> +- compatible           : Should be "ulpi-phy"

This needs a more specific compatible in addition.

> +- reg                  : Physical base address and size of the USB
> +                         controller registers map to which this PHY
> +                         is connected.
> +- view-port            : Should contain viewport register offset of the
> +                         USB controller to which this PHY is connected

This is a property of the controller, not the phy.

> +Optional properties:
> +- drv-vbus             : required if turning VBUS on/off has to be driven
> +                         by writing to PHY. This feature depends on board
> +                         design.
> +
> +Example:
> +Below example shows the PHY binding for Chipidea USB controller which has
> +ulpi viewport register at 0x0170
> +
> +               usb_phy0: phy0 {
> +                       compatible = "ulpi-phy";
> +                       reg = <0xe0002000 0x1000>;
> +                       view-port = <0x0170>;
> +                       drv-vbus;
> +               };
> +
> +               usb0: usb@e0002000 {
> +                        compatible = "chipidea,usb2";
> +                        interrupt-parent = <&intc>;
> +                        interrupts = <0 21 4>;
> +                        reg = <0xe0002000 0x1000>;
> +                        phy_type = "ulpi";
> +                       dr_mode = "host";
> +                       usb-phy = <&usb_phy0>;

usb-phy is deprecated. Use phys and the generic phy binding instead.

> +                };
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
