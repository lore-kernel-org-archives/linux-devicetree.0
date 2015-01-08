From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 3/3] mtd: spi-nand: add devicetree binding
Date: Thu, 8 Jan 2015 00:15:59 -0300
Message-ID: <54ADF66F.7090400@imgtec.com>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB425@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A04AB425@NTXXIAMBX02.xacn.micron.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?gbk?Q?=22Peter_Pan_=C5=CB=B6=B0_=28peterpandong=29=22?= <peterpandong@micron.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>, =?gbk?Q?=22Frank_Liu_=C1=F5=C8=BA_=28frankliu=29=22?= <frankliu@micron.com>, =?gbk?Q?=22Melanie_Zhang_=D5=C5=D1=E0_=28me?= =?gbk?Q?laniezhang=29=22?= <melaniezhang@micron.com>
List-Id: devicetree@vger.kernel.org



On 01/07/2015 09:52 PM, Peter Pan =C5=CB=B6=B0 (peterpandong) wrote:
> This commit adds the devicetree binding document that specifies the
> spi nand devices support.
>=20
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  Documentation/devicetree/bindings/mtd/spi-nand.txt | 22 ++++++++++++=
++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/spi-nand.txt
> new file mode 100644
> index 0000000..9dd3efd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> @@ -0,0 +1,22 @@
> +* NAND driver for MT29F, GD5F and similar SPI NAND flash chips
> +
> +Required properties:
> +- #address-cells, #size-cells : Must be present if the device has su=
b-nodes
> +  representing partitions.
> +- compatible : Should be the manufacturer and the name of the chip. =
Bear in mind
>=20

Unless I'm mistaken, we don't need the chip ID here, as SPI NAND allows
to autodetect the device. Any reason why we can't just use a generic
compatible "spi-nand" here?
--=20
Ezequiel
