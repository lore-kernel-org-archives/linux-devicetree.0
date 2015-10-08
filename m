From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
Date: Thu, 8 Oct 2015 18:22:36 -0300
Message-ID: <CAAEAJfBtOtiEEJy500-Kg8ZHm+ZGF3vL7y7xJD3a0-3CJ0w33A@mail.gmail.com>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
	<1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alex Smith <alex.smith@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Paul Burton <paul.burton@imgtec.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, Alex Smith <alex@alex-smith.me.uk>
List-Id: devicetree@vger.kernel.org

On 6 October 2015 at 13:27, Harvey Hunt <harvey.hunt@imgtec.com> wrote:
> From: Alex Smith <alex.smith@imgtec.com>
>
> Add device tree nodes for the NEMC and BCH to the JZ4780 device tree,
> and make use of them in the Ci20 device tree to add a node for the
> board's NAND.
>
> Note that since the pinctrl driver is not yet upstream, this includes
> neither pin configuration nor busy/write-protect GPIO pins for the
> NAND. Use of the NAND relies on the boot loader to have left the pins
> configured in a usable state, which should be the case when booted
> from the NAND.
>
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> ---
> v6 -> v7:
>  - Add nand-ecc-mode to DT.
>  - Add nand-on-flash-bbt to DT.
>
> v4 -> v5:
>  - New patch adding DT nodes for the NAND so that the driver can be
>    tested.
>
>  arch/mips/boot/dts/ingenic/ci20.dts    | 54 ++++++++++++++++++++++++=
++++++++++
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 26 ++++++++++++++++
>  2 files changed, 80 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts=
/ingenic/ci20.dts
> index 9fcb9e7..453f1d3 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -42,3 +42,57 @@
>  &uart4 {
>         status =3D "okay";
>  };
> +
> +&nemc {
> +       status =3D "okay";
> +
> +       nand: nand@1 {
> +               compatible =3D "ingenic,jz4780-nand";
> +               reg =3D <1 0 0x1000000>;
> +

Why is this in the ci20.dts instead of the SoC dtsi?

Seems at least compatible and reg is not board-specific.

Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
