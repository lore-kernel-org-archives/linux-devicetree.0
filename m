Return-Path: <SRS0=VbvA=V5=bootlin.com=miquel.raynal@kernel.org>
Date: Thu, 1 Aug 2019 09:13:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Message-ID: <20190801091310.035bc824@xps13>
In-Reply-To: <1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>
	<1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Mason Yang <masonccyang@mxic.com.tw>
Cc: marek.vasut@gmail.com, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, juliensu@mxic.com.tw, paul.burton@mips.com, liang.yang@amlogic.com, lee.jones@linaro.org, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Mason,

Mason Yang <masonccyang@mxic.com.tw> wrote on Thu,  1 Aug 2019 11:55:10
+0800:

> Document the bindings used by the Macronix raw NAND controller.
>=20
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 +++++++++++++++=
++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Docume=
ntation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..de37d60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,19 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> +- reg: should contain 1 entry for the registers
> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps", "send" and "send_dly"
> +- clocks: should contain 3 phandles for the "ps", "send" and
> +	 "send_dly" clocks
> +
> +Example:
> +
> +	nand: nand-controller@43c30000 {
> +		compatible =3D "mxicy,multi-itfc-v009-nand-morph";

"mxicy" looks strange to me, I know it has been used in the past and
cannot be removed, but I don't think it is wise to continue using it
while your use "mxic" in all your other contributions. I would update
the prefix to mxic here and fill-in the relevant doc.

Also, what is nand-morph? I thought we were okay for
the "-nand-controller" suffix.


Thanks,
Miqu=C3=A8l
