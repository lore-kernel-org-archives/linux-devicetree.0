From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v10 01/15] usb: doc: phy-mxs: Add more compatible
 strings
Date: Fri, 21 Feb 2014 09:13:46 +0000
Message-ID: <20140221091345.GA7541@e106331-lin.cambridge.arm.com>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
 <1392873284-9386-2-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392873284-9386-2-git-send-email-peter.chen@freescale.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "frank.li@freescale.com" <frank.li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 20, 2014 at 05:14:30AM +0000, Peter Chen wrote:
> Add "fsl,imx6q-usbphy" for imx6dq and imx6dl, add
> "fsl,imx6sl-usbphy" for imx6sl.
> 
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  Documentation/devicetree/bindings/usb/mxs-phy.txt |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> index 5835b27..b43d4c9e 100644
> --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> @@ -1,7 +1,8 @@
>  * Freescale MXS USB Phy Device
>  
>  Required properties:
> -- compatible: Should be "fsl,imx23-usbphy"
> +- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-usbphy"
> +  for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl

Minor nit, but could we restructure this as something like the
following, with each string on a new line:

- compatible: should contain:
    * "fsl,imx23-usbphy" for imx23 and imx28
    * "fsl,imx6q-usbphy" for imx6dq and imx6dl
    * "fsl,imx6sl-usbphy" for imx6sl

It makes it a bit easier to read.

I see the existing "fsl,imx23-usbphy" is used as a fallback for
"fsl,imx28-usbphy", "fsl,imx6q-usbphy", and "fsl,imx6sl-usbphy" in
existing DTs.

Is this expected going forward? It might be worth mentioning.

Otherwise this looks fine to me.

Thanks,
Mark.
