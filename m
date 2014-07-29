Return-Path: <kpc528@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53D6EB53.2000209@infradead.org>
References: <1406561500-18264-1-git-send-email-punnaia@xilinx.com>
	<b37e0e96-e91d-496c-a530-df72898798a1@BY2FFO11FD057.protection.gbl>
	<53D6EB53.2000209@infradead.org>
Date: Tue, 29 Jul 2014 08:12:34 +0530
Message-ID: <CAHLkNHKuhhMZM5T4uU66c_MK+SSDGYm1WmH1X8z5fB=LVLEYig@mail.gmail.com>
Subject: Re: [PATCH RFC v4 4/4] Documentation: nand: pl353: Add documentation
 for controller and driver
From: Punnaiah Choudary <kpc528@gmail.com>
Content-Type: multipart/alternative; boundary=089e01183138ea22d704ff4bfd06
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, pekon@ti.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, punnaiah choudary kalluri <kalluripunnaiahchoudary@gmail.com>, anirudh@xilinx.com, svemula@xilinx.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--089e01183138ea22d704ff4bfd06
Content-Type: text/plain; charset=UTF-8

Hi Randy,

  Thanks for the review. I will fix the below review comments in my next
submission.

Regards,
Punnaiah

On Tue, Jul 29, 2014 at 6:01 AM, Randy Dunlap <rdunlap@infradead.org> wrote:

> On 07/28/14 08:31, Punnaiah Choudary Kalluri wrote:
> > Added notes about the controller and driver
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > ---
> > Changes in v4:
> > - None
> > ---
> >  Documentation/mtd/nand/pl353-nand.txt |   92
> +++++++++++++++++++++++++++++++++
> >  1 files changed, 92 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/mtd/nand/pl353-nand.txt
> >
> > diff --git a/Documentation/mtd/nand/pl353-nand.txt
> b/Documentation/mtd/nand/pl353-nand.txt
> > new file mode 100644
> > index 0000000..4deac94
> > --- /dev/null
> > +++ b/Documentation/mtd/nand/pl353-nand.txt
> > @@ -0,0 +1,92 @@
> > +This documents provides some notes about the ARM pl353 smc controller
> used in
>
>                                                     PL353 SMC
>
> > +Zynq SOC and confined to NAND specific details.
>
>             and is confined to
>
> > +
> > +Overview of the controller
> > +==========================
> > +     The SMC (PL353) supports two memory interfaces:
> > +     Interface 0 type SRAM.
> > +     Interface 1 type NAND.
> > +     This configuration supports the following configurable options:
> > +        . 32-bit or 64-bit AXI data width
> > +        . 8-bit, 16-bit, or 32-bit memory data width for interface 0
> > +        . 8-bit, or 16-bit memory data width for interface 1
> > +        . 1-4 chip selects on each interface
> > +        . SLC ECC block for interface 1
> > +
> > +For more information, refer the below link for TRM
>
>                          refer to the below link for TRM.
>
> > +http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/
> > +DDI0380G_smc_pl350_series_r2p1_trm.pdf
> > +
> > +NAND memory accesses
> > +====================
> > +     . Two phase NAND accesses
> > +     . NAND command phase transfers
> > +     . NAND data phase transfers
> > +
> > +Two phase NAND accesses
> > +     The SMC defines two phases of commands when transferring data to
> or from
> > +NAND flash.
> > +
> > +Command phase
> > +     Commands and optional address information are written to the NAND
> flash.
> > +The command and address can be associated with either a data phase
> operation to
> > +write to or read from the array, or a status/ID register transfer.
> > +
> > +Data phase
> > + Data is either written to or read from the NAND flash. This data can
> be either
> > +data transferred to or from the array, or status/ID register
> information.
> > +
> > +NAND AXI address setup
> > +       AXI address      Command phase      Data phase
> > +     [31:24]         Chip address       Chip address
> > +     [23]            NoOfAddCycles_2    Reserved
> > +     [22]            NoOfAddCycles_1    Reserved
> > +     [21]            NoOfAddCycles_0    ClearCS
> > +     [20]            End command valid  End command valid
> > +     [19]            0                  1
> > +     [18:11]         End command        End command
> > +     [10:3]          Start command      [10] ECC Last
> > +                                        [9:3] Reserved
> > +     [2:0]           Reserved           Reserved
> > +
> > +ECC
> > +===
> > +    It operates on a number of 512 byte blocks of NAND memory and can be
>
>                                   512-byte blocks
>
> > +programmed to store the ECC codes after the data in memory. For writes,
> > +the ECC is written to the spare area of the page. For reads, the result
> of
> > +a block ECC check are made available to the device driver.
> > +
> > +------------------------------------------------------------------------
> > +|               n * 512 blocks                  | extra  | ecc    |
> |
>
>                                                               ECC
>
> > +|                                               | block  | codes  |
> |
> > +------------------------------------------------------------------------
> > +
> > +The ECC calculation uses a simple Hamming code, using 1-bit correction
> 2-bit
> > +detection. It starts when a valid read or write command with a 512 byte
> aligned
>
>                                                                   512-byte
>
> > +address is detected on the memory interface.
> > +
> > +Driver details
> > +==============
> > +     The NAND driver has dependancy with the pl353_smc memory controller
>
>                             dependency          PL353 SMC
>
> > +driver for intializing the nand timing parameters, bus width, ECC modes,
>
>               initializing the NAND
>
> > +control and status information.
> > +
> > +Since the controller expects that the chipselect bit should be cleared
> for the
> > +last data transfer i.e last 4 data bytes, the existing nandbase page
>
>              transfer,
>
> > +read/write routines for soft ecc and ecc none modes will not work. So,
> inorder
>
>                                 ECC and ECC
> in order
>
> > +to make this driver work, it always updates the ecc mode as HW ECC and
>
>                                                    ECC
>
> > +implemented the page read/write functions for supporting the SW ECC.
>
>    implements
>
> > +
> > +HW ECC mode:
> > +     Upto 2K page size is supported and beyond that it retuns
>
>         Up to                                             returns
>
> > +-ENOSUPPORT error. If the flsh has ONDIE ecc controller then the
>
>                              flash          ECC
>
> > +priority has given to the ONDIE ecc controller. Also the current
>
>             is given               ECC
>
> > +implementation has support for upto 64 byte oob area
>
>                                   up to 64-byte OOB area.
>
> > +
> > +SW ECC mode:
> > +     It supports all the pgae sizes. But since, zynq soc bootrom uses
>
>                             page sizes, but since Zynq SOC boot ROM
>
> > +HW ECC for the devices that have pgae size <=2K so, to avoid any ecc
> related
>
>                                     page size <= 2K, to avoid any
> ECC-related
>
> > +issues during boot, prefer HW ECC over SW ECC.
> > +
> > +For devicetree binding information please refer the below dt binding
> file
>
>                                              refer to the below
>
> > +Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> >
>
>
> --
> ~Randy
>

--089e01183138ea22d704ff4bfd06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Randy,<br><br></div><div>=C2=A0 Thanks for th=
e review. I will fix the below review comments in my next submission.<br></=
div><div><br></div>Regards,<br></div>Punnaiah<br><div><div><div><div class=
=3D"gmail_extra">
<br><div class=3D"gmail_quote">On Tue, Jul 29, 2014 at 6:01 AM, Randy Dunla=
p <span dir=3D"ltr">&lt;<a href=3D"mailto:rdunlap@infradead.org" target=3D"=
_blank">rdunlap@infradead.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<div class=3D"">On 07/28/14 08:31, Punnaiah Choudary Kalluri wrote:<br>
&gt; Added notes about the controller and driver<br>
&gt;<br>
&gt; Signed-off-by: Punnaiah Choudary Kalluri &lt;<a href=3D"mailto:punnaia=
@xilinx.com">punnaia@xilinx.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v4:<br>
&gt; - None<br>
&gt; ---<br>
&gt; =C2=A0Documentation/mtd/nand/pl353-nand.txt | =C2=A0 92 ++++++++++++++=
+++++++++++++++++++<br>
&gt; =C2=A01 files changed, 92 insertions(+), 0 deletions(-)<br>
&gt; =C2=A0create mode 100644 Documentation/mtd/nand/pl353-nand.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/mtd/nand/pl353-nand.txt b/Documentation/mtd=
/nand/pl353-nand.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4deac94<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/mtd/nand/pl353-nand.txt<br>
&gt; @@ -0,0 +1,92 @@<br>
&gt; +This documents provides some notes about the ARM pl353 smc controller=
 used in<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PL353 SMC<br>
<div class=3D""><br>
&gt; +Zynq SOC and confined to NAND specific details.<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and is confined to<br>
<div class=3D""><br>
&gt; +<br>
&gt; +Overview of the controller<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; + =C2=A0 =C2=A0 The SMC (PL353) supports two memory interfaces:<br>
&gt; + =C2=A0 =C2=A0 Interface 0 type SRAM.<br>
&gt; + =C2=A0 =C2=A0 Interface 1 type NAND.<br>
&gt; + =C2=A0 =C2=A0 This configuration supports the following configurable=
 options:<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0. 32-bit or 64-bit AXI data width<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0. 8-bit, 16-bit, or 32-bit memory data wi=
dth for interface 0<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0. 8-bit, or 16-bit memory data width for =
interface 1<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0. 1-4 chip selects on each interface<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0. SLC ECC block for interface 1<br>
&gt; +<br>
&gt; +For more information, refer the below link for TRM<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0refer to the below link for TRM.<br>
<div><div class=3D"h5"><br>
&gt; +<a href=3D"http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/=
" target=3D"_blank">http://infocenter.arm.com/help/topic/com.arm.doc.ddi038=
0g/</a><br>
&gt; +DDI0380G_smc_pl350_series_r2p1_trm.pdf<br>
&gt; +<br>
&gt; +NAND memory accesses<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; + =C2=A0 =C2=A0 . Two phase NAND accesses<br>
&gt; + =C2=A0 =C2=A0 . NAND command phase transfers<br>
&gt; + =C2=A0 =C2=A0 . NAND data phase transfers<br>
&gt; +<br>
&gt; +Two phase NAND accesses<br>
&gt; + =C2=A0 =C2=A0 The SMC defines two phases of commands when transferri=
ng data to or from<br>
&gt; +NAND flash.<br>
&gt; +<br>
&gt; +Command phase<br>
&gt; + =C2=A0 =C2=A0 Commands and optional address information are written =
to the NAND flash.<br>
&gt; +The command and address can be associated with either a data phase op=
eration to<br>
&gt; +write to or read from the array, or a status/ID register transfer.<br=
>
&gt; +<br>
&gt; +Data phase<br>
&gt; + Data is either written to or read from the NAND flash. This data can=
 be either<br>
&gt; +data transferred to or from the array, or status/ID register informat=
ion.<br>
&gt; +<br>
&gt; +NAND AXI address setup<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 AXI address =C2=A0 =C2=A0 =C2=A0Command phase =
=C2=A0 =C2=A0 =C2=A0Data phase<br>
&gt; + =C2=A0 =C2=A0 [31:24] =C2=A0 =C2=A0 =C2=A0 =C2=A0 Chip address =C2=
=A0 =C2=A0 =C2=A0 Chip address<br>
&gt; + =C2=A0 =C2=A0 [23] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NoOfAddC=
ycles_2 =C2=A0 =C2=A0Reserved<br>
&gt; + =C2=A0 =C2=A0 [22] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NoOfAddC=
ycles_1 =C2=A0 =C2=A0Reserved<br>
&gt; + =C2=A0 =C2=A0 [21] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NoOfAddC=
ycles_0 =C2=A0 =C2=A0ClearCS<br>
&gt; + =C2=A0 =C2=A0 [20] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0End comm=
and valid =C2=A0End command valid<br>
&gt; + =C2=A0 =C2=A0 [19] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; + =C2=A0 =C2=A0 [18:11] =C2=A0 =C2=A0 =C2=A0 =C2=A0 End command =C2=A0=
 =C2=A0 =C2=A0 =C2=A0End command<br>
&gt; + =C2=A0 =C2=A0 [10:3] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Start command=
 =C2=A0 =C2=A0 =C2=A0[10] ECC Last<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[9=
:3] Reserved<br>
&gt; + =C2=A0 =C2=A0 [2:0] =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reserved =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reserved<br>
&gt; +<br>
&gt; +ECC<br>
&gt; +=3D=3D=3D<br>
&gt; + =C2=A0 =C2=A0It operates on a number of 512 byte blocks of NAND memo=
ry and can be<br>
<br>
</div></div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 512-byte blocks<br>
<div class=3D""><br>
&gt; +programmed to store the ECC codes after the data in memory. For write=
s,<br>
&gt; +the ECC is written to the spare area of the page. For reads, the resu=
lt of<br>
&gt; +a block ECC check are made available to the device driver.<br>
&gt; +<br>
&gt; +---------------------------------------------------------------------=
---<br>
&gt; +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n * 512 blocks =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| extra =C2=A0| =
ecc =C2=A0 =C2=A0| =C2=A0 =C2=A0 |<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
CC<br>
<div class=3D""><br>
&gt; +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | block =C2=A0| codes =C2=A0| =C2=A0 =C2=A0 |<br>
&gt; +---------------------------------------------------------------------=
---<br>
&gt; +<br>
&gt; +The ECC calculation uses a simple Hamming code, using 1-bit correctio=
n 2-bit<br>
&gt; +detection. It starts when a valid read or write command with a 512 by=
te aligned<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 512-byte<br>
<div class=3D""><br>
&gt; +address is detected on the memory interface.<br>
&gt; +<br>
&gt; +Driver details<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; + =C2=A0 =C2=A0 The NAND driver has dependancy with the pl353_smc memo=
ry controller<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependency =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P=
L353 SMC<br>
<div class=3D""><br>
&gt; +driver for intializing the nand timing parameters, bus width, ECC mod=
es,<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initializing the NAN=
D<br>
<div class=3D""><br>
&gt; +control and status information.<br>
&gt; +<br>
&gt; +Since the controller expects that the chipselect bit should be cleare=
d for the<br>
&gt; +last data transfer i.e last 4 data bytes, the existing nandbase page<=
br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0transfer,<br>
<div class=3D""><br>
&gt; +read/write routines for soft ecc and ecc none modes will not work. So=
, inorder<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ECC and ECC =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 in order<br>
<div class=3D""><br>
&gt; +to make this driver work, it always updates the ecc mode as HW ECC an=
d<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ECC<br>
<div class=3D""><br>
&gt; +implemented the page read/write functions for supporting the SW ECC.<=
br>
<br>
</div>=C2=A0 =C2=A0implements<br>
<div class=3D""><br>
&gt; +<br>
&gt; +HW ECC mode:<br>
&gt; + =C2=A0 =C2=A0 Upto 2K page size is supported and beyond that it retu=
ns<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Up to =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 returns<br>
<div class=3D""><br>
&gt; +-ENOSUPPORT error. If the flsh has ONDIE ecc controller then the<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flash =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ECC<br>
<div class=3D""><br>
&gt; +priority has given to the ONDIE ecc controller. Also the current<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is given =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ECC<br>
<div class=3D""><br>
&gt; +implementation has support for upto 64 byte oob area<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 up to 64-byte OOB area.<b=
r>
<div class=3D""><br>
&gt; +<br>
&gt; +SW ECC mode:<br>
&gt; + =C2=A0 =C2=A0 It supports all the pgae sizes. But since, zynq soc bo=
otrom uses<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page sizes, but since Zynq SOC boot ROM<br>
<div class=3D""><br>
&gt; +HW ECC for the devices that have pgae size &lt;=3D2K so, to avoid any=
 ecc related<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page size &lt;=3D =
2K, to avoid any ECC-related<br>
<div class=3D""><br>
&gt; +issues during boot, prefer HW ECC over SW ECC.<br>
&gt; +<br>
&gt; +For devicetree binding information please refer the below dt binding =
file<br>
<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0refer to the below<br>
<br>
&gt; +Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt<br=
>
&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
~Randy<br>
</font></span></blockquote></div><br></div></div></div></div></div>

--089e01183138ea22d704ff4bfd06--
