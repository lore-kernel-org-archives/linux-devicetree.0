Return-Path: <SRS0=UenW=25=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170320095721.6724-4-borneo.antonio@gmail.com>
References: <20170320095721.6724-1-borneo.antonio@gmail.com> <20170320095721.6724-4-borneo.antonio@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Mon, 20 Mar 2017 16:52:16 -0400
Message-ID: <CAC3K-4rbHVZgBoLqR1RoLf7noqMu948E0n6CCnfjFnC5Bw1EFw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: NS2: Remove nonexistent properties
Content-Type: multipart/alternative; boundary=f403045fc34ce6b910054b2fb3d7
To: Antonio Borneo <borneo.antonio@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Russell King <linux@armlinux.org.uk>, Brijesh Singh <brijeshkumar.singh@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-spi@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--f403045fc34ce6b910054b2fb3d7
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 5:57 AM, Antonio Borneo <borneo.antonio@gmail.com>
wrote:

> The properties "pl022,hierarchy" and "pl022,slave-tx-disable" are
> not documented in DT binding and don't exist in the driver code.
> They have no effect and can be removed.
>
> Signed-off-by: Antonio Borneo <borneo.antonio@gmail.com>
>

A quick grep confirms that it is not used in the driver.  So, I am fine
with this.

Acked-by: Jon Mason <jon.mason@broadcom.com>



> ---
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Brijesh Singh <brijeshkumar.singh@amd.com>
> Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Jon Mason <jonmason@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-spi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/broadcom/ns2-svk.dts | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> index 5ae08161649e..2fbd3cd40def 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> @@ -113,9 +113,7 @@
>                 spi-max-frequency = <5000000>;
>                 spi-cpha = <1>;
>                 spi-cpol = <1>;
> -               pl022,hierarchy = <0>;
>                 pl022,interface = <0>;
> -               pl022,slave-tx-disable = <0>;
>                 pl022,com-mode = <0>;
>                 pl022,rx-level-trig = <1>;
>                 pl022,tx-level-trig = <1>;
> @@ -137,9 +135,7 @@
>                 at25,page-size = <64>;
>                 spi-cpha = <1>;
>                 spi-cpol = <1>;
> -               pl022,hierarchy = <0>;
>                 pl022,interface = <0>;
> -               pl022,slave-tx-disable = <0>;
>                 pl022,com-mode = <0>;
>                 pl022,rx-level-trig = <1>;
>                 pl022,tx-level-trig = <1>;
> --
> 2.12.0
>
>

--f403045fc34ce6b910054b2fb3d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 20, 2017 at 5:57 AM, Antonio Borneo <span dir=3D"ltr">&lt;<=
a href=3D"mailto:borneo.antonio@gmail.com" target=3D"_blank">borneo.antonio=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The properties &quot;pl022,hierarchy&quot; and &quot;pl022,slave=
-tx-disable&quot; are<br>
not documented in DT binding and don&#39;t exist in the driver code.<br>
They have no effect and can be removed.<br>
<br>
Signed-off-by: Antonio Borneo &lt;<a href=3D"mailto:borneo.antonio@gmail.co=
m">borneo.antonio@gmail.com</a>&gt;<br></blockquote><div><br></div><div>A q=
uick grep confirms that it is not used in the driver.=C2=A0 So, I am fine w=
ith this.</div><div><br></div><div>Acked-by: Jon Mason &lt;<a href=3D"mailt=
o:jon.mason@broadcom.com">jon.mason@broadcom.com</a>&gt;</div><div><br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Cc: Mark Brown &lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org=
</a>&gt;<br>
Cc: Rob Herring &lt;<a href=3D"mailto:robh%2Bdt@kernel.org">robh+dt@kernel.=
org</a>&gt;<br>
Cc: Mark Rutland &lt;<a href=3D"mailto:mark.rutland@arm.com">mark.rutland@a=
rm.com</a>&gt;<br>
Cc: Viresh Kumar &lt;<a href=3D"mailto:vireshk@kernel.org">vireshk@kernel.o=
rg</a>&gt;<br>
Cc: Shiraz Hashim &lt;<a href=3D"mailto:shiraz.linux.kernel@gmail.com">shir=
az.linux.kernel@gmail.com</a><wbr>&gt;<br>
Cc: Russell King &lt;<a href=3D"mailto:linux@armlinux.org.uk">linux@armlinu=
x.org.uk</a>&gt;<br>
Cc: Brijesh Singh &lt;<a href=3D"mailto:brijeshkumar.singh@amd.com">brijesh=
kumar.singh@amd.com</a>&gt;<br>
Cc: Suravee Suthikulpanit &lt;<a href=3D"mailto:suravee.suthikulpanit@amd.c=
om">suravee.suthikulpanit@amd.com</a><wbr>&gt;<br>
Cc: Tom Lendacky &lt;<a href=3D"mailto:thomas.lendacky@amd.com">thomas.lend=
acky@amd.com</a>&gt;<br>
Cc: Catalin Marinas &lt;<a href=3D"mailto:catalin.marinas@arm.com">catalin.=
marinas@arm.com</a>&gt;<br>
Cc: Will Deacon &lt;<a href=3D"mailto:will.deacon@arm.com">will.deacon@arm.=
com</a>&gt;<br>
To: Ray Jui &lt;<a href=3D"mailto:rjui@broadcom.com">rjui@broadcom.com</a>&=
gt;<br>
To: Scott Branden &lt;<a href=3D"mailto:sbranden@broadcom.com">sbranden@bro=
adcom.com</a>&gt;<br>
To: Jon Mason &lt;<a href=3D"mailto:jonmason@broadcom.com">jonmason@broadco=
m.com</a>&gt;<br>
Cc: <a href=3D"mailto:bcm-kernel-feedback-list@broadcom.com">bcm-kernel-fee=
dback-list@<wbr>broadcom.com</a><br>
Cc: <a href=3D"mailto:linux-spi@vger.kernel.org">linux-spi@vger.kernel.org<=
/a><br>
Cc: <a href=3D"mailto:devicetree@vger.kernel.org">devicetree@vger.kernel.or=
g</a><br>
Cc: <a href=3D"mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kerne=
l.org</a><br>
Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kerne=
l@lists.<wbr>infradead.org</a><br>
---<br>
=C2=A0arch/arm64/boot/dts/broadcom/<wbr>ns2-svk.dts | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/arch/arm64/boot/dts/<wbr>broadcom/ns2-svk.dts b/arch/arm64/boo=
t/dts/<wbr>broadcom/ns2-svk.dts<br>
index 5ae08161649e..2fbd3cd40def 100644<br>
--- a/arch/arm64/boot/dts/<wbr>broadcom/ns2-svk.dts<br>
+++ b/arch/arm64/boot/dts/<wbr>broadcom/ns2-svk.dts<br>
@@ -113,9 +113,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-max-frequency =
=3D &lt;5000000&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-cpha =3D &lt;1&=
gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-cpol =3D &lt;1&=
gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl022,hierarchy =3D=
 &lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,interface =3D=
 &lt;0&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl022,slave-tx-disa=
ble =3D &lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,com-mode =3D =
&lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,rx-level-trig=
 =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,tx-level-trig=
 =3D &lt;1&gt;;<br>
@@ -137,9 +135,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 at25,page-size =3D =
&lt;64&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-cpha =3D &lt;1&=
gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-cpol =3D &lt;1&=
gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl022,hierarchy =3D=
 &lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,interface =3D=
 &lt;0&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pl022,slave-tx-disa=
ble =3D &lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,com-mode =3D =
&lt;0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,rx-level-trig=
 =3D &lt;1&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pl022,tx-level-trig=
 =3D &lt;1&gt;;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br></div></div>

--f403045fc34ce6b910054b2fb3d7--
