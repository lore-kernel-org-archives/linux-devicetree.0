From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: soc: Add a binding for the Broadcom VCHI services.
Date: Mon, 5 Mar 2018 14:51:25 -0600
Message-ID: <CAL_Jsq+rEbghtLib4B-eQSLRtdODqeKVdXFJrPjb-JJbJgdpiA@mail.gmail.com>
References: <20180305202806.21219-1-eric@anholt.net> <20180305202806.21219-4-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180305202806.21219-4-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 5, 2018 at 2:28 PM, Eric Anholt <eric@anholt.net> wrote:
> The VCHI communication channel can be provided by BCM283x and Capri

VCHI or VCHIQ?

> SoCs, to communicate with the VPU-side OS services.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> new file mode 100644
> index 000000000000..4055a8977f3e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> @@ -0,0 +1,18 @@
> +Broadcom VCHIQ firmware services
> +
> +Required properties:
> +
> +- compatible:  Should be "brcm,bcm2835-vchiq"
> +- reg:         Physical base address and length of the doorbell register pair
> +- interrupts:  The interrupt number
> +                 See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +- firmware:    Reference to the RPi firmware device node

There's only one, just get it by compatible or path.

> +
> +Example:
> +
> +vchi@7e00b840 {
> +       compatible = "brcm,bcm2835-vchiq";
> +       reg = <0x7e00b840 0xf>;
> +       interrupts = <0 2>;
> +       firmware = <&firmware>;
> +};
> --
> 2.16.2
>
