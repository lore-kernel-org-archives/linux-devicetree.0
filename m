From: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and FAST
 reads
Date: Thu, 20 Oct 2016 14:54:20 +0000
Message-ID: <AM4PR0401MB1841BD90C29964BB2324E2CE97D50@AM4PR0401MB1841.eurprd04.prod.outlook.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <69a5b0d7-6b89-7edc-738d-c9e25802ba31@atmel.com>,
 <20161020091630.3477efab.albert.aribaud@3adev.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20161020091630.3477efab.albert.aribaud@3adev.fr>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Albert ARIBAUD <albert.aribaud@3adev.fr>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Yunhui Cui <yunhui.cui@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



________________________________________
From: Albert ARIBAUD <albert.aribaud@3adev.fr>
Sent: Thursday, October 20, 2016 1:16 AM
To: Cyrille Pitchen
Cc: linux-mtd@lists.infradead.org; Yunhui Cui; devicetree@vger.kernel.org; =
Han Xu
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and F=
AST reads

Hi Cyrille,

Le Wed, 19 Oct 2016 18:42:36 +0200, Cyrille Pitchen
<cyrille.pitchen@atmel.com> a =E9crit :

> Hi Albert,
>
> +Yunhui


> It seems that both Yunhui and you work on the same topic, maybe you can
> synchronize?
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc=
hwork.ozlabs.org%2Fpatch%2F660356%2F&data=3D01%7C01%7Chan.xu%40nxp.com%7C4b=
7dcf6422694f68dc1408d3f8b90a4d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=
=3DWjiiPqupc9bGtqixGvPeFoBddg51SJwehI4L0Zup9RY%3D&reserved=3D0

I am already preparing a v2 based over Yunhui's series. :)

> I don't think it is a good thing to select the relevant "READ" LUT entry
> according to the command op code. What if spi-nor.c introduces new op cod=
es?
>
> Maybe you could index the LUT entries by functions:
> - READ_REG: the LUT op code would be dynamically updated by your
>             .read_reg(nor, opcode, ...) implementation according to opcod=
e.
> - WRITE_REG: the same as above with the .write_reg(nor, opcode, ...) hook.
> - READ_SLAVE1: read memory from the first SPI-NOR memory.
> - WRITE_SLAVE1: write into the first SPI-NOR memory.
> - READ_SLAVE2: read memory form the 2nd SPI-NOR memory.
> ...
> - WRITE_SLAVEN: write into the N-th SPI-NOR memory.

Actually, my needs could be met using Han Xu's dynamic LUT entries
without the need to introduce 'virtual' opcodes (and without having
to 'leak back' those new opcodes into other kernel code portions).

The per-slave differences (in my case, bus width essentially) can be
managed though DT entries and corresponding per-nor flags in the driver.

> Also be aware even for the .read() hook the nor->read_opcode might changes
> between calls!

Noted -- I'll check that the driver always use the current NOR codes.

> I don't know whether those comments fit your actual needs and the Freesca=
le SPI
> controller hardware constraints but I'm always worried about the ease to =
maintain
> SPI-NOR controller drivers when they are not "op code agnostic".

Understood and agreed.

Thanks for yuor feedback!

Good. I have another question about Yunhui's patch set. Who are in charge o=
f review
and merge code change in spi-nor.c? Some patches have been pending for a wh=
ile.

> Best regards,
>
> Cyrille

Cordialement,
Albert ARIBAUD
3ADEV

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
