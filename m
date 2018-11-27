Return-Path: <SRS0=JFxn=OG=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20181127092824.22756-1-peter.chen@nxp.com> <20181127092824.22756-5-peter.chen@nxp.com>
In-Reply-To: <20181127092824.22756-5-peter.chen@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Nov 2018 09:09:50 -0200
Message-ID: <CAOMZO5CV9Hk5ORnmjOLSZv5bk61nc2Ljq_4vKvRvAvO_F=Fzxg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Content-Type: text/plain; charset="UTF-8"
To: Peter Chen <peter.chen@nxp.com>
Cc: USB list <linux-usb@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On Tue, Nov 27, 2018 at 7:31 AM PETER CHEN <peter.chen@nxp.com> wrote:
>
> For USB HSIC, the data and strobe pin needs to be pulled down
> at default, we consider it as "idle" state. When the USB host
> is ready to be used, the strobe pin needs to be pulled up,
> we consider it as "active" state.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 529e51879fb2..1e5e7ddfb1a5 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -80,7 +80,10 @@ Optional properties:
>    controller. It's expected that a mux state of 0 indicates device mode and a
>    mux state of 1 indicates host mode.
>  - mux-control-names: Shall be "usb_switch" if mux-controls is specified.
> -- pinctrl-names: Names for optional pin modes in "default", "host", "device"
> +- pinctrl-names: Names for optional pin modes in "default", "host", "device".
> +  In case of HSIC-mode, "idle" and "active" pin modes are mandatory. In this
> +  case, the "idle" state needs to pull down the data and strobe pin
> +  and the "active" state needs to pull up the strobe pin.
>  - pinctrl-n: alternate pin modes
>
>  i.mx specific properties
> @@ -110,4 +113,7 @@ Example:
>                 phy-clkgate-delay-us = <400>;
>                 mux-controls = <&usb_switch>;
>                 mux-control-names = "usb_switch";
> +               pinctrl-names = "idle", "active";
> +               pinctrl-0 = <&pinctrl_usbh2_1>;
> +               pinctrl-1 = <&pinctrl_usbh2_2>;

I would put the "idle" and "active" entries inside a explicit section for HSIC.

Otherwise, it may confuse people using non-HSIC bindings.
