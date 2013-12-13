From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v6 01/15] usb: doc: phy-mxs: Add more compatible strings
Date: Fri, 13 Dec 2013 08:15:45 +0100
Message-ID: <20131213081545.0185d3cb@ipc1.ka-ro>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
	<1386897825-6130-2-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1386897825-6130-2-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org, marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, alexander.shishkin@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Peter Chen wrote:
> Add "fsl,imx6q-usbphy" for imx6dq and imx6dl, add
> "fsl,imx6sl-usbphy" for imx6sl.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  Documentation/devicetree/bindings/usb/mxs-phy.txt |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Docu=
mentation/devicetree/bindings/usb/mxs-phy.txt
> index 5835b27..d850e55 100644
> --- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
> +++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
> @@ -1,7 +1,8 @@
>  * Freescale MXS USB Phy Device
> =20
>  Required properties:
> -- compatible: Should be "fsl,imx23-usbphy"
> +- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-usb=
phy"
> +for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
>
indentation?


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
