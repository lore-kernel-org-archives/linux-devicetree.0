From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 3/3] mtd: spi-nand: add devicetree binding
Date: Thu, 8 Jan 2015 12:12:20 -0300
Message-ID: <54AE9E54.2010506@imgtec.com>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB425@NTXXIAMBX02.xacn.micron.com> <54ADF66F.7090400@imgtec.com> <87F60714EC601C4C83DFF1D2E3D390A04AB4EA@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A04AB4EA@NTXXIAMBX02.xacn.micron.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?gbk?Q?=22Peter_Pan_=C5=CB=B6=B0_=28peterpandong=29=22?= <peterpandong@micron.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?gbk?Q?=22Qi_Wang_=CD=F5=C6=F0_=28qiwang=29=22?= <qiwang@micron.com>, =?gbk?Q?=22Frank_Liu_=C1=F5=C8=BA_=28frankliu=29=22?= <frankliu@micron.com>, =?gbk?Q?=22Melanie_Zhang_=D5=C5=D1=E0_=28me?= =?gbk?Q?laniezhang=29=22?= <melaniezhang@micron.com>
List-Id: devicetree@vger.kernel.org



On 01/08/2015 02:04 AM, Peter Pan =C5=CB=B6=B0 (peterpandong) wrote:
>>> This commit adds the devicetree binding document that specifies the
>>> spi nand devices support.
>>>
>>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/spi-nand.txt | 22
>> ++++++++++++++++++++++
>>>  1 file changed, 22 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-
>> nand.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt
>> b/Documentation/devicetree/bindings/mtd/spi-nand.txt
>>> new file mode 100644
>>> index 0000000..9dd3efd
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.txt
>>> @@ -0,0 +1,22 @@
>>> +* NAND driver for MT29F, GD5F and similar SPI NAND flash chips
>>> +
>>> +Required properties:
>>> +- #address-cells, #size-cells : Must be present if the device has
>> sub-nodes
>>> +  representing partitions.
>>> +- compatible : Should be the manufacturer and the name of the chip=
=2E
>> Bear in mind
>>>
>>
>> Unless I'm mistaken, we don't need the chip ID here, as SPI NAND all=
ows
>> to autodetect the device. Any reason why we can't just use a generic
>> compatible "spi-nand" here?
>> --
>> Ezequiel
>=20
> In fact, I don't know how to autodetect the SPI NAND device. Micron d=
evice and
> Gigadevice device have different read ID functions. The Chip ID here =
is used to
> determine which function to use.
>=20

Isn't the difference between the Read ID very minor? One of the vendor
needs a 2-byte ID read, and the other one needs a 3-byte ID read.

So you can just try with 2-byte, and if that fails (no vendor ID is
found on the first byte), you can try with the 3-byte command.

It's not the most elegant solution, but it's not super awful either.
--=20
Ezequiel
