Return-Path: <SRS0=P/4k=DY=gmail.com=mathieu.malaterre@kernel.org>
MIME-Version: 1.0
Sender: mathieu.malaterre@gmail.com
In-Reply-To: <bbc64846-e12e-aea8-c516-5e03f6253fed@mips.com>
References: <20171227122722.5219-1-malat@debian.org> <20171227122722.5219-2-malat@debian.org>
 <bbc64846-e12e-aea8-c516-5e03f6253fed@mips.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 28 Dec 2017 08:26:14 +0100
Message-ID: <CA+7wUsxM4Cq-K6ONSO-WzmYYvq8PmT92Jfrf7M-MqY-ntObi-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] nvmem: add driver for JZ4780 efuse
Content-Type: multipart/alternative; boundary="f403043617c68c2f7b0561616f48"
To: Marcin Nowakowski <marcin.nowakowski@mips.com>
Cc: Zubair.Kakakhel@mips.com, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>, Harvey Hunt <harvey.hunt@imgtec.com>, James Hogan <jhogan@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>

--f403043617c68c2f7b0561616f48
Content-Type: text/plain; charset="UTF-8"

Hi Marcin,

On Thu, Dec 28, 2017 at 8:13 AM, Marcin Nowakowski <
marcin.nowakowski@mips.com> wrote:
> Hi Mathieu, PrasannaKumar,
>
> On 27.12.2017 13:27, Mathieu Malaterre wrote:
>>
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>
>> This patch brings support for the JZ4780 efuse. Currently it only expose
>> a read only access to the entire 8K bits efuse memory.
>>
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> ---
>
>
>> +
>> +/* main entry point */
>> +static int jz4780_efuse_read(void *context, unsigned int offset,
>> +                                       void *val, size_t bytes)
>> +{
>> +       static const int nsegments = sizeof(segments) /
sizeof(*segments);
>> +       struct jz4780_efuse *efuse = context;
>> +       char buf[32];
>> +       char *cur = val;
>> +       int i;
>> +       /* PM recommends read/write each segment separately */
>> +       for (i = 0; i < nsegments; ++i) {
>> +               unsigned int *segment = segments[i];
>> +               unsigned int lpos = segment[0];
>> +               unsigned int buflen = segment[1] / 8;
>> +               unsigned int ncount = buflen / 32;
>> +               unsigned int remain = buflen % 32;
>> +               int j;
>
>
> This doesn't look right, as offset & bytes are completely ignored. This
> means it will return data from an offset other than requested and may also
> overrun the provided output buffer?


Thanks for the review ! That was the part of nvmem framework I was not
totally clear. Let say I want to expose only a portion of efuse space, eg:

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 2f26922718559..44d97c06a6d15 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -299,6 +299,15 @@

  clocks = <&cgu JZ4780_CLK_AHB2>;
  clock-names = "bus_clk";
+
+ #address-cells = <1>;
+ #size-cells = <1>;
+
+ eth_mac: eth_mac@12 {
+ /* six byte/48bit MAC address stored as 8-bit integers */
+ reg = <0x12 0x6>;
+ };
+
  };
  };

What should I do to expose that chunk only in the user space ?

>
>> +               /* EFUSE can read or write maximum 256bit in each time */
>> +               for (j = 0; j < ncount ; ++j) {
>> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>> +                       memcpy(cur, buf, sizeof(buf));
>> +                       cur += sizeof(buf);
>> +                       lpos += sizeof(buf);
>> +                       }
>> +               if (remain) {
>> +                       jz4780_efuse_read_32bytes(efuse, buf, lpos);
>> +                       memcpy(cur, buf, remain);
>> +                       cur += remain;
>> +                       }
>> +               }
>> +
>> +       return 0;
>> +}
>
>
>
> Marcin
>

-M

--f403043617c68c2f7b0561616f48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Marcin,<br><br>On Thu, Dec 28, 2017 at 8:13 AM, Marcin =
Nowakowski &lt;<a href=3D"mailto:marcin.nowakowski@mips.com">marcin.nowakow=
ski@mips.com</a>&gt; wrote:<br>&gt; Hi Mathieu, PrasannaKumar,<br>&gt;<br>&=
gt; On 27.12.2017 13:27, Mathieu Malaterre wrote:<br>&gt;&gt;<br>&gt;&gt; F=
rom: PrasannaKumar Muralidharan &lt;<a href=3D"mailto:prasannatsmkumar@gmai=
l.com">prasannatsmkumar@gmail.com</a>&gt;<br>&gt;&gt;<br>&gt;&gt; This patc=
h brings support for the JZ4780 efuse. Currently it only expose<br>&gt;&gt;=
 a read only access to the entire 8K bits efuse memory.<br>&gt;&gt;<br>&gt;=
&gt; Tested-by: Mathieu Malaterre &lt;<a href=3D"mailto:malat@debian.org">m=
alat@debian.org</a>&gt;<br>&gt;&gt; Signed-off-by: PrasannaKumar Muralidhar=
an &lt;<a href=3D"mailto:prasannatsmkumar@gmail.com">prasannatsmkumar@gmail=
.com</a>&gt;<br>&gt;&gt; ---<br>&gt;<br>&gt;<br>&gt;&gt; +<br>&gt;&gt; +/* =
main entry point */<br>&gt;&gt; +static int jz4780_efuse_read(void *context=
, unsigned int offset,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 void *val, size_t bytes)<br>&gt;&gt; +{<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 static const int nsegments =3D sizeof(segments) / size=
of(*segments);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 struct jz4780_efuse *efus=
e =3D context;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 char buf[32];<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 char *cur =3D val;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 int i;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 /* PM recommends read/write e=
ach segment separately */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; =
i &lt; nsegments; ++i) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unsigned int *segment =3D segments[i];<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int lpos =3D segment[0];=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned in=
t buflen =3D segment[1] / 8;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned int ncount =3D buflen / 32;<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int remain =3D buflen %=
 32;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int j;<=
br>&gt;<br>&gt;<br>&gt; This doesn&#39;t look right, as offset &amp; bytes =
are completely ignored. This<br>&gt; means it will return data from an offs=
et other than requested and may also<br>&gt; overrun the provided output bu=
ffer?<br><br><br>Thanks for the review ! That was the part of nvmem framewo=
rk I was not totally clear. Let say I want to expose only a portion of efus=
e space, eg:<br><br><div>diff --git a/arch/mips/boot/dts/ingenic/jz4780.dts=
i b/arch/mips/boot/dts/ingenic/jz4780.dtsi</div><div>index 2f26922718559..4=
4d97c06a6d15 100644</div><div>--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi<=
/div><div>+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi</div><div>@@ -299,6 =
+299,15 @@</div><div>=C2=A0</div><div>=C2=A0<span style=3D"white-space:pre"=
>			</span>clocks =3D &lt;&amp;cgu JZ4780_CLK_AHB2&gt;;</div><div>=C2=A0<sp=
an style=3D"white-space:pre">			</span>clock-names =3D &quot;bus_clk&quot;;=
</div><div>+</div><div>+<span style=3D"white-space:pre">			</span>#address-=
cells =3D &lt;1&gt;;</div><div>+<span style=3D"white-space:pre">			</span>#=
size-cells =3D &lt;1&gt;;</div><div>+</div><div>+<span style=3D"white-space=
:pre">			</span>eth_mac: eth_mac@12 {</div><div>+<span style=3D"white-space=
:pre">				</span>/* six byte/48bit MAC address stored as 8-bit integers */<=
/div><div>+<span style=3D"white-space:pre">				</span>reg =3D &lt;0x12 0x6&=
gt;;</div><div>+<span style=3D"white-space:pre">			</span>};</div><div>+</d=
iv><div>=C2=A0<span style=3D"white-space:pre">		</span>};</div><div>=C2=A0<=
span style=3D"white-space:pre">	</span>};</div><div>=C2=A0</div>What should=
 I do to expose that chunk only in the user space ?<br><br>&gt;<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* EFUSE can read or wr=
ite maximum 256bit in each time */<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; ncount ; ++j) {<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 jz4780_efuse_read_32bytes(efuse, buf, lpos);<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(c=
ur, buf, sizeof(buf));<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cur +=3D sizeof(buf);<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lpos +=3D sizeof(buf);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (remain) {<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jz4780_e=
fuse_read_32bytes(efuse, buf, lpos);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(cur, buf, remai=
n);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cur +=3D remain;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;&gt; +<br>&gt;&gt; +=
 =C2=A0 =C2=A0 =C2=A0 return 0;<br>&gt;&gt; +}<br>&gt;<br>&gt;<br>&gt;<br>&=
gt; Marcin<br>&gt;<br><div><br></div><div>-M</div></div>

--f403043617c68c2f7b0561616f48--
