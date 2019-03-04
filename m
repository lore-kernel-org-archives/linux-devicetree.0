From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
Date: Mon, 04 Mar 2019 19:22:22 +0100
Message-ID: <1551723742.4932.2@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190304104554.09be4cd4@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304104554.09be4cd4@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Miquel,

On Mon, Mar 4, 2019 at 10:45 AM, Miquel Raynal=20
<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>>=20
> wrote on Sat,  9 Feb 2019 16:22:57
> -0300:
>=20
>>  Add compatible strings to probe the jz4780-nand and jz4780-bch=20
>> drivers
>>  from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>>
>>  ---
>>=20
>>  Changes:
>>=20
>>  v2: - Change 'ingenic,jz4725b-nand' compatible string to
>>        'ingenic,jz4740-nand' to reflect driver change
>>      - Add 'ingenic,jz4740-bch' compatible string
>>      - Document 'ingenic,oob-layout' property
>>=20
>>  v3: - Removed 'ingenic,oob-layout' property
>>      - Update compatible strings to what the driver supports
>>=20
>>  v4: No change
>>=20
>>   Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10=20
>> ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt=20
>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  index 29ea5853ca91..a5b940f18bf6 100644
>>  --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), and=20
>> thus NAND device nodes must
>>   be children of the NEMC node.
>>=20
>>   Required NAND controller device properties:
>>  -- compatible: Should be set to "ingenic,jz4780-nand".
>>  +- compatible: Should be one of:
>>  +  * ingenic,jz4740-nand
>>  +  * ingenic,jz4725b-nand
>>  +  * ingenic,jz4780-nand
>=20
> Wouldn't "-nand-controller" suffix be better? Of course in the driver
> you should still check for jz4780-nand.

So I would be compatible with:
* ingenic,jz4740-nand-controller
* ingenic,jz4725b-nand-controller
* ingenic,jz4780-nand
?

>>   - reg: For each bank with a NAND chip attached, should specify a=20
>> bank number,
>>     an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC=20
>> bank).
>>=20
>>  @@ -72,7 +75,10 @@ NAND devices. The following is a description of=20
>> the device properties for a
>>   BCH controller.
>>=20
>>   Required BCH properties:
>>  -- compatible: Should be set to "ingenic,jz4780-bch".
>>  +- compatible: Should be one of:
>>  +  * ingenic,jz4740-ecc
>>  +  * ingenic,jz4725b-bch
>>  +  * ingenic,jz4780-bch
>>   - reg: Should specify the BCH controller registers location and=20
>> length.
>>   - clocks: Clock for the BCH controller.
>>=20
>=20
> Thanks,
> Miqu=E8l

=
