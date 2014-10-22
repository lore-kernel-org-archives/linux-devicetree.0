Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1413908111-28165-2-git-send-email-dinguyen@opensource.altera.com>
References: <1413908111-28165-1-git-send-email-dinguyen@opensource.altera.com>
	<1413908111-28165-2-git-send-email-dinguyen@opensource.altera.com>
Date: Wed, 22 Oct 2014 08:43:25 -0700
Message-ID: <CAD=FV=X_MnH-A8MRu8GAfEjDOfuTrR2eW-bnVRqkcJ02wAu7Xw@mail.gmail.com>
Subject: Re: [PATCHv3 1/2] ARM: dts: socfpga: Fix SD card detect
From: Doug Anderson <dianders@chromium.org>
Content-Type: multipart/alternative; boundary=047d7b163507fc2e83050604ce1b
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Jaehoon Chung <jh80.chung@samsung.com>, Dinh Nguyen <dinh.linux@gmail.com>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "atull@opensource.altera.com" <atull@opensource.altera.com>, "s.trumtrar@pengutronix.de" <s.trumtrar@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

--047d7b163507fc2e83050604ce1b
Content-Type: text/plain; charset=UTF-8

Dinh,

On Tue, Oct 21, 2014 at 9:15 AM, <dinguyen@opensource.altera.com> wrote:

> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>
> Without this patch, the booting the SOCFPGA platform would hang at the
> SDMMC driver loading. The issue, debugged by Doug Anderson, turned out
> to be that the GPIO bank used by the SD card-detect was not set to
> status="okay".
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---
> v3: Correctly degugged the issue to be a gpio node not having status="okay"
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> index d7296a5..03a3745 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
> @@ -37,6 +37,12 @@
>                  */
>                 ethernet0 = &gmac1;
>         };
> +
> +       soc {
> +               gpio@ff709000 {
> +                       status = "okay";
> +               };
> +       };
>

I haven't dug into the details you provided about the GPIO infrastructure
of socfpga, but it does seem like it might be nice to some easier way to
reference things in "arch/arm/boot/dts/socfpga.dtsi".

Looking at other examples they call the "gpio@ff708000" "gpio0" and the sub
node something like "porta".  Given that this is the only reference to the
GPIO, it seems like now would be the time to change it.

--047d7b163507fc2e83050604ce1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dinh,<div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Tue, Oct 21, 2014 at 9:15 AM,  <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:dinguyen@opensource.altera.com" target=3D"_blank">dinguyen@opensource.a=
ltera.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">From: Dinh Nguyen &lt;=
<a href=3D"mailto:dinguyen@opensource.altera.com">dinguyen@opensource.alter=
a.com</a>&gt;<br>
<br>
Without this patch, the booting the SOCFPGA platform would hang at the<br>
SDMMC driver loading. The issue, debugged by Doug Anderson, turned out<br>
to be that the GPIO bank used by the SD card-detect was not set to<br>
status=3D&quot;okay&quot;.<br>
<br>
Suggested-by: Doug Anderson &lt;<a href=3D"mailto:dianders@chromium.org">di=
anders@chromium.org</a>&gt;<br>
Signed-off-by: Dinh Nguyen &lt;<a href=3D"mailto:dinguyen@opensource.altera=
.com">dinguyen@opensource.altera.com</a>&gt;<br>
---<br>
v3: Correctly degugged the issue to be a gpio node not having status=3D&quo=
t;okay&quot;<br>
---<br>
=C2=A0arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/d=
ts/socfpga_cyclone5_socdk.dts<br>
index d7296a5..03a3745 100644<br>
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts<br>
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts<br>
@@ -37,6 +37,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet0 =3D &amp;=
gmac1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0soc {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio@ff709000 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br></blockquote><div><br></div><div>I haven&=
#39;t dug into the details you provided about the GPIO infrastructure of so=
cfpga, but it does seem like it might be nice to some easier way to referen=
ce things in &quot;arch/arm/boot/dts/socfpga.dtsi&quot;. =C2=A0</div><div><=
br></div><div>Looking at other examples they call the &quot;gpio@ff708000&q=
uot; &quot;gpio0&quot; and the sub node something like &quot;porta&quot;.=
=C2=A0 Given that this is the only reference to the GPIO, it seems like now=
 would be the time to change it.</div><div><br></div><div><br></div><div><b=
r></div></div></div></div>

--047d7b163507fc2e83050604ce1b--
