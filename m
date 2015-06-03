From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Date: Wed, 3 Jun 2015 10:10:59 +0200
Message-ID: <20150603081059.GA6944@breakpoint.cc>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427300909-20825-2-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, mark.rutland@arm.com, boris.brezillon@free-electrons.com, aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: devicetree@vger.kernel.org

On 2015-03-25 17:28:24 [+0100], Stefan Agner wrote:
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nf=
c.c
> new file mode 100644
> index 0000000..23c1510
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
=E2=80=A6
> +static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, =
int page)
> +{
> +	if (column !=3D -1) {
> +		if (nfc->chip.options | NAND_BUSWIDTH_16)
> +			column =3D column/2;
> +		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +				    COL_ADDR_SHIFT, column);
> +	}
> +	if (page !=3D -1)
> +		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +				    ROW_ADDR_SHIFT, page);
> +}

Do you have here also a different NAND layout on your boot-page vs
remaining pages? The mpc5125 has this different layout.

Sebastian
