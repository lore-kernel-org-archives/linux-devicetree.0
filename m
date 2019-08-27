From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: imx6q-pcie: add
 "fsl,pcie-phy-refclk-internal" for i.MX7D
Date: Tue, 27 Aug 2019 10:56:26 -0500
Message-ID: <20190827155626.GA29948@bogus>
References: <20190813103759.38358-1-git@andred.net>
 <20190813103759.38358-2-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190813103759.38358-2-git@andred.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 11:37:59AM +0100, Andr=E9 Draszik wrote:
> The i.MX7D variant of the IP can use either an external
> crystal oscillator input or an internal clock input as
> a reference clock input for the PCIe PHY.
> =

> Document the optional property 'fsl,pcie-phy-refclk-internal'
> =

> Signed-off-by: Andr=E9 Draszik <git@andred.net>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/D=
ocumentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index a7f5f5afa0e6..985d7083df9f 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> @@ -56,6 +56,11 @@ Additional required properties for imx7d-pcie and imx8=
mq-pcie:
>  	       - "turnoff"
>  - fsl,imx7d-pcie-phy: A phandle to an fsl,imx7d-pcie-phy node.

Not sure how this got in, but why is the phy binding not used here?

>  =

> +Additional optional properties for imx7d-pcie:
> +- fsl,pcie-phy-refclk-internal: If present then an internal PLL input is=
 used
> +  as PCIe PHY reference clock source. By default an external ocsillator =
input
> +  is used.

Can't the clock binding and maybe 'assigned-clocks' be used here? =


Also, this is a property of the PHY, so it belongs in the PHY's node.

Rob
