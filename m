From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/9] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
Date: Wed, 13 Mar 2019 09:55:34 -0300
Message-ID: <1552481734.2412.1@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190304104554.09be4cd4@xps13> <1551723742.4932.2@crapouillou.net>
        <20190304195149.7cca9c64@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304195149.7cca9c64@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Le lun. 4 mars 2019 =E0 15:51, Miquel Raynal <miquel.raynal@bootlin.com>=20
a =E9crit :
> Hi Paul,
>=20
>>  >>  ---=20
>> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  +++=20
>> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>>  >>  @@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt),=20
>> and >> thus NAND device nodes must
>>  >>   be children of the NEMC node.
>>  >> >>   Required NAND controller device properties:
>>  >>  -- compatible: Should be set to "ingenic,jz4780-nand".
>>  >>  +- compatible: Should be one of:
>>  >>  +  * ingenic,jz4740-nand
>>  >>  +  * ingenic,jz4725b-nand
>>  >>  +  * ingenic,jz4780-nand
>>  >
>>  > Wouldn't "-nand-controller" suffix be better? Of course in the=20
>> driver
>>  > you should still check for jz4780-nand.
>>=20
>>  So I would be compatible with:
>>  * ingenic,jz4740-nand-controller
>>  * ingenic,jz4725b-nand-controller
>>  * ingenic,jz4780-nand
>>  ?
>=20
> From a driver POV I would even prefer ingenic,jz4780-nand-controller.=20
> I
> don't know what's best here. Maybe Boris or Rob can help?

The "ingenic,jz4780-nand" compatible string is already out there and=20
used
in devicetree files, so I wouldn't change it just for the sake of it.

-Paul
=
