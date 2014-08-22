Return-Path: <f.fainelli@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 22 Aug 2014 13:42:50 -0700
Message-ID: <CAGVrzcZobuL4z0WNX+Sz4p_uwaPL-S5yvEmgRUwZPJi4+qq0tg@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Content-Type: multipart/alternative; boundary=089e013a0606d1081205013de392
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, Qais Yousef <qais.yousef@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, John Crispin <blogic@openwrt.org>, Mark Rutland <mark.rutland@arm.com>, Jayachandran C <jchandra@broadcom.com>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e013a0606d1081205013de392
Content-Type: text/plain; charset=UTF-8

On Aug 21, 2014 3:05 PM, "Andrew Bresticker" <abrestic@chromium.org> wrote:
>
> To be consistent with other architectures and to avoid unnecessary
> makefile duplication, move all MIPS device-trees to arch/mips/boot/dts
> and build them with a common makefile.

I recall reading that the ARM organization for DTS files was a bit
unfortunate and should have been something like:

arch/arm/boot/dts/<vendor>/

Is this something we should do for the MIPS and update the other
architectures to follow that scheme?

>
> Patch 1 sets up the makefiles for building the DTs in arch/mips/boot/dts
> and introduces the config option BUILTIN_DTB for platforms that require
> it.
>
> Patch 2 introduces the 'dtbs' makefile target to allow building of just
> the DT binaries.
>
> Patches 3-7 move the DTs out of the platform directores.
>
> I've build tested this on all affected platforms (Octeon, Lantiq, SEAD3,
> Netlogic, and Ralink) as well as Malta.  For platforms where builtin DTBs
> are optional (Netlogic and Ralink), I built with and without the builtin
> DTBs.
>
> Based on 3.17-rc1.
>
> Andrew Bresticker (7):
>   MIPS: Create common infrastructure for building built-in device-trees
>   MIPS: Add support for building device-tree binaries
>   MIPS: Octeon: Move device-trees to arch/mips/boot/dts/
>   MIPS: Lantiq: Move device-trees to arch/mips/boot/dts/
>   MIPS: sead3: Move device-trees to arch/mips/boot/dts/
>   MIPS: Netlogic: Move device-trees to arch/mips/boot/dts/
>   MIPS: ralink: Move device-trees to arch/mips/boot/dts/
>
>  arch/mips/Kconfig                                    |  5 +++++
>  arch/mips/Makefile                                   | 11 +++++++++++
>  arch/mips/boot/.gitignore                            |  1 +
>  arch/mips/boot/dts/Makefile                          | 20
++++++++++++++++++++
>  arch/mips/{lantiq => boot}/dts/danube.dtsi           |  0
>  arch/mips/{lantiq => boot}/dts/easy50712.dts         |  0
>  arch/mips/{ralink => boot}/dts/mt7620a.dtsi          |  0
>  arch/mips/{ralink => boot}/dts/mt7620a_eval.dts      |  0
>  .../mips/{cavium-octeon => boot/dts}/octeon_3xxx.dts |  0
>  .../mips/{cavium-octeon => boot/dts}/octeon_68xx.dts |  0
>  arch/mips/{ralink => boot}/dts/rt2880.dtsi           |  0
>  arch/mips/{ralink => boot}/dts/rt2880_eval.dts       |  0
>  arch/mips/{ralink => boot}/dts/rt3050.dtsi           |  0
>  arch/mips/{ralink => boot}/dts/rt3052_eval.dts       |  0
>  arch/mips/{ralink => boot}/dts/rt3883.dtsi           |  0
>  arch/mips/{ralink => boot}/dts/rt3883_eval.dts       |  0
>  arch/mips/{mti-sead3 => boot/dts}/sead3.dts          |  0
>  arch/mips/{netlogic => boot}/dts/xlp_evp.dts         |  0
>  arch/mips/{netlogic => boot}/dts/xlp_fvp.dts         |  0
>  arch/mips/{netlogic => boot}/dts/xlp_gvp.dts         |  0
>  arch/mips/{netlogic => boot}/dts/xlp_svp.dts         |  0
>  arch/mips/cavium-octeon/.gitignore                   |  2 --
>  arch/mips/cavium-octeon/Makefile                     | 10 ----------
>  arch/mips/lantiq/Kconfig                             |  1 +
>  arch/mips/lantiq/Makefile                            |  2 --
>  arch/mips/lantiq/dts/Makefile                        |  1 -
>  arch/mips/mti-sead3/Makefile                         |  4 ----
>  arch/mips/netlogic/Kconfig                           |  4 ++++
>  arch/mips/netlogic/Makefile                          |  1 -
>  arch/mips/netlogic/dts/Makefile                      |  4 ----
>  arch/mips/ralink/Kconfig                             |  4 ++++
>  arch/mips/ralink/Makefile                            |  2 --
>  arch/mips/ralink/dts/Makefile                        |  4 ----
>  33 files changed, 46 insertions(+), 30 deletions(-)
>  create mode 100644 arch/mips/boot/dts/Makefile
>  rename arch/mips/{lantiq => boot}/dts/danube.dtsi (100%)
>  rename arch/mips/{lantiq => boot}/dts/easy50712.dts (100%)
>  rename arch/mips/{ralink => boot}/dts/mt7620a.dtsi (100%)
>  rename arch/mips/{ralink => boot}/dts/mt7620a_eval.dts (100%)
>  rename arch/mips/{cavium-octeon => boot/dts}/octeon_3xxx.dts (100%)
>  rename arch/mips/{cavium-octeon => boot/dts}/octeon_68xx.dts (100%)
>  rename arch/mips/{ralink => boot}/dts/rt2880.dtsi (100%)
>  rename arch/mips/{ralink => boot}/dts/rt2880_eval.dts (100%)
>  rename arch/mips/{ralink => boot}/dts/rt3050.dtsi (100%)
>  rename arch/mips/{ralink => boot}/dts/rt3052_eval.dts (100%)
>  rename arch/mips/{ralink => boot}/dts/rt3883.dtsi (100%)
>  rename arch/mips/{ralink => boot}/dts/rt3883_eval.dts (100%)
>  rename arch/mips/{mti-sead3 => boot/dts}/sead3.dts (100%)
>  rename arch/mips/{netlogic => boot}/dts/xlp_evp.dts (100%)
>  rename arch/mips/{netlogic => boot}/dts/xlp_fvp.dts (100%)
>  rename arch/mips/{netlogic => boot}/dts/xlp_gvp.dts (100%)
>  rename arch/mips/{netlogic => boot}/dts/xlp_svp.dts (100%)
>  delete mode 100644 arch/mips/cavium-octeon/.gitignore
>  delete mode 100644 arch/mips/lantiq/dts/Makefile
>  delete mode 100644 arch/mips/netlogic/dts/Makefile
>  delete mode 100644 arch/mips/ralink/dts/Makefile
>
> --
> 2.1.0.rc2.206.gedb03e5
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--089e013a0606d1081205013de392
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">On Aug 21, 2014 3:05 PM, &quot;Andrew Brest=
icker&quot; &lt;<a href=3D"mailto:abrestic@chromium.org" target=3D"_blank">=
abrestic@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt; To be consistent with other architectures and to avoid unnecessary<br>
&gt; makefile duplication, move all MIPS device-trees to arch/mips/boot/dts=
<br>
&gt; and build them with a common makefile.</p>
<p dir=3D"ltr">I recall reading that the ARM organization for DTS files was=
 a bit unfortunate and should have been something like:</p>
<p dir=3D"ltr">arch/arm/boot/dts/&lt;vendor&gt;/</p>
<p dir=3D"ltr">Is this something we should do for the MIPS and update the o=
ther architectures to follow that scheme?<br></p>
<p dir=3D"ltr">&gt;<br>
&gt; Patch 1 sets up the makefiles for building the DTs in arch/mips/boot/d=
ts<br>
&gt; and introduces the config option BUILTIN_DTB for platforms that requir=
e<br>
&gt; it.<br>
&gt;<br>
&gt; Patch 2 introduces the &#39;dtbs&#39; makefile target to allow buildin=
g of just<br>
&gt; the DT binaries.<br>
&gt;<br>
&gt; Patches 3-7 move the DTs out of the platform directores.<br>
&gt;<br>
&gt; I&#39;ve build tested this on all affected platforms (Octeon, Lantiq, =
SEAD3,<br>
&gt; Netlogic, and Ralink) as well as Malta.=C2=A0 For platforms where buil=
tin DTBs<br>
&gt; are optional (Netlogic and Ralink), I built with and without the built=
in<br>
&gt; DTBs.<br>
&gt;<br>
&gt; Based on 3.17-rc1.<br>
&gt;<br>
&gt; Andrew Bresticker (7):<br>
&gt; =C2=A0 MIPS: Create common infrastructure for building built-in device=
-trees<br>
&gt; =C2=A0 MIPS: Add support for building device-tree binaries<br>
&gt; =C2=A0 MIPS: Octeon: Move device-trees to arch/mips/boot/dts/<br>
&gt; =C2=A0 MIPS: Lantiq: Move device-trees to arch/mips/boot/dts/<br>
&gt; =C2=A0 MIPS: sead3: Move device-trees to arch/mips/boot/dts/<br>
&gt; =C2=A0 MIPS: Netlogic: Move device-trees to arch/mips/boot/dts/<br>
&gt; =C2=A0 MIPS: ralink: Move device-trees to arch/mips/boot/dts/<br>
&gt;<br>
&gt; =C2=A0arch/mips/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +++++<br>
&gt; =C2=A0arch/mips/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 11 +++++++++++<br>
&gt; =C2=A0arch/mips/boot/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; =C2=A0arch/mips/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++++++=
++++++<br>
&gt; =C2=A0arch/mips/{lantiq =3D&gt; boot}/dts/danube.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{lantiq =3D&gt; boot}/dts/easy50712.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/mt7620a.dtsi=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/mt7620a_eval.dts=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 0<br>
&gt; =C2=A0.../mips/{cavium-octeon =3D&gt; boot/dts}/octeon_3xxx.dts |=C2=
=A0 0<br>
&gt; =C2=A0.../mips/{cavium-octeon =3D&gt; boot/dts}/octeon_68xx.dts |=C2=
=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt2880.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt2880_eval.dts=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt3050.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt3052_eval.dts=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt3883.dtsi=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{ralink =3D&gt; boot}/dts/rt3883_eval.dts=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{mti-sead3 =3D&gt; boot/dts}/sead3.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt; =C2=A0arch/mips/{netlogic =3D&gt; boot}/dts/xlp_evp.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{netlogic =3D&gt; boot}/dts/xlp_fvp.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{netlogic =3D&gt; boot}/dts/xlp_gvp.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/{netlogic =3D&gt; boot}/dts/xlp_svp.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt; =C2=A0arch/mips/cavium-octeon/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
&gt; =C2=A0arch/mips/cavium-octeon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ----------<br>
&gt; =C2=A0arch/mips/lantiq/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 +<br>
&gt; =C2=A0arch/mips/lantiq/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br=
>
&gt; =C2=A0arch/mips/lantiq/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; =C2=A0arch/mips/mti-sead3/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt; =C2=A0arch/mips/netlogic/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<b=
r>
&gt; =C2=A0arch/mips/netlogic/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; =C2=A0arch/mips/netlogic/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
&gt; =C2=A0arch/mips/ralink/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 ++++<br>
&gt; =C2=A0arch/mips/ralink/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br=
>
&gt; =C2=A0arch/mips/ralink/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
&gt; =C2=A033 files changed, 46 insertions(+), 30 deletions(-)<br>
&gt; =C2=A0create mode 100644 arch/mips/boot/dts/Makefile<br>
&gt; =C2=A0rename arch/mips/{lantiq =3D&gt; boot}/dts/danube.dtsi (100%)<br=
>
&gt; =C2=A0rename arch/mips/{lantiq =3D&gt; boot}/dts/easy50712.dts (100%)<=
br>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/mt7620a.dtsi (100%)<b=
r>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/mt7620a_eval.dts (100=
%)<br>
&gt; =C2=A0rename arch/mips/{cavium-octeon =3D&gt; boot/dts}/octeon_3xxx.dt=
s (100%)<br>
&gt; =C2=A0rename arch/mips/{cavium-octeon =3D&gt; boot/dts}/octeon_68xx.dt=
s (100%)<br>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt2880.dtsi (100%)<br=
>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt2880_eval.dts (100%=
)<br>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt3050.dtsi (100%)<br=
>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt3052_eval.dts (100%=
)<br>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt3883.dtsi (100%)<br=
>
&gt; =C2=A0rename arch/mips/{ralink =3D&gt; boot}/dts/rt3883_eval.dts (100%=
)<br>
&gt; =C2=A0rename arch/mips/{mti-sead3 =3D&gt; boot/dts}/sead3.dts (100%)<b=
r>
&gt; =C2=A0rename arch/mips/{netlogic =3D&gt; boot}/dts/xlp_evp.dts (100%)<=
br>
&gt; =C2=A0rename arch/mips/{netlogic =3D&gt; boot}/dts/xlp_fvp.dts (100%)<=
br>
&gt; =C2=A0rename arch/mips/{netlogic =3D&gt; boot}/dts/xlp_gvp.dts (100%)<=
br>
&gt; =C2=A0rename arch/mips/{netlogic =3D&gt; boot}/dts/xlp_svp.dts (100%)<=
br>
&gt; =C2=A0delete mode 100644 arch/mips/cavium-octeon/.gitignore<br>
&gt; =C2=A0delete mode 100644 arch/mips/lantiq/dts/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/mips/netlogic/dts/Makefile<br>
&gt; =C2=A0delete mode 100644 arch/mips/ralink/dts/Makefile<br>
&gt;<br>
&gt; --<br>
&gt; 2.1.0.rc2.206.gedb03e5<br>
&gt;<br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe devicet=
ree&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org" =
target=3D"_blank">majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordo=
mo-info.html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html<=
/a><br>
</p>
</div>

--089e013a0606d1081205013de392--
