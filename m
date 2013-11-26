From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Tue, 26 Nov 2013 18:27:56 +0200
Message-ID: <5294CC0C.9000203@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com> <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com> <817E4263-5E61-4471-AED0-5C97FD2B902F@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <817E4263-5E61-4471-AED0-5C97FD2B902F@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On 11/22/2013 11:04 PM, Kumar Gala wrote:
>=20
> On Nov 20, 2013, at 9:46 AM, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>=
 wrote:
>=20
>> Add bindings for AEMIF controller drivers/memory/ti-aemif.c
>>
>=20
> Binding shouldn=92t normally refer to code.
>=20
> Just saying something like:
>=20
> Adding binging for TI Async External Memory Interface (AEMIF) control=
ler.
>=20
>=20
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>> ---
>> .../bindings/memory-controllers/ti-aemif.txt       |  198 ++++++++++=
++++++++++
>> 1 file changed, 198 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/memory-controll=
ers/ti-aemif.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti=
-aemif.txt b/Documentation/devicetree/bindings/memory-controllers/ti-ae=
mif.txt
>> new file mode 100644
>> index 0000000..be0c0cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.=
txt
>> @@ -0,0 +1,198 @@
>> +* Device tree bindings for Texas instruments AEMIF controller
>> +
>> +Th Async External Memory Interface (EMIF16/AEMIF) controller is int=
ended to
>=20
> The?
>=20
>> +provide a glue-less interface to a variety of asynchronous memory d=
evices like
>> +ASRA M, NOR and NAND memory. A total of 256M bytes of any of these =
memories
>> +can be accessed at any given time via four chip selects with 64M by=
te access
>> +per chip select. Synchronous memories such as DDR1 SD RAM, SDR SDRA=
M
>> +and Mobile SDR are not supported.
>> +
>> +Documentation:
>> +Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
>> +OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
>> +Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
>> +
>> +Required properties:
>> +
>> +- compatible:		"ti,davinci-aemif"
>> +			"ti,keystone-aemif"
>> +			"ti,omap-L138-aemif"
>> +
>> +- #address-cells:	Must be 2. The first cell is the memory partition
>> +			number. The 0 partition is for chip selects. And the
>> +			second cell is the offset into the partition, for the 0
>> +			partition it corresponds to chip select offset.
>> +
>=20
> Is the first cell just the chip select number?

No. It's rather memory range/partition number. Now there are 2 partitio=
ns:
- control partition which is common for all CS interfaces
- CS-specific partition/range
(this one can be splitted according to specific SoC requirement)

As per Keystone TCI6638K2K
 Datasheet http://www.ti.com/lit/ds/sprs836d/sprs836d.pdf:

1) the memory range 0 will be from 0x30000000 size 0x10000000:
00 3000 0000 - 00 33FF FFFF 64M EMIF16 CE0
00 3400 0000 - 00 37FF FFFF 64M EMIF16 CE1
00 3800 0000 - 00 3BFF FFFF 64M EMIF16 CE2
00 3C00 0000 - 00 3FFF FFFF 64M EMIF16 CE3

2) the memory range 1:
00 2100 0A00 - 00 2100 0AFF 256 AEMIF Config

And AEMIF node contains definition:
ranges =3D <0 0 0x30000000 0x10000000
	  1 0 0x21000A00 0x0000100>;


Child node has (nand):
 reg =3D <0 0 0x4000000 (cs0)
        - or - 0 0x4000000 0x4000000 (cs1)
        - or - 0 0x8000000 0x4000000 (cs2)
	- or - 0 0xC000000 0x4000000 (cs3)
	- and -
        1 0 0x0000100>; (for all cs)

=46or example for cs2 child node the resulting mem range 0 will be calc=
ulated as

from: 0x30000000 + (0 0x8000000 - 0 0)
size: 0x4000000

We don't encode CS number in reg/ranges, because it will allow simply c=
hange=20
AEMIF DT definitions depending on each SoC
(AEMIF CS memory range can be continuous as above or not, if not - addi=
tional
range/partition can be added and child device can select the proper one=
).

>=20
> I=92m wondering if this is similar to FSL Localbus controller, see th=
e binding:
>=20
> bindings/powerpc/fsl/lbc.txt

Don't think so :) it looks similar just because of using standard bindi=
ngs
(gpmc-nand.c mvebu-devbus.txt ti-gpmc.txt and etc.)

>=20
>> +- #size-cells:		Must be set to 1.
>> +
>> +- reg:			contains offset/length value for AEMIF control registers
>> +			space.
>> +
>> +- ranges:		Must be set up to reflect the memory layout for 4
>> +			chipselects and for AEMIF control range.
>> +
>> +- clocks:		phandle reference to the controller clock. Required only
>> +			if clock tree data present in device tree.
>> +			See clock-bindings.txt
[..]
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Regards,
-grygorii
