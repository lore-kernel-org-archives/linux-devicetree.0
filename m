From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Date: Wed, 13 Mar 2019 09:59:48 -0300
Message-ID: <1552481988.2412.2@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-2-paul@crapouillou.net> <20190304105014.0cceea0a@xps13>
        <1551723830.4932.3@crapouillou.net> <20190304195852.45c056f6@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304195852.45c056f6@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le lun. 4 mars 2019 =E0 15:58, Miquel Raynal <miquel.raynal@bootlin.com>=20
a =E9crit :
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019=20
> 19:23:50
> +0100:
>=20
>>  On Mon, Mar 4, 2019 at 10:50 AM, Miquel Raynal=20
>> <miquel.raynal@bootlin.com> wrote:
>>  > Hi Paul,
>>  >
>>  > Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:22:58
>>  > -0300:
>>  >
>>  >>  The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it=20
>> makes >> more
>>  >>  sense to use the more generic ECC term.
>>  >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >>=20
>> <mailto:paul@crapouillou.net>>
>>  >>  ---
>>  >> >>  Changes:
>>  >> >>  v3: New patch
>>  >> >>  v4: No change
>>  >> >>   .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18=20
>> >> +++++++++---------
>>  >>   1 file changed, 9 insertions(+), 9 deletions(-)
>>  >> >>  diff --git >>=20
>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt >>=20
>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  index a5b940f18bf6..5a45cc54f46d 100644
>>  >>  ---=20
>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  +++=20
>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  @@ -1,4 +1,4 @@
>>  >>  -* Ingenic JZ4780 NAND/BCH
>>  >>  +* Ingenic JZ4780 NAND/ECC
>>  >> >>   This file documents the device tree bindings for NAND flash=20
>> >> devices on the
>>  >>   JZ4780. NAND devices are connected to the NEMC controller >>=20
>> (described in
>>  >>  @@ -14,10 +14,10 @@ Required NAND controller device properties:
>>  >>     an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC=20
>> >> bank).
>>  >> >>   Optional NAND controller device properties:
>>  >>  -- ingenic,bch-controller: To make use of the hardware BCH >>=20
>> controller, this
>>  >>  -  property must contain a phandle for the BCH controller node.=20
>> The >> required
>>  >>  +- ingenic,bch-controller: To make use of the hardware ECC >>=20
>> controller, this
>>  >>  +  property must contain a phandle for the ECC controller node.=20
>> The >> required
>>  >
>>  > I think there is already a 'ecc-engine' property used by MTK and=20
>> Atmel
>>  > NAND controllers to point to the ECC engine block. Please use this
>>  > property instead of the ingenic specific one.
>>=20
>>  ingenic,bch-controller is already in the devicetree ABI. I can't=20
>> change it now...
>=20
> Oh, right...
>=20
> Well, same thing as before, maybe you can change it and keep the=20
> driver
> backward compatible? I don't want new DT to use this property because
> it is not generic and we must have a way from the core to find the ECC
> engine handle when the controller does not embed one itself (thus, the
> ecc-engine property which is around for quite some time already).

I can do that. Will the new ECC framework work with the "ecc-engine"=20
property?

-Paul
=
