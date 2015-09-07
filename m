From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v4 2/3] dt-bindings: binding for jz4780-{nand,bch}
Date: Mon, 7 Sep 2015 14:16:15 -0300
Message-ID: <CAAEAJfCqnfD-QOiDu-d8+zoco7zuayCwY2B_+d+2dpJg280F1Q@mail.gmail.com>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
	<1438005019-28162-3-git-send-email-alex.smith@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438005019-28162-3-git-send-email-alex.smith@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Smith <alex.smith@imgtec.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On 27 July 2015 at 10:50, Alex Smith <alex.smith@imgtec.com> wrote:
> Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs=
,
> as well as the hardware BCH controller, used by the jz4780_{nand,bch}
> drivers.
>
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v3 -> v4:
>  - No change
>
> v2 -> v3:
>  - Rebase to 4.0-rc6
>  - Changed ingenic,ecc-size to common nand-ecc-step-size
>  - Changed ingenic,ecc-strength to common nand-ecc-strength
>  - Changed ingenic,busy-gpio to common rb-gpios
>  - Changed ingenic,wp-gpio to common wp-gpios
>
> v1 -> v2:
>  - Rebase to 4.0-rc3
> ---
>  .../bindings/mtd/ingenic,jz4780-nand.txt           | 57 ++++++++++++=
++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4=
780-nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nan=
d.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> new file mode 100644
> index 000000000000..1e8e2eeffbf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -0,0 +1,57 @@
> +* Ingenic JZ4780 NAND/BCH
> +
> +This file documents the device tree bindings for NAND flash devices =
on the
> +JZ4780. NAND devices are connected to the NEMC controller (described=
 in
> +memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device no=
des must
> +be children of the NEMC node.
> +
> +Required NAND device properties:
> +- compatible: Should be set to "ingenic,jz4780-nand".
> +- reg: For each bank with a NAND chip attached, should specify a ban=
k number,
> +  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
> +
> +Optional NAND device properties:
> +- ingenic,bch-device: To make use of the hardware BCH controller, th=
is property
> +  must contain a phandle for the BCH controller node. The required p=
roperties
> +  for this node are described below. If this is not specified, softw=
are BCH
> +  will be used instead.
> +- nand-ecc-step-size: ECC block size in bytes.
> +- nand-ecc-strength: ECC strength (max number of correctable bits).
> +- rb-gpios: GPIO specifier for the busy pin.
> +- wp-gpios: GPIO specifier for the write protect pin.
> +
> +Example:
> +
> +nemc: nemc@13410000 {
> +       ...
> +
> +       nand: nand@1 {
> +               compatible =3D "ingenic,jz4780-nand";
> +               reg =3D <1 0 0x1000000>;  /* Bank 1 */
> +
> +               ingenic,bch-device =3D <&bch>;

I believe it's slighly more common to use a -controller suffix for
such a property:

$ git grep "controller =3D <&" Documentation/devicetree/bindings/

Other than this, it looks good.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
