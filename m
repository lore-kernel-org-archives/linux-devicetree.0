Return-Path: <SRS0=kpQi=P5=martin.sperl.org=kernel@kernel.org>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-7537F92A-9697-471D-A234-27B11A41682C
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V5 2/4] can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver basics
From: Martin Sperl <kernel@martin.sperl.org>
In-Reply-To: <89f96653-f850-8ae8-a390-bce93334c326@grandegger.com>
Date: Mon, 21 Jan 2019 19:29:45 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <5D10FFC3-71DA-4C61-B038-C9D9D98CB260@martin.sperl.org>
References: <20181221092950.14192-1-kernel@martin.sperl.org> <20181221092950.14192-3-kernel@martin.sperl.org> <89f96653-f850-8ae8-a390-bce93334c326@grandegger.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail-7537F92A-9697-471D-A234-27B11A41682C
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Wolfgang,

Thanks for the review!
I will add your feedback to v6 (which is already in version v6.7 fixing issu=
es and more).


> On 21.01.2019, at 13:31, Wolfgang Grandegger <wg@grandegger.com> wrote:
>=20
>>=20
>=20
> About file names and modularization: A "mcp25xxfd_xxx.c" should also have
> a header file "mcp25xxfd_xxx.h" defining the interface and use the
> prefix "mcp25xxfd_xxx". Therefore, "s/mcp25xxfd_base/mcp25xxfd" would
> make more sense.
>=20

Base came into play to say it is minimal and I did not figure
out a way to get it working correctly without -base because
Of some conflicts with generated Module code if I=20
remember correctly.

> Also, could you please put just the register definitions in
> "mcp25xxfd_reg.h".
>=20
I just wanted to keep the included minimal hence the 2 files
that reflect the separation in the controller: mcp25xx (spi, clock, gpio)
specific and Can specific

>>=20
>> +static inline void mcp25xxfd_convert_to_cpu(u32 *data, int n)
>> +{
>> +    int i;
>> +
>> +    for (i =3D 0; i < n; i++)
>> +        data[i] =3D le32_to_cpu(data[i]);
>=20
> Is this optimized away if the endianess is the same?

Compiler should handle this automatically (also moved into=20
the header In v6)

>>=20
>> +static int mcp25xxfd_first_byte(u32 mask)
>> +{
>> +    return (mask & 0x0000ffff) ?
>> +        ((mask & 0x000000ff) ? 0 : 1) :
>> +        ((mask & 0x00ff0000) ? 2 : 3);
>> +}
>=20
> inline?

Inline not needed - compiler will in-line automatically when sufficient.
This has moved to headers in v6 (where inline is then needed)

>>=20
>> +static void mcp25xxfd_debugfs_remove(struct mcp25xxfd_priv *priv)
>> +{
>> +}
>> +#endif
>=20
> And could you please put all debugfs stuff into "mcp25xxfd_debugfs.[ch]"
> and define macros to increment the statistics if CONFIG_DEBUG_FS is define=
d.

Some of the structures are only defined in the specific c file and
 this would require now moving the structure into the header files

Also I thought that this way it was contained in a location related
to where it is used.

>>=20
>> +    struct mcp25xxfd_priv *priv =3D spi_get_drvdata(spi);
>> +    u32 value   =3D _mcp25xxfd_clkout_mask(spi);
>=20
> Just one space before and after "=3D", please! Here and in other places.
Strange that chckpatch did not catch that...

>=20
>> +#define CAN_SFR_BASE(x)            (0x000 + (x))
>> +#define CAN_CON                CAN_SFR_BASE(0x00)
>=20
> The prefix "CAN_" is not generic enough. Name clashes, e.g. with
> "CAN_INT" are not that unlikely. Why not using "MCP25XXFD_" instead?
> And could you please mov the register definitions into "mcp25xxfd_reg.h".

Similar to above: can are can specific registers mcp2515 are ecc
Clock and gpio specific registers.

Also adding mcp25xxfd makes it longer and that incurs more
line breaks in code to fulfill the 80char rule...

>>=20
>> +#  define CAN_CON_DEFAULT                \
>> +    (CAN_CON_ISOCRCEN |                \
>> +     CAN_CON_PXEDIS |                \
>> +     CAN_CON_WAKFIL |                \
>> +     (3 << CAN_CON_WFT_SHIFT) |            \
>> +     CAN_CON_STEF |                    \
>> +     CAN_CON_TXQEN |                \
>> +     (CAN_CON_MODE_CONFIG << CAN_CON_OPMOD_SHIFT) |    \
>> +     (CAN_CON_MODE_CONFIG << CAN_CON_REQOP_SHIFT))
>=20
> Could you please align to the right, here and below.

Checkpatch would complain then if I understand your=20
request correctly.

>=20
> More soon...

Thanks, Martin=

--Apple-Mail-7537F92A-9697-471D-A234-27B11A41682C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Wolfgang,<div><br></div><div>Thanks for t=
he review!</div><div>I will add your feedback to v6 (which is already in ver=
sion v6.7 fixing issues and more).</div><div><br><div dir=3D"ltr"><br>On 21.=
01.2019, at 13:31, Wolfgang Grandegger &lt;<a href=3D"mailto:wg@grandegger.c=
om">wg@grandegger.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite">=
<div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote><span></span><br=
><span>About file names and modularization: A "mcp25xxfd_xxx.c" should also h=
ave</span><br><span>a header file "mcp25xxfd_xxx.h" defining the interface a=
nd use the</span><br><span>prefix "mcp25xxfd_xxx". Therefore, "s/mcp25xxfd_b=
ase/mcp25xxfd" would</span><br><span>make more sense.</span><br><span></span=
><br></div></blockquote><div><br></div><div>Base came into play to say it is=
 minimal and I did not figure</div><div>out a way to get it working correctl=
y without -base because</div><div>Of some conflicts with generated Module co=
de if I&nbsp;</div><div>remember correctly.</div><br><blockquote type=3D"cit=
e"><div dir=3D"ltr"><span>Also, could you please put just the register defin=
itions in</span><br><span>"mcp25xxfd_reg.h".</span><br><span></span><br></di=
v></blockquote><div>I just wanted to keep the included minimal hence the 2 f=
iles</div><div>that reflect the separation in the controller: mcp25xx (spi, c=
lock, gpio)</div><div>specific and Can specific</div><br><blockquote type=3D=
"cite"><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote><blockquo=
te type=3D"cite"><span>+static inline void mcp25xxfd_convert_to_cpu(u32 *dat=
a, int n)</span><br></blockquote><blockquote type=3D"cite"><span>+{</span><b=
r></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;int i;</span><=
br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+ &nbsp; &nbsp;for (i =3D 0; i &lt; n; i++)</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &=
nbsp;data[i] =3D le32_to_cpu(data[i]);</span><br></blockquote><span></span><=
br><span>Is this optimized away if the endianess is the same?</span><br></di=
v></blockquote><div><br></div><div>Compiler should handle this automatically=
 (also moved into&nbsp;</div><div>the header In v6)</div><br><blockquote typ=
e=3D"cite"><div dir=3D"ltr"><span></span><blockquote type=3D"cite"><br></blo=
ckquote><blockquote type=3D"cite"><span>+static int mcp25xxfd_first_byte(u32=
 mask)</span><br></blockquote><blockquote type=3D"cite"><span>+{</span><br><=
/blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;return (mask &amp=
; 0x0000ffff) ?</span><br></blockquote><blockquote type=3D"cite"><span>+ &nb=
sp; &nbsp; &nbsp; &nbsp;((mask &amp; 0x000000ff) ? 0 : 1) :</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp;((mask &=
amp; 0x00ff0000) ? 2 : 3);</span><br></blockquote><blockquote type=3D"cite">=
<span>+}</span><br></blockquote><span></span><br><span>inline?</span><br></d=
iv></blockquote><div><br></div>Inline not needed - compiler will in-line aut=
omatically when sufficient.</div><div>This has moved to headers in v6 (where=
 inline is then needed)<br><br><blockquote type=3D"cite"><div dir=3D"ltr"><s=
pan></span><blockquote type=3D"cite"><br></blockquote><blockquote type=3D"ci=
te"><span>+static void mcp25xxfd_debugfs_remove(struct mcp25xxfd_priv *priv)=
</span><br></blockquote><blockquote type=3D"cite"><span>+{</span><br></block=
quote><blockquote type=3D"cite"><span>+}</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+#endif</span><br></blockquote><span></span><br><span>And=
 could you please put all debugfs stuff into "mcp25xxfd_debugfs.[ch]"</span>=
<br><span>and define macros to increment the statistics if CONFIG_DEBUG_FS i=
s defined.</span><br></div></blockquote><div><br></div><div>Some of the stru=
ctures are only defined in the specific c file and</div><div>&nbsp;this woul=
d require now moving the structure into the header files</div><div><br></div=
><div>Also I thought that this way it was contained in a location related</d=
iv><div>to where it is used.</div><div><br></div><blockquote type=3D"cite"><=
div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote><blockquote type=3D=
"cite"><span>+ &nbsp; &nbsp;struct mcp25xxfd_priv *priv =3D spi_get_drvdata(=
spi);</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;=
u32 value &nbsp;&nbsp;=3D _mcp25xxfd_clkout_mask(spi);</span><br></blockquot=
e><span></span><br><span>Just one space before and after "=3D", please! Here=
 and in other places.</span><br></div></blockquote>Strange that chckpatch di=
d not catch that...</div><div><br><blockquote type=3D"cite"><div dir=3D"ltr"=
><span></span><br><blockquote type=3D"cite"><span>+#define CAN_SFR_BASE(x) &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(0x000 + (x))</span><br></blockquote=
><blockquote type=3D"cite"><span>+#define CAN_CON &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;CAN_SFR_BASE(0x00)</span><br></blockquote><span=
></span><br><span>The prefix "CAN_" is not generic enough. Name clashes, e.g=
. with</span><br><span>"CAN_INT" are not that unlikely. Why not using "MCP25=
XXFD_" instead?</span><br></div></blockquote><blockquote type=3D"cite"><div d=
ir=3D"ltr"><font color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);=
 background-color: rgba(255, 255, 255, 0);">And could you please mov the reg=
ister definitions into "mcp25xxfd_reg.h".</span></font></div></blockquote><b=
r>Similar to above: can are can specific registers mcp2515 are ecc</div><div=
>Clock and gpio specific registers.</div><div><br></div><div>Also adding mcp=
25xxfd makes it longer and that incurs more</div><div>line breaks in code to=
 fulfill the 80char rule...<br><br><blockquote type=3D"cite"><div dir=3D"ltr=
"><blockquote type=3D"cite"><br></blockquote><blockquote type=3D"cite"><span=
>+# &nbsp;define CAN_CON_DEFAULT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;\</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp=
; &nbsp;(CAN_CON_ISOCRCEN | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;\</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nb=
sp; CAN_CON_PXEDIS | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
\</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; CAN=
_CON_WAKFIL | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</span=
><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; (3 &lt;&lt=
; CAN_CON_WFT_SHIFT) | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</span><br>=
</blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; CAN_CON_STEF | &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</span>=
<br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; CAN_CON_TXQ=
EN | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp; (CAN_CON_MODE_CONFI=
G &lt;&lt; CAN_CON_OPMOD_SHIFT) | &nbsp; &nbsp;\</span><br></blockquote><blo=
ckquote type=3D"cite"><span>+ &nbsp; &nbsp; (CAN_CON_MODE_CONFIG &lt;&lt; CA=
N_CON_REQOP_SHIFT))</span><br></blockquote><span></span><br><span>Could you p=
lease align to the right, here and below.</span><br></div></blockquote><div>=
<br></div>Checkpatch would complain then if I understand your&nbsp;</div><di=
v>request correctly.</div><div><br></div><div><blockquote type=3D"cite"><div=
 dir=3D"ltr"><br><span>More soon...</span><br></div></blockquote><div><br></=
div>Thanks, Martin</div></body></html>=

--Apple-Mail-7537F92A-9697-471D-A234-27B11A41682C--
