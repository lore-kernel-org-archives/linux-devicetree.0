From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [Patch v2 1/6] soc: qcom: gsbi: Add support for ADM CRCI muxing
Date: Fri, 30 Jan 2015 10:32:58 -0600
Message-ID: <B36DEAB1-2D89-4B6B-991E-C2EDBEB684D9@codeaurora.org>
References: <1422599135-5588-1-git-send-email-agross@codeaurora.org> <1422599135-5588-2-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1422599135-5588-2-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Jan 30, 2015, at 12:25 AM, Andy Gross <agross@codeaurora.org> wrote:

> This patch adds automatic configuration for the ADM CRCI muxing requi=
red to
> support DMA operations for GSBI clients.  The GSBI mode and instance =
determine
> the correct TCSR ADM CRCI MUX value that must be programmed so that t=
he DMA
> works properly.
>=20
> Signed-off-by: Andy Gross <agross@codeaurora.org>
> ---
> .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   18 ++-
> drivers/soc/qcom/Kconfig                           |    1 +
> drivers/soc/qcom/qcom_gsbi.c                       |  153 +++++++++++=
+++++++++
> 3 files changed, 171 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt=
 b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
> index 4ce24d4..8fe7b37 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
> @@ -6,7 +6,7 @@ configuration settings.  The mode setting will govern=
 the input/output mode of
> the 4 GSBI IOs.
>=20
> Required properties:
> -- compatible: must contain "qcom,gsbi-v1.0.0" for APQ8064/IPQ8064
> +- compatible:	Should contain "qcom,gsbi-v1.0.0"
> - reg: Address range for GSBI registers
> - clocks: required clock
> - clock-names: must contain "iface" entry
> @@ -16,12 +16,16 @@ Required properties:
> Optional properties:
> - qcom,crci : indicates CRCI MUX value for QUP CRCI ports.  Please re=
ference
>   dt-bindings/soc/qcom,gsbi.h for valid CRCI mux values.
> +- syscon-tcsr: indicates phandle of TCSR syscon node.  Required if c=
hild uses
> +  dma.
>=20
> Required properties if child node exists:
> - #address-cells: Must be 1
> - #size-cells: Must be 1
> - ranges: Must be present
>=20
> +Note: Each GSBI should have an alias correctly numbered in "aliases"=
 node.
> +
> Properties for children:
>=20
> A GSBI controller node can contain 0 or more child nodes representing=
 serial
> @@ -37,6 +41,10 @@ Example for APQ8064:
>=20
> #include <dt-bindings/soc/qcom,gsbi.h>
>=20
> +	aliases {
> +		gsbi4 =3D <&gsbi4>;
> +	};

You appear to be using the alias name to determine a index number for t=
he gsbi, if that is the case, than you should probably just add a cell-=
index node to the gsbi=92s for this purpose.

> +
> 	gsbi4@16300000 {
> 		compatible =3D "qcom,gsbi-v1.0.0";
> 		reg =3D <0x16300000 0x100>;
> @@ -48,6 +56,8 @@ Example for APQ8064:
> 		qcom,mode =3D <GSBI_PROT_I2C_UART>;
> 		qcom,crci =3D <GSBI_CRCI_QUP>;
>=20
> +		syscon-tcsr =3D <&tcsr>;
> +
> 		/* child nodes go under here */
>=20
> 		i2c_qup4: i2c@16380000 {
> @@ -76,3 +86,9 @@ Example for APQ8064:
> 		};
> 	};
>=20
> +	tcsr: syscon@1a400000 {
> +		compatible =3D "qcom,apq8064-tcsr", "syscon";
> +		reg =3D <0x1a400000 0x100>;
> +	};
> +
> +

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
