From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 01/18] doc: dt-bindings: jz4780-dma: Update bindings to
 reflect driver changes
Date: Mon, 30 Jul 2018 23:13:45 +0200
Message-ID: <1532985225.4702.0@smtp.crapouillou.net>
References: <20180721110643.19624-1-paul@crapouillou.net>
        <20180721110643.19624-2-paul@crapouillou.net>
        <20180724233558.GA30764@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724233558.GA30764@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi,

Le mer. 25 juil. 2018 =E0 1:35, Rob Herring <robh@kernel.org> a =E9crit :
> On Sat, Jul 21, 2018 at 01:06:26PM +0200, Paul Cercueil wrote:
>>  The driver is now compatible with four SoCs: JZ4780, JZ4770,=20
>> JZ4725B and
>>  JZ4740.
>=20
> What the driver supports is irrelevant to the binding.

That's just informative. But I can remove it, no problem.

>>=20
>>  Besides, it now expects the devicetree to supply a second memory
>>  resource. This resource is mandatory on the newly supported SoCs.
>>  For the JZ4780, new devicetree code must also provide it, although=20
>> the
>>  driver is still compatible with older devicetree binaries.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  Tested-by: Mathieu Malaterre <malat@debian.org>
>>  ---
>>   Documentation/devicetree/bindings/dma/jz4780-dma.txt | 14=20
>> ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>=20
>>   v2: New patch in this series; regroups the changes made to the
>>   jz4780-dma.txt doc file in the previous version of the patchset.
>>=20
>>   v3: Updated example to comply with devicetree specification
>>=20
>>  diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt=20
>> b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
>>  index f25feee62b15..14f33305e194 100644
>>  --- a/Documentation/devicetree/bindings/dma/jz4780-dma.txt
>>  +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
>>  @@ -2,8 +2,13 @@
>>=20
>>   Required properties:
>>=20
>>  -- compatible: Should be "ingenic,jz4780-dma"
>>  -- reg: Should contain the DMA controller registers location and=20
>> length.
>>  +- compatible: Should be one of:
>>  +  * ingenic,jz4740-dma
>>  +  * ingenic,jz4725b-dma
>>  +  * ingenic,jz4770-dma
>>  +  * ingenic,jz4780-dma
>=20
> So none of these are compatible with each other? It should be one=20
> valid
> combination per line.

That's correct - they are all slightly different.

>>  +- reg: Should contain the DMA channel registers location and=20
>> length, followed
>>  +  by the DMA controller registers location and length.
>>   - interrupts: Should contain the interrupt specifier of the DMA=20
>> controller.
>>   - interrupt-parent: Should be the phandle of the interrupt=20
>> controller that
>>   - clocks: Should contain a clock specifier for the JZ4780 PDMA=20
>> clock.
>>  @@ -20,9 +25,10 @@ Optional properties:
>>=20
>>   Example:
>>=20
>>  -dma: dma@13420000 {
>>  +dma: dma-controller@13420000 {
>>   	compatible =3D "ingenic,jz4780-dma";
>>  -	reg =3D <0x13420000 0x10000>;
>>  +	reg =3D <0x13420000 0x400
>>  +	       0x13421000 0x40>;
>>=20
>>   	interrupt-parent =3D <&intc>;
>>   	interrupts =3D <10>;
>>  --
>>  2.11.0
>>=20
=
