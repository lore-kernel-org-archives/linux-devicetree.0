Return-Path: <michael@smart-africa.com>
Content-Type: multipart/alternative; boundary="Apple-Mail=_E08F9BCE-929A-4096-9765-23611B350F1E"
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Subject: Re: [PATCH 1/2] spi: dw: Allow interface drivers to limit data I/O to word sizes
From: Michael van der Westhuizen <michael@smart-africa.com>
In-Reply-To: <1435147064.10393.100.camel@linux.intel.com>
Date: Wed, 24 Jun 2015 18:11:04 +0200
Message-Id: <4C67526B-0B28-4539-8E7F-7F2D6B8967EC@smart-africa.com>
References: <1434703435-25198-1-git-send-email-michael@smart-africa.com> <1434703435-25198-3-git-send-email-michael@smart-africa.com> <1435147064.10393.100.camel@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Thor Thayer <tthayer@opensource.altera.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail=_E08F9BCE-929A-4096-9765-23611B350F1E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 24 Jun 2015, at 1:57 PM, Andy Shevchenko =
<andriy.shevchenko@linux.intel.com> wrote:
>=20
> On Fri, 2015-06-19 at 10:43 +0200, Michael van der Westhuizen wrote:
>> The commit dd11444327ce ("spi: dw-spi: Convert 16bit accesses to=20
>> 32bit
>> accesses") changed all 16bit accesses in the DW_apb_ssi driver to=20
>> 32bit.
>> This, unfortunately, breaks data register access on picoXcell, where=20=

>> the
>> DW IP needs data register accesses to be word accesses (all other
>> accesses appear to be OK).
>=20
> Thanks for the patch. My comments below.
>=20
>>=20
>> This change introduces a new master variable to allow interface=20
>> drivers
>> to specify that 16bit data transfer I/O is required.  This change=20
>> also
>> introduces the ability to set this variable via device tree bindings=20=

>> in
>> the MMIO interface driver.
>>=20
>> Before this change, on a picoXcell pc3x3:
>> spi_master spi32766: interrupt_transfer: fifo overrun/underrun
>> m25p80 spi32766.0: error -5 reading 9f
>> m25p80: probe of spi32766.0 failed with error -5
>>=20
>> After this change:
>> m25p80 spi32766.0: m25p40 (512 Kbytes)
>>=20
>=20
> Please, add Fixes: tag as well.

OK.

>=20
>> Signed-off-by: Michael van der Westhuizen <michael@smart-africa.com>
>> ---
>> drivers/spi/spi-dw-mmio.c |  5 +++++
>> drivers/spi/spi-dw.c      | 13 +++++++++++--
>> drivers/spi/spi-dw.h      | 11 +++++++++++
>> 3 files changed, 27 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
>> index eb03e12..1397424 100644
>> --- a/drivers/spi/spi-dw-mmio.c
>> +++ b/drivers/spi/spi-dw-mmio.c
>> @@ -74,6 +74,11 @@ static int dw_spi_mmio_probe(struct=20
>> platform_device *pdev)
>>=20
>> 	dws->max_freq =3D clk_get_rate(dwsmmio->clk);
>>=20
>> +	if (pdev->dev.of_node)
>> +		dws->data_io_16bit =3D
>=20
> I don't like "flexibility" in the  DeviceTree data base and thus I
> would prefer to see what we already have in naming there, i.e.
> reg-io-width =3D 2 or 4.

Will update.

<snip>

>> @@ -145,11 +146,21 @@ static inline u32 dw_readl(struct dw_spi *dws,=20=

>> u32 offset)
>> 	return __raw_readl(dws->regs + offset);
>> }
>>=20
>> +static inline u16 dw_readw(struct dw_spi *dws, u32 offset)
>> +{
>> +	return __raw_readw(dws->regs + offset);
>> +}
>> +
>> static inline void dw_writel(struct dw_spi *dws, u32 offset, u32=20
>> val)
>> {
>> 	__raw_writel(val, dws->regs + offset);
>> }
>>=20
>> +static inline void dw_writew(struct dw_spi *dws, u32 offset, u16=20
>> val)
>> +{
>> +	__raw_writew(val, dws->regs + offset);
>> +}
>> +
>> static inline void spi_enable_chip(struct dw_spi *dws, int enable)
>> {
>> 	dw_writel(dws, DW_SPI_SSIENR, (enable ? 1 : 0));
>=20
> Regarding to above comment what about something like
>=20
> static inline u32 dw_read_reg(dws, offset)
> {
> switch (reg_io_width)
> case 2:
>  return dw_readw();
> case 4:
> default:
>  return dw_readl();
> }

Yes, that would be better.  Note that this will only be used for data
register access, as the other registers seem fine with 32 bit access.

I=E2=80=99ll update the series and resend.

Michael


--Apple-Mail=_E08F9BCE-929A-4096-9765-23611B350F1E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 24 Jun 2015, at 1:57 PM, Andy Shevchenko &lt;<a =
href=3D"mailto:andriy.shevchenko@linux.intel.com" =
class=3D"">andriy.shevchenko@linux.intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On Fri, 2015-06-19 at 10:43 +0200, Michael van =
der Westhuizen wrote:</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">The commit dd11444327ce =
("spi: dw-spi: Convert 16bit accesses to<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">32bit<br =
class=3D"">accesses") changed all 16bit accesses in the DW_apb_ssi =
driver to<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">32bit.<br class=3D"">This, unfortunately, breaks data =
register access on picoXcell, where<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">the<br =
class=3D"">DW IP needs data register accesses to be word accesses (all =
other<br class=3D"">accesses appear to be OK).<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Thanks for the patch. My =
comments below.</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><br class=3D"">This change introduces a new master =
variable to allow interface<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">drivers<br =
class=3D"">to specify that 16bit data transfer I/O is required. =
&nbsp;This change<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">also<br class=3D"">introduces the ability to set this =
variable via device tree bindings<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">in<br =
class=3D"">the MMIO interface driver.<br class=3D""><br class=3D"">Before =
this change, on a picoXcell pc3x3:<br class=3D"">spi_master spi32766: =
interrupt_transfer: fifo overrun/underrun<br class=3D"">m25p80 =
spi32766.0: error -5 reading 9f<br class=3D"">m25p80: probe of =
spi32766.0 failed with error -5<br class=3D""><br class=3D"">After this =
change:<br class=3D"">m25p80 spi32766.0: m25p40 (512 Kbytes)<br =
class=3D""><br class=3D""></blockquote><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Please, add Fixes: tag as well.</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>OK.</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">Signed-off-by: Michael =
van der Westhuizen &lt;<a href=3D"mailto:michael@smart-africa.com" =
class=3D"">michael@smart-africa.com</a>&gt;<br class=3D"">---<br =
class=3D"">drivers/spi/spi-dw-mmio.c | &nbsp;5 +++++<br =
class=3D"">drivers/spi/spi-dw.c &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 13 =
+++++++++++--<br class=3D"">drivers/spi/spi-dw.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 11 +++++++++++<br class=3D"">3 files =
changed, 27 insertions(+), 2 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/drivers/spi/spi-dw-mmio.c =
b/drivers/spi/spi-dw-mmio.c<br class=3D"">index eb03e12..1397424 =
100644<br class=3D"">--- a/drivers/spi/spi-dw-mmio.c<br class=3D"">+++ =
b/drivers/spi/spi-dw-mmio.c<br class=3D"">@@ -74,6 +74,11 @@ static int =
dw_spi_mmio_probe(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">platform_device *pdev)<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dws-&gt;max_freq =3D clk_get_rate(dwsmmio-&gt;clk);<br =
class=3D""><br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (pdev-&gt;dev.of_node)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dws-&gt;data_io_16bit =3D<br class=3D""></blockquote><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">I don't like "flexibility" in the =
&nbsp;DeviceTree data base and thus I</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">would prefer to see what we already have in =
naming there, i.e.</span><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">reg-io-width =3D 2 or =
4.</span><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Will =
update.</div><div><br class=3D""></div><div>&lt;snip&gt;</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">@@ -145,11 +146,21 @@ static inline u32 dw_readl(struct =
dw_spi *dws,<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">u32 offset)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return __raw_readl(dws-&gt;regs + =
offset);<br class=3D"">}<br class=3D""><br class=3D"">+static inline u16 =
dw_readw(struct dw_spi *dws, u32 offset)<br class=3D"">+{<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return __raw_readw(dws-&gt;regs + offset);<br class=3D"">+}<br =
class=3D"">+<br class=3D"">static inline void dw_writel(struct dw_spi =
*dws, u32 offset, u32<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">val)<br =
class=3D"">{<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>__raw_writel(val, dws-&gt;regs + =
offset);<br class=3D"">}<br class=3D""><br class=3D"">+static inline =
void dw_writew(struct dw_spi *dws, u32 offset, u16<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">val)<br =
class=3D"">+{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>__raw_writew(val, dws-&gt;regs + =
offset);<br class=3D"">+}<br class=3D"">+<br class=3D"">static inline =
void spi_enable_chip(struct dw_spi *dws, int enable)<br class=3D"">{<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dw_writel(dws, DW_SPI_SSIENR, (enable ? 1 : 0));<br =
class=3D""></blockquote><br style=3D"font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">Regarding to above comment =
what about something like</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">static inline u32 =
dw_read_reg(dws, offset)</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">{</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">switch (reg_io_width)</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">case 2:</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">&nbsp;return dw_readw();</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">case 4:</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">default:</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">&nbsp;return dw_readl();</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">}</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""></div></blockquote><div><br class=3D""></div></div>Yes, =
that would be better. &nbsp;Note that this will only be used for =
data<div class=3D"">register access, as the other registers seem fine =
with 32 bit access.</div><div class=3D""><br class=3D""></div><div =
class=3D"">I=E2=80=99ll update the series and resend.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Michael</div><div =
class=3D""><br class=3D""></div></body></html>=

--Apple-Mail=_E08F9BCE-929A-4096-9765-23611B350F1E--
