From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next 0/5] mtd: spi-nor: add driver for Atmel QSPI
 controller
Date: Tue, 8 Dec 2015 11:25:31 +0100
Message-ID: <5666B01B.9040707@atmel.com>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <20151207193441.GO120110@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151207193441.GO120110@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com, marex@denx.de, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paM?= <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

Le 07/12/2015 20:34, Brian Norris a =E9crit :
> + Bean Huo
>=20
> Hi Cyrille,
>=20
> On Mon, Dec 07, 2015 at 03:09:09PM +0100, Cyrille Pitchen wrote:
>> Hi all,
>>
>> this series of patches adds support to the Atmel QSPI controller ava=
ilable
>> on sama5d2 SoCs. It was tested on a sama5d2 xplained ultra board wit=
h a=20
>> Micron n25q128a13 QSPI memory and a at25df321a SPI memory.
>>
>> In order to use the Micron memory in its Quad SPI mode, the spi-nor
>> framework needed to be patched to fix the support of Quad/Dual SPI
>> protocols with some memory manufacturers such as Spansion, Micron an=
d
>> Macronix. There are many comments in the source code to explain the
>> implementation choices based on the datasheets from memory manufactu=
rers.
>>
>>
>> This series was based and tested on linux-next-20151207
>>
>> 1 - Atmel QSPI + Micron n25q128a13 (atmel-quadspi.c driver)
>>
>> SPI 1-1-1: This mode was tested replacing SPI_NOR_QUAD by SPI_NOR_FA=
ST as
>>            argument to spi_nor_scan() called from atmel_qspi_probe()=
=2E
>>
>> SPI 1-1-4: Bootloaders (at91bootstrap/uboot) don't enable the Quad S=
PI
>>            mode of the Micron memory. When probed from Linux, the me=
mory
>>            uses its Extended SPI mode and replies to the regular Rea=
d ID
>>            (0x9f) command.
>>
>> SPI 4-4-4: The romcode enabled the Quad SPI mode the of Micron memor=
y
>>            before loading the at91bootstrap. When probed from Linux,=
 the
>>            memory uses its Quad SPI mode and no longer replies to th=
e
>>            regular Read ID (0x9f) command but instead to the Read ID
>>            Multiple I/O (0xaf) command. The memory expects ALL comma=
nds
>>            to use the SPI 4-4-4 protocol.
>=20
> I'll admit I'm a little fuzzy on the differences between dual and qua=
d
> modes on various flash manufacturers. Can you help clear it up for me=
?
> I think some of the comments on patch 2 help too, but I'll just comme=
nt
> here for now.
>=20
> It looks like the current driver has problems regarding the non 1-x-y
> modes (e.g., 4-4-4), right? But I see that spi-nor.c never tries to
> send a 4_4_4 command; it only sets read_opcode to
> SPINOR_OP_READ_1_1_{1,2,4}. So is this an oversight in patches like
> Bean's patch?
>=20
>     commit 548cd3ab54da ("mtd: spi-nor: Add quad I/O support for Micr=
on
>     SPI NOR")
>=20
> Why would we even need to enable quad modes like that, if we're not
> going to send the 4-4-4 opcodes?

=46irst let me clarify one point. This series focuses on Spansion, Macr=
onix
and Micron because when I wrote its patches few months ago, the spi-nor=
=2Ec
driver supported QSPI protocols only for these three only manufacturers=
=2E
Today I notice that now some Winbond memories also use the
SPI_NOR_QUAD_READ flag. Though I try to deal with all manufacturers on =
a
equal foot, I currently have no knowledge on Windond memories so my
explanations only apply to Spansion, Macronix and Micron memories.

About the SPI 4-4-4 protocol, it is only supported by Micron and Macron=
ix
memories but not by Spansion. Both Micron and Macronix memories provide=
 us
with a special mode, let's call it the Quad SPI mode. As Bean Huo expla=
ined
for Micron, once this mode is enabled, the memory expects all commands =
to
use the SPI 4-4-4 protocol. Hence even if the spi-nor.c driver uses the=
 Fast
Read Quad Output 1-1-4 (0x6b/0x6c) or the Fast Read Quad I/O 1-4-4 (0xe=
b/0xec)
op codes, the command is interpreted as a Fast Read Quad Command 4-4-4 =
so must
use the SPI 4-4-4 protocol. As far as I know, there is no currently exi=
sting
op code dedicated to the Fast Read Quad Command 4-4-4.

So the op codes may be confusing but when the Quad SPI mode is enabled =
we
actually use Fast Read 4-4-4 commands.

>=20
> My next question (if my understanding is roughly correct) is, do we n=
eed
> the 4-4-4 modes, and what risks come with them? I understand we can
> shorten the command and address phases, but does that alone yield muc=
h
> performance benefit? And I think the risk is that a given system migh=
t
> not be prepared for the flash to be in a 4-4-4 mode, if the boot code
> tries to use 1-x-y commands.
>=20

I did not run comparative tests between Fast Read 1-1-4, Fast Read 1-4-=
4
and Fast Read 4-4-4 yet. Honestly I don't expect much difference. Howev=
er
performances were not the main purpose when I wrote these patches.
Actually the Quad SPI mode of Macronix and Micron comes with a side eff=
ect.
Once enable, not only the memory now expects all commands to use the
SPI 4-4-4 protocol but it no longer replies to the regular Read JEDEC I=
D
command (0x9f). Instead it replies to a new command, the Read JEDEC ID
Multiple I/O (0xaf).
Now let's imagine that the Quad SPI mode is either permanently enabled =
at
reset using non-volatile configuration registers or enabled by a early
bootloader. When the spi-nor driver tries to probe the memory, the 0x9f
command fails: the driver should adapt, that's why it tries other proto=
cols
such as SPI 4-4-4 (Micron and Macronix) and SPI 2-2-2 (Micron only when=
 in
Dual SPI mode) with the 0xaf command. When we finally get a valid JEDEC=
 ID,
we also know the current mode of memory.

Then the global policy of this series of patches is:
1 - try to configure the QSPI memory as asked by the user, ie according=
 to
    the read_mode argument of spi_nor_scan().
2 - use volatile bits in configuration registers as much as possible, t=
ry to
    avoid changing non-volatile bits hence bootloaders should drive the
    QSPI memory always in the same state after reset.
3 - check the current state/mode the the QSPI memory and adapt to it in=
 order
    to limit the configuration changes
4 - try not to introduce regression ;)

=46or instance with Micron memories, about the choice between the Exten=
ded
SPI mode and the Quad SPI mode, I've currently chosen to keep on using =
the
detected mode during the probing phase (Read JEDED ID).
Indeed the Extended SPI mode does support the Fast Read 1-1-4 command,
which should not be very different from Fast Read x-4-4 commands thinki=
ng
about performances. So I thought it was safer not to change the mode ra=
ther
than forcing the Quad SPI mode. Actually using Fast Read 1-1-4 in Exten=
ded=20
SPI mode only requires the SPI_RX_QUAD capability from the SPI controll=
er
whereas the Quad SPI mode would also require the SPI_TX_QUAD capability=
=2E
Referring to the m25p80 driver, the mode argument of spi_nor_scan() is =
set
to SPI_NOR_QUAD if and only if the SPI controller has the SPI_RX_QUAD f=
lag.
That's not enough to know whether the SPI controller could support to
enable the Quad SPI mode of the Micron memory.
However, if the Quad SPI mode was already enabled and the spi-nor drive=
r
succeeded in probing the Micron memory with the 0xaf command in SPI 4-4=
-4
protocol, we know that the SPI controller does support the SPI 4-4-4
protocol then we can safely leave the Quad SPI mode of the Micron memor=
y
enabled. Same thing with Micron Dual SPI mode ant the support of the
SPI 2-2-2 protocol by the SPI controller.


Here is my understanding of the volatile/non-volatile bits in
the configuration registers for each QSPI manufacturer according to the=
ir
datasheets. Please note that some manufacturers such as Micron provide
both volatile and non-volatile registers to configure some settings.

                       Micron             Macronix           Spansion
Quad/Dual SPI Mode     volatile capable   persistent only    persistent=
 only

# of dummy cycles      volatile capable   volatile capable   persistent=
 only


I think the only place where I may change a non-volatile bit is in
spansion_set_quad_mode() when setting the QUAD bit in the Configuration
Register 1 (CR1) if the user asked to use a Quad SPI protocol but the Q=
UAD
bit was not set yet. That's why I added a dev_warn() message.

About the number of dummy cycles, the spi-nor framework adapts to the c=
urrent
setting of a Spansion memory.

> Also, I see a lot of good comments in patch 2 about Spansion vs.
> Macronix vs. Micron memories. I wonder if previous developers have
> completely tested their patches, or if they're just reading the
> datasheets... so, what kind have testing have you done? Do you have
> samples of all these flash to test?
>=20

I want to be totally honest on this point: I did NOT test with Macronix
memories yet simply because I have no such memory from this manufacture=
r.
I guess Atmel planed to purchase some samples because we also need to t=
est
their support in the sama5d2 romcode when booting from QSPI.
So for the Macronix case, the patches are only based on my current
understanding of Macronix datasheets (MX66L1G45G, 3V, 1Gb, v1.0.pdf).

On the other hand I did many tests with both Micron and Spansion memori=
es
with sama5d2 SoCs, either with Linux or with the sama5d2 romcode ("norm=
al"
=46ast Read x-y-4 but also eXecution In Place using the Continuous Read=
 mode:
the XIP mode is not relevant for the Linux spi-nor framework but it sho=
uld
take care of the "dummy cycles" it sends to avoid entering into the
Continuous Read mode by mistake).
I used at least these memories under Linux:
- Micron n25q128a13: sama5d2 xplained ultra + linux-next 20151207 /
  at91 linux 4.1
- Micron n25q256: sama5d2 prototype (FPGA) + at91 linux 3.18
- Spansion s25fl512: sama5d2 prototype (FPGA) + at91 linux 3.18

Maybe Marek also did some tests on his side.


I hope I've answered your questions, please don't hesitate to comment/a=
sk more
questions. I'll do my best to answer them! :)

> Regards,
> Brian
>=20

Best Regards,

Cyrille
