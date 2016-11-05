Return-Path: <gaurav.minocha.os@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALeDE9NVuztzMe8iO+OhOrwg3YxCr9VbEwh24-3MLK+5U82fYg@mail.gmail.com>
References: <CALeDE9NVuztzMe8iO+OhOrwg3YxCr9VbEwh24-3MLK+5U82fYg@mail.gmail.com>
From: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Date: Sat, 5 Nov 2016 14:56:40 -0600
Message-ID: <CA+rpMbK=T+Z=-pML4RHLJpLziy-UuANpUcgKNbq06tMNrdAPKw@mail.gmail.com>
Subject: Re: Issue with dt_to_config with dts files that include headers from dt-bindings
Content-Type: multipart/alternative; boundary=089e01227b5e08d63f0540940782
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--089e01227b5e08d63f0540940782
Content-Type: text/plain; charset=UTF-8

On Nov 4, 2016 1:19 PM, "Peter Robinson" <pbrobinson@gmail.com> wrote:
>
> Hi Gaurav, Rob and Frank,
>
> I've just discovered the dt_to_config script (awesome thanks!) but it
> errors out when a dts(i) includes a header file from dt-bindings. EG
>
> ./scripts/dtc/dt_to_config arch/arm/boot/dts/am335x-boneblack.dts
> In file included from arch/arm/boot/dts/am335x-boneblack.dts:10:0:
> arch/arm/boot/dts/am33xx.dtsi:11:35: error: no include path in which
> to search for dt-bindings/gpio/gpio.h
>  #include <dt-bindings/gpio/gpio.h>
>                                    ^
> arch/arm/boot/dts/am33xx.dtsi:12:40: error: no include path in which
> to search for dt-bindings/pinctrl/am33xx.h
>  #include <dt-bindings/pinctrl/am33xx.h>
>                                         ^
> arch/arm/boot/dts/am335x-boneblack.dts:12:41: error: no include path
> in which to search for dt-bindings/display/tda998x.h
>  #include <dt-bindings/display/tda998x.h>
>                                          ^
> Error: arch/arm/boot/dts/am335x-bone-common.dtsi:33.23-24 syntax error
> FATAL ERROR: Unable to parse input tree
>

In bash do, export ARCH=arm

Works for me!

>
> Regards,
> Peter

--089e01227b5e08d63f0540940782
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Nov 4, 2016 1:19 PM, &quot;Peter Robinson&quot; &lt;<a hr=
ef=3D"mailto:pbrobinson@gmail.com">pbrobinson@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Gaurav, Rob and Frank,<br>
&gt;<br>
&gt; I&#39;ve just discovered the dt_to_config script (awesome thanks!) but=
 it<br>
&gt; errors out when a dts(i) includes a header file from dt-bindings. EG<b=
r>
&gt;<br>
&gt; ./scripts/dtc/dt_to_config arch/arm/boot/dts/am335x-boneblack.dts<br>
&gt; In file included from arch/arm/boot/dts/am335x-boneblack.dts:10:0:<br>
&gt; arch/arm/boot/dts/am33xx.dtsi:11:35: error: no include path in which<b=
r>
&gt; to search for dt-bindings/gpio/gpio.h<br>
&gt; =C2=A0#include &lt;dt-bindings/gpio/gpio.h&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; arch/arm/boot/dts/am33xx.dtsi:12:40: error: no include path in which<b=
r>
&gt; to search for dt-bindings/pinctrl/am33xx.h<br>
&gt; =C2=A0#include &lt;dt-bindings/pinctrl/am33xx.h&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; arch/arm/boot/dts/am335x-boneblack.dts:12:41: error: no include path<b=
r>
&gt; in which to search for dt-bindings/display/tda998x.h<br>
&gt; =C2=A0#include &lt;dt-bindings/display/tda998x.h&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
&gt; Error: arch/arm/boot/dts/am335x-bone-common.dtsi:33.23-24 syntax error=
<br>
&gt; FATAL ERROR: Unable to parse input tree<br>
&gt;</p>
<p dir=3D"ltr">In bash do, export ARCH=3Darm</p>
<p dir=3D"ltr">Works for me!</p>
<p dir=3D"ltr">&gt;<br>
&gt; Regards,<br>
&gt; Peter<br></p>

--089e01227b5e08d63f0540940782--
