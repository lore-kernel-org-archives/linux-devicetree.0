From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 2/3] ARM: shmobile: koelsch: enable HS-USB
Date: Thu, 9 Oct 2014 10:07:34 +0900
Message-ID: <5435DFD6.3050609@renesas.com>
References: <1511869.4ca9KHmSFr@wasted.cogentembedded.com> <8674731.7YYzQeH0h1@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <8674731.7YYzQeH0h1@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello.

(2014/10/09 3:02), Sergei Shtylyov wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Enable HS-USB device for the Koelsch board, defining the GPIO that the driver
> should check when probing (which is the ID output from MAX3355 OTG chip).
> 
> Note that there will be pinctrl-related error messages if both internal PCI
> and HS-USB drivers are enabled but they should be just ignored.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [Sergei: added pin function/group and prop, moved device node, fixed summary,
> added changelog]
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 3:
> - added pinctrl-related properties;
> - moved the HS-USB node to precede the USB PHY node;
> - uppercased "arm" in the summary;
> - added changelog.
> 
>  arch/arm/boot/dts/r8a7791-koelsch.dts |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> Index: renesas/arch/arm/boot/dts/r8a7791-koelsch.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ renesas/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -464,6 +464,13 @@
>  	pinctrl-names = "default";
>  };
>  
> +&hsusb {
> +	status = "okay";
> +	pinctrl-0 = <&usb0_pins>;
> +	pinctrl-names = "default";

Perhaps I don't understand the pinctrl world yet, but I have a question.

In r8a7791, the USB0_PWEN is GP7_23 and the USB0_OVC is GP7_24. And,
the "usb0_pins" is related to these USB0 pins. But, as you know,
the koelsch has a OTG ID pin and it connects to GP5_31 via MAX3355 chip.
So, would you tell me why koelsch needs the pinctrl?

Best regards,
Yoshihiro Shimoda

> +	renesas,enable-gpio = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> +};
> +
>  &usbphy {
>  	status = "okay";
>  };
> 
