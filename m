Return-Path: <SRS0=PkBq=AD=broadcom.com=scott.branden@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CA+Jzhd+cX6MW9O+BzSU0NDTEgBet=wbgMdwW9A+fi7HVvxAArA@mail.gmail.com>
References: <20170831185416.8181-1-eric@anholt.net> <3a947d06-53cc-bb28-86de-0ddb5c6b853c@broadcom.com>
 <2e66788a-228a-b32d-eb31-24fab776ee21@gmail.com> <CA+Jzhd+cX6MW9O+BzSU0NDTEgBet=wbgMdwW9A+fi7HVvxAArA@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Date: Sat, 2 Sep 2017 08:48:48 -0700
Message-ID: <CA+JzhdK9feJzk-TJe5HkHfqZOfDm9gOkDQmSSEHYhcuPu0wX5g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add the CLCD controller to Cygnus.
Content-Type: multipart/alternative; boundary="089e082352d04f0f9f055836d092"
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, linux-arm-kernel@lists.infradead.org, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
List-ID: <devicetree@vger.kernel.org>

--089e082352d04f0f9f055836d092
Content-Type: text/plain; charset="UTF-8"

Looks good

On Sep 1, 2017 7:10 PM, "Florian Fainelli" <f.fainelli@gmail.com> wrote:



On 08/31/2017 01:16 PM, Scott Branden wrote:
> Hi Eric,
>
> mode is correct, location in file needs to be moved.
>
>
> On 17-08-31 11:54 AM, Eric Anholt wrote:
>> This doesn't yet enable it on any particular platform, as we still
>> need a panel driver for bcm911360_entphn.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>
>> These bits are just carving off a little bit of my 911360_entphn panel
>> series, to reduce conflicts when rebasing (which I just did for
>> testing pl111 changes for cygnus regressions).  I'm waiting to get my
>> current RPi panel driver in before working on the 911360 panel again.
>>
>>   arch/arm/boot/dts/bcm-cygnus.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> index 7c957ea06c66..74f73ff24aec 100644
>> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
>> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
>> @@ -575,6 +575,16 @@
>>               status = "disabled";
>>           };
>>   +        clcd: clcd@180a0000 {
> please place in correct address ordered location in file

I moved it right above the v3d node to keep the nodes ordered by unit
address, please check the result here:

https://github.com/Broadcom/stblinux/commit/4d1e42c6b9d28ce7b74d92258435f9
d16834ae75


With Moved location
Acked-by: Scott Branden <scott.branden@broadcom.com>

>> +            compatible = "arm,pl111", "arm,primecell";
>> +            reg = <0x180a0000 0x1000>;
>> +            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "combined";
>> +            clocks = <&axi41_clk>, <&apb_clk>;
>> +            clock-names = "clcdclk", "apb_pclk";
>> +            status = "disabled";
>> +        };
>> +
>>           keypad: keypad@180ac000 {
>>               compatible = "brcm,bcm-keypad";
>>               reg = <0x180ac000 0x14c>;
>

--
Florian

--089e082352d04f0f9f055836d092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Looks good<br><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Sep 1, 2017 7:10 PM, &quot;Florian Fainelli&quot; &l=
t;<a href=3D"mailto:f.fainelli@gmail.com">f.fainelli@gmail.com</a>&gt; wrot=
e:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-te=
xt"><br>
<br>
On 08/31/2017 01:16 PM, Scott Branden wrote:<br>
&gt; Hi Eric,<br>
&gt;<br>
&gt; mode is correct, location in file needs to be moved.<br>
&gt;<br>
&gt;<br>
&gt; On 17-08-31 11:54 AM, Eric Anholt wrote:<br>
&gt;&gt; This doesn&#39;t yet enable it on any particular platform, as we s=
till<br>
&gt;&gt; need a panel driver for bcm911360_entphn.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net">=
eric@anholt.net</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; These bits are just carving off a little bit of my 911360_entphn p=
anel<br>
&gt;&gt; series, to reduce conflicts when rebasing (which I just did for<br=
>
&gt;&gt; testing pl111 changes for cygnus regressions).=C2=A0 I&#39;m waiti=
ng to get my<br>
&gt;&gt; current RPi panel driver in before working on the 911360 panel aga=
in.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0arch/arm/boot/dts/bcm-cygnus.<wbr>dtsi | 10 ++++++++++=
<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/arm/boot/dts/bcm-<wbr>cygnus.dtsi<br>
&gt;&gt; b/arch/arm/boot/dts/bcm-<wbr>cygnus.dtsi<br>
&gt;&gt; index 7c957ea06c66..74f73ff24aec 100644<br>
&gt;&gt; --- a/arch/arm/boot/dts/bcm-<wbr>cygnus.dtsi<br>
&gt;&gt; +++ b/arch/arm/boot/dts/bcm-<wbr>cygnus.dtsi<br>
&gt;&gt; @@ -575,6 +575,16 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &=
quot;disabled&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clcd: clcd@180a0000 {<br>
&gt; please place in correct address ordered location in file<br>
<br>
</div>I moved it right above the v3d node to keep the nodes ordered by unit=
<br>
address, please check the result here:<br>
<br>
<a href=3D"https://github.com/Broadcom/stblinux/commit/4d1e42c6b9d28ce7b74d=
92258435f9d16834ae75" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/Broadcom/<wbr>stblinux/commit/<wbr>4d1e42c6b9d28ce7b74d92258435f9<wbr>d1=
6834ae75</a></blockquote></div></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">With Moved location</div><div dir=3D"auto">Acked-by: Scott Br=
anden &lt;<a href=3D"mailto:scott.branden@broadcom.com">scott.branden@broad=
com.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"elided-text">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ar=
m,pl111&quot;, &quot;arm,primecell&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x180a0000 =
0x1000&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_=
SPI 155 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt-names =3D &qu=
ot;combined&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;axi=
41_clk&gt;, &lt;&amp;apb_clk&gt;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &quot;c=
lcdclk&quot;, &quot;apb_pclk&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;disabl=
ed&quot;;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0keypad: keypad@180ac000 {<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =
=3D &quot;brcm,bcm-keypad&quot;;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;=
0x180ac000 0x14c&gt;;<br>
&gt;<br>
<br>
</div><font color=3D"#888888">--<br>
Florian<br>
</font></blockquote></div><br></div></div></div>

--089e082352d04f0f9f055836d092--
