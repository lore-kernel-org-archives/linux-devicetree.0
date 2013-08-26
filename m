From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 4/8] mtd: m25p80: add the DDR quad-read support
Date: Mon, 26 Aug 2013 18:35:30 +0800
Message-ID: <521B2F72.5070203@freescale.com>
References: <1377492102-23543-1-git-send-email-b32955@freescale.com> <1377492102-23543-5-git-send-email-b32955@freescale.com> <521AF411.8000107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <521AF411.8000107@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sourav Poddar <sourav.poddar@ti.com>
Cc: broonie@kernel.org, B20596@freescale.com, computersforpeace@gmail.com, b44548@freescale.com, dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8826=E6=97=A5 14:22, Sourav Poddar =E5=86=
=99=E9=81=93:
> Hi,
> On Monday 26 August 2013 10:11 AM, Huang Shijie wrote:
>> This patch adds the DDR quad read support by:
>>
>> (1) Add the relative commands:
>> OPCODE_DDRQIOR, OPCODE_4DDRQIOR
>>
>> (2) add the "m25p,ddr-quad-read" property for the m25p80 driver
>> If the dts has the "m25p,ddr-quad-read" property, the kernel will
>> set the Quad bit of the configuration register, and when the
>> setting suceedes, we will set the read opcode with the right
>> spi nor command.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>> Documentation/devicetree/bindings/mtd/m25p80.txt | 5 +++++
>> drivers/mtd/devices/m25p80.c | 21 ++++++++++++++++-----
>> include/linux/mtd/spi-nor.h | 2 ++
>> 3 files changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt=20
>> b/Documentation/devicetree/bindings/mtd/m25p80.txt
>> index b33313f..a01c6b7 100644
>> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
>> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
>> @@ -22,6 +22,11 @@ Optional properties:
>> all chips and support for it can not be detected at runtime.
>> Refer to your chips' datasheet to check if this is supported
>> by your chip.
>> +- m25p,ddr-quad-read : Use the "ddr quad read" opcode to read data=20
>> from the chip
>> + instead of the usual "read" opcode. This opcode is not
>> + supported by all chips and support for it can not be detected
>> + at runtime. Refer to your chips' datasheet to check if this
>> + is supported by your chip.
>> Example:
>>
>> flash: m25p80@0 {
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p=
80.c
>> index 0645c9f..32ccdc7 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -913,7 +913,8 @@ static void m25p80_check_quad_read(struct m25p=20
>> *flash, struct device_node *np)
>> int ret;
>> int sr_cr;
>>
>> - if (of_property_read_bool(np, "m25p,quad-read")) {
>> + if (of_property_read_bool(np, "m25p,quad-read")
>> + || of_property_read_bool(np, "m25p,ddr-quad-read")) {
>> /* The configuration register is set by the second byte. */
>> sr_cr =3D CR_QUAD<< 8;
>>
>> @@ -927,10 +928,20 @@ static void m25p80_check_quad_read(struct m25p=
=20
>> *flash, struct device_node *np)
>> if (!(ret> 0&& (ret& CR_QUAD)))
>> return;
>>
>> - if (flash->mtd.size<=3D SZ_16M)
>> - flash->read_opcode =3D OPCODE_QIOR;
>> - else
>> - flash->read_opcode =3D OPCODE_4QIOR;
>> + if (of_property_read_bool(np, "m25p,quad-read")) {
>> + if (flash->mtd.size<=3D SZ_16M)
>> + flash->read_opcode =3D OPCODE_QIOR;
>> + else
>> + flash->read_opcode =3D OPCODE_4QIOR;
>> + return;
>> + }
>> +
>> + if (of_property_read_bool(np, "m25p,ddr-quad-read")) {
>> + if (flash->mtd.size<=3D SZ_16M)
>> + flash->read_opcode =3D OPCODE_DDRQIOR;
>> + else
>> + flash->read_opcode =3D OPCODE_4DDRQIOR;
>> + }
> I remember this getting asked in some other thread also...
> Quad read need dummy bits before reading out the data, what happens
> when the controller does not have LUT feature. ?=20
I think the controller (not the QUADSPI) should submit a patch to fix i=
t.

There are many different kinds of READs need the dummy, take S25FSL128S=
=20
for example :

=46ast-Read(dummy =3D 8),
Dual-Output Read(dummy =3D 8),
Dual I/O read(dummy =3D 4 for 3-byte; dummy =3D 2 for 4-byte)
=2E......
Quad i/o Read(dummy =3D 4)
DDR QUAD i/o Read(dummy =3D 8)
=2E.....................

Even the same spi command such as Dual I/O read (0xBB), different=20
version of chips may require different
dummies.

-------------------------------------------------------------
So, the dummies are binded with the chips, not binded with the SPI=20
commands.
-------------------------------------------------------------

We can not list all the dummies in the m25p_ids[] . It's not feasible.

An alternate method is to specific the dummy with the DT node, such as:
"m25p,quad-read =3D <4>", means this chip's Quad read needs dummy=3D4.



thanks
Huang Shijie




