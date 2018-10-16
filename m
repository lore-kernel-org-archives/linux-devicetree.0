Return-Path: <SRS0=BDUW=M4=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20181016045846.2345-1-peter.chen@nxp.com> <20181016045846.2345-5-peter.chen@nxp.com>
In-Reply-To: <20181016045846.2345-5-peter.chen@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Oct 2018 13:24:40 -0300
Message-ID: <CAOMZO5Cts2=Y10P0bAXDRTnQ7trgzwb2EBpxjcV7GBY7HwXKCA@mail.gmail.com>
Subject: Re: [PATCH 4/4] doc: usb: ci-hdrc-usb2: Add pinctrl properties for
 HSIC pin groups
Content-Type: text/plain; charset="UTF-8"
To: Peter Chen <peter.chen@nxp.com>
Cc: USB list <linux-usb@vger.kernel.org>, Schrempf Frieder <frieder.schrempf@exceet.de>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Peter,

On Tue, Oct 16, 2018 at 2:02 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> For USB HSIC, the data and strobe pin needs to be pulled down
> at default, we consider it as "idle" state. When the USB host
> is ready to be used, the strobe pin needs to be pulled up,
> we consider it as "active" state.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index 529e51879fb2..10c8d793ea49 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -81,6 +81,7 @@ Optional properties:
>    mux state of 1 indicates host mode.
>  - mux-control-names: Shall be "usb_switch" if mux-controls is specified.
>  - pinctrl-names: Names for optional pin modes in "default", "host", "device"
> +  Or names for HSIC "idle" and "active" pin modes.

I don't think this description is clear enough.

Could you please add a real dts snippet for the HSIC case instead?
