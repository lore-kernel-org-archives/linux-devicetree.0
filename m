From: Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
Date: Mon, 9 Dec 2013 17:09:11 -0600
Message-ID: <01B6F752-AD19-437E-B6A6-CC167B6C34BF@kernel.crashing.org>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
 <817E4263-5E61-4471-AED0-5C97FD2B902F@kernel.crashing.org>
 <5294CC0C.9000203@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5294CC0C.9000203@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On Nov 26, 2013, at 10:27 AM, Grygorii Strashko <grygorii.strashko@ti.com> =
wrote:

> On 11/22/2013 11:04 PM, Kumar Gala wrote:
>> =

>> On Nov 20, 2013, at 9:46 AM, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com> wr=
ote:
>> =

>>> Add bindings for AEMIF controller drivers/memory/ti-aemif.c
>>> =

>> =

>> Binding shouldn=92t normally refer to code.
>> =

>> Just saying something like:
>> =

>> Adding binging for TI Async External Memory Interface (AEMIF) controller.
>> =

>> =

>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>>> ---
>>> .../bindings/memory-controllers/ti-aemif.txt       |  198 +++++++++++++=
+++++++
>>> 1 file changed, 198 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/memory-controllers=
/ti-aemif.txt
>>> =

>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-ae=
mif.txt b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
>>> new file mode 100644
>>> index 0000000..be0c0cb
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
>>> @@ -0,0 +1,198 @@
>>> +* Device tree bindings for Texas instruments AEMIF controller
>>> +
>>> +Th Async External Memory Interface (EMIF16/AEMIF) controller is intend=
ed to
>> =

>> The?
>> =

>>> +provide a glue-less interface to a variety of asynchronous memory devi=
ces like
>>> +ASRA M, NOR and NAND memory. A total of 256M bytes of any of these mem=
ories
>>> +can be accessed at any given time via four chip selects with 64M byte =
access
>>> +per chip select. Synchronous memories such as DDR1 SD RAM, SDR SDRAM
>>> +and Mobile SDR are not supported.
>>> +
>>> +Documentation:
>>> +Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
>>> +OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
>>> +Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
>>> +
>>> +Required properties:
>>> +
>>> +- compatible:		"ti,davinci-aemif"
>>> +			"ti,keystone-aemif"
>>> +			"ti,omap-L138-aemif"
>>> +
>>> +- #address-cells:	Must be 2. The first cell is the memory partition
>>> +			number. The 0 partition is for chip selects. And the
>>> +			second cell is the offset into the partition, for the 0
>>> +			partition it corresponds to chip select offset.
>>> +
>> =

>> Is the first cell just the chip select number?
> =

> No. It's rather memory range/partition number. Now there are 2 partitions:
> - control partition which is common for all CS interfaces
> - CS-specific partition/range
> (this one can be splitted according to specific SoC requirement)
> =

> As per Keystone TCI6638K2K
> Datasheet http://www.ti.com/lit/ds/sprs836d/sprs836d.pdf:
> =

> 1) the memory range 0 will be from 0x30000000 size 0x10000000:
> 00 3000 0000 - 00 33FF FFFF 64M EMIF16 CE0
> 00 3400 0000 - 00 37FF FFFF 64M EMIF16 CE1
> 00 3800 0000 - 00 3BFF FFFF 64M EMIF16 CE2
> 00 3C00 0000 - 00 3FFF FFFF 64M EMIF16 CE3
> =

> 2) the memory range 1:
> 00 2100 0A00 - 00 2100 0AFF 256 AEMIF Config
> =

> And AEMIF node contains definition:
> ranges =3D <0 0 0x30000000 0x10000000
> 	  1 0 0x21000A00 0x0000100>;
> =

> =

> Child node has (nand):
> reg =3D <0 0 0x4000000 (cs0)
>        - or - 0 0x4000000 0x4000000 (cs1)
>        - or - 0 0x8000000 0x4000000 (cs2)
> 	- or - 0 0xC000000 0x4000000 (cs3)
> 	- and -
>        1 0 0x0000100>; (for all cs)
> =

> For example for cs2 child node the resulting mem range 0 will be calculat=
ed as
> =

> from: 0x30000000 + (0 0x8000000 - 0 0)
> size: 0x4000000
> =

> We don't encode CS number in reg/ranges, because it will allow simply cha=
nge =

> AEMIF DT definitions depending on each SoC
> (AEMIF CS memory range can be continuous as above or not, if not - additi=
onal
> range/partition can be added and child device can select the proper one).

This is quite confusing.  I think the ranges property needs far more descri=
ption as part of the top level controller node.  It spec out what the vario=
us fields are in the ranges property.

- k
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
