From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: bindings for the Aspeed memory controllers
Date: Mon, 12 Dec 2016 11:13:26 +1100
Message-ID: <CACPK8XfZi-nr7PEqqjao8q21crK=nVp1eSYytEX3_xKPO0SU_A@mail.gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org> <1481302167-28044-5-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481302167-28044-5-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/aspeed-smc.txt         | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Docum=
entation/devicetree/bindings/mtd/aspeed-smc.txt
> new file mode 100644
> index 000000000000..e2c88cea38f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> @@ -0,0 +1,51 @@
> +* Aspeed Firmware Memory controller
> +* Aspeed SPI Flash Memory Controller
> +
> +The Firmware Memory Controller in the Aspeed AST2500 SoC supports
> +three chip selects, two of which are always of SPI type and the third
> +can be SPI or NOR type flash, but the driver only supports SPI.

As the bindings are a description of the hardware and not the driver,
we might want to reword this. Perhaps "these bindings only describe
SPI"?

Cheers,

Joel

> +
> +The two SPI flash memory controllers in the AST2500 each support two
> +chip selects.
> +
> +Required properties:
> +  - compatible : Should be one of
> +       "aspeed,ast2400-fmc" for the AST2400 Firmware Memory Controller
> +       "aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
> +       "aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
> +       "aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
> +
> +  - reg : the first contains the control register location and length,
> +          the second contains the memory window mapping address and leng=
th
> +  - #address-cells : must be 1 corresponding to chip select child bindin=
g
> +  - #size-cells : must be 0 corresponding to chip select child binding
> +
> +Optional properties:
> +  - interrupts : Should contain the interrupt for the dma device if an
> +    FMC
> +
> +The child nodes are the SPI flash modules which must have a compatible
> +property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Optionally, the child node can contain properties for SPI mode (may be
> +ignored):
> +  - spi-max-frequency - max frequency of spi bus
> +
> +
> +Example:
> +fmc: fmc@1e620000 {
> +       compatible =3D "aspeed,ast2500-fmc";
> +       reg =3D < 0x1e620000 0x94
> +               0x20000000 0x02000000 >;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       interrupts =3D <19>;
> +       flash@0 {
> +               reg =3D < 0 >;
> +               compatible =3D "jedec,spi-nor";
> +               /* spi-max-frequency =3D <>; */
> +               /* m25p,fast-read; */
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +       };
> +};
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
