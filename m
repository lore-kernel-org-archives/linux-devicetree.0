From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/6] mtd: nand: =?UTF-8?Q?vf=36=31=30=5Fnfc=3A=20Fr?=
 =?UTF-8?Q?eescale=20NFC=20for=20VF=36=31=30=2C=20MPC=35=31=32=35=20and=20?=
 =?UTF-8?Q?others?=
Date: Wed, 03 Jun 2015 11:45:50 +0200
Message-ID: <821b4731043fef279b6a82b920707982@agner.ch>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
 <20150603081059.GA6944@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150603081059.GA6944@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, mark.rutland@arm.com, boris.brezillon@free-electrons.com, aaron@tastycactus.com, marb@ixxat.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: devicetree@vger.kernel.org

On 2015-06-03 10:10, Sebastian Andrzej Siewior wrote:
> On 2015-03-25 17:28:24 [+0100], Stefan Agner wrote:
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_n=
fc.c
>> new file mode 100644
>> index 0000000..23c1510
>> --- /dev/null
>> +++ b/drivers/mtd/nand/vf610_nfc.c
> =E2=80=A6
>> +static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column,=
 int page)
>> +{
>> +	if (column !=3D -1) {
>> +		if (nfc->chip.options | NAND_BUSWIDTH_16)
>> +			column =3D column/2;
>> +		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
>> +				    COL_ADDR_SHIFT, column);
>> +	}
>> +	if (page !=3D -1)
>> +		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
>> +				    ROW_ADDR_SHIFT, page);
>> +}
>=20
> Do you have here also a different NAND layout on your boot-page vs
> remaining pages? The mpc5125 has this different layout.

There is the boot configuration block which uses a Parity 13/8
algorithm, is it that you are referring to? The format parity is in the
main area, hence it doesn't clash with the HW ECC of the controller. On=
e
can use normal NAND write functions to write this page. See the
implementation in our downstream U-Boot:

http://git.toradex.com/cgit/u-boot-toradex.git/commit/?h=3D2015.04-tora=
dex-next&id=3Db004926168f3bc15f9e26f14c16ae60a252b1304

--
Stefan
