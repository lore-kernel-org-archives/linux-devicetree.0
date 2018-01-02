From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] PCI: imx6: Add PHY reference clock source support
Date: Tue, 2 Jan 2018 20:54:50 -0200
Message-ID: <CAOMZO5AFC9dxhsQjmRrDA7Z3KMkEemryKOBmQhXm19NXKxHkKQ@mail.gmail.com>
References: <AM5PR0402MB28505BE42AB7774EC90927E18C040@AM5PR0402MB2850.eurprd04.prod.outlook.com>
 <1514709094-4110-1-git-send-email-ilya@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1514709094-4110-1-git-send-email-ilya@compulab.co.il>
Sender: linux-pci-owner@vger.kernel.org
To: Ilya Ledvich <ilya@compulab.co.il>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ilya,

+ Rob and dt list

On Sun, Dec 31, 2017 at 6:31 AM, Ilya Ledvich <ilya@compulab.co.il> wrote:
> i.MX7D variant of the IP can use either Crystal Oscillator input
> or internal clock input as a Reference Clock input for PCIe PHY.
> Add support for an optional property 'pcie-phy-refclk-internal'.
> If present then an internal clock input is used as PCIe PHY
> reference clock source. By default an external oscillator input
> is still used.
>
> Verified on Compulab SBC-iMX7 Single Board Computer.
>
> Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 +++++
>  drivers/pci/dwc/pci-imx6.c                               | 8 +++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index 7b1e48b..581bc09 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> @@ -50,6 +50,11 @@ Additional required properties for imx7d-pcie:
>                - "pciephy"
>                - "apps"
>
> +Additional optional properties for imx7d-pcie:
> +- pcie-phy-refclk-internal: If present then an internal PLL input is used as
> +  PCIe PHY reference clock source. By default an external oscillator input
> +  is used.

Should this contain the vendor prefix, like fsl,pcie-phy-refclk-internal ?
