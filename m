From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Date: Mon, 04 Mar 2019 19:23:50 +0100
Message-ID: <1551723830.4932.3@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-2-paul@crapouillou.net> <20190304105014.0cceea0a@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304105014.0cceea0a@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Mon, Mar 4, 2019 at 10:50 AM, Miquel Raynal=20
<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>>=20
> wrote on Sat,  9 Feb 2019 16:22:58
> -0300:
>=20
>>  The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes=20
>> more
>>  sense to use the more generic ECC term.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>>
>>  ---
>>=20
>>  Changes:
>>=20
>>  v3: New patch
>>=20
>>  v4: No change
>>=20
>>   .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18=20
>> +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt=20
>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  index a5b940f18bf6..5a45cc54f46d 100644
>>  --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  @@ -1,4 +1,4 @@
>>  -* Ingenic JZ4780 NAND/BCH
>>  +* Ingenic JZ4780 NAND/ECC
>>=20
>>   This file documents the device tree bindings for NAND flash=20
>> devices on the
>>   JZ4780. NAND devices are connected to the NEMC controller=20
>> (described in
>>  @@ -14,10 +14,10 @@ Required NAND controller device properties:
>>     an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC=20
>> bank).
>>=20
>>   Optional NAND controller device properties:
>>  -- ingenic,bch-controller: To make use of the hardware BCH=20
>> controller, this
>>  -  property must contain a phandle for the BCH controller node. The=20
>> required
>>  +- ingenic,bch-controller: To make use of the hardware ECC=20
>> controller, this
>>  +  property must contain a phandle for the ECC controller node. The=20
>> required
>=20
> I think there is already a 'ecc-engine' property used by MTK and Atmel
> NAND controllers to point to the ECC engine block. Please use this
> property instead of the ingenic specific one.

ingenic,bch-controller is already in the devicetree ABI. I can't change=20
it now...

>>     properties for this node are described below. If this is not=20
>> specified,
>>  -  software BCH will be used instead.
>>  +  software ECC will be used instead.
>>=20
>>   Optional children nodes:
>>   - Individual NAND chips are children of the NAND controller node.
>>  @@ -70,17 +70,17 @@ nemc: nemc@13410000 {
>>   	};
>>   };
>>=20
>>  -The BCH controller is a separate SoC component used for error=20
>> correction on
>>  +The ECC controller is a separate SoC component used for error=20
>> correction on
>>   NAND devices. The following is a description of the device=20
>> properties for a
>>  -BCH controller.
>>  +ECC controller.
>>=20
>>  -Required BCH properties:
>>  +Required ECC properties:
>>   - compatible: Should be one of:
>>     * ingenic,jz4740-ecc
>>     * ingenic,jz4725b-bch
>>     * ingenic,jz4780-bch
>>  -- reg: Should specify the BCH controller registers location and=20
>> length.
>>  -- clocks: Clock for the BCH controller.
>>  +- reg: Should specify the ECC controller registers location and=20
>> length.
>>  +- clocks: Clock for the ECC controller.
>>=20
>>   Example:
>>=20
>=20
> Thanks,
> Miqu=E8l

=
