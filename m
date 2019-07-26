Return-Path: <SRS0=qReI=VX=us.ibm.com=anoo@kernel.org>
In-Reply-To: <20190726053959.2003-7-andrew@aj.id.au>
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 26 Jul 2019 12:53:29 -0500
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-7-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 006246DF86258443_="
Message-Id: <OF8D1EDAE6.971111FC-ON86258443.0062157C-86258443.00624798@notes.na.collabserv.com>
Subject: Re:  [PATCH 06/17] ARM: dts: swift: Cleanup gpio-keys-polled properties
To: Andrew Jeffery <andrew@aj.id.au>
Cc: devicetree@vger.kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>


--=_alternative 006246DF86258443_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Andrew Jeffery <andrew@aj.id.au> wrote on 07/26/2019 12:39:48 AM:

> From: Andrew Jeffery <andrew@aj.id.au>
> To: linux-aspeed@lists.ozlabs.org
> Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,=20
> mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org,=20
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,=20
> Adriana Kobylak <anoo@us.ibm.com>
> Date: 07/26/2019 12:40 AM
> Subject: [EXTERNAL] [PATCH 06/17] ARM: dts: swift: Cleanup gpio-
> keys-polled properties
>=20
> dtbs=5Fcheck gave the following warning:
>=20
>     Warning (avoid=5Funnecessary=5Faddr=5Fsize): /gpio-keys-polled:=20
> unnecessary #address-cells/#size-cells without "ranges" or child=20
> "reg" property
>=20
> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/
> boot/dts/aspeed-bmc-opp-swift.dts
> index 2077e8d0e096..9f934509ca1b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -82,8 +82,6 @@
>=20
>     gpio-keys-polled {
>        compatible =3D "gpio-keys-polled";
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
>        poll-interval =3D <1000>;
>=20
>        scm0-presence {
> --=20
> 2.20.1
>=20



--=_alternative 006246DF86258443_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"


<br><tt><span style=3D" font-size:10pt">Andrew Jeffery &lt;andrew@aj.id.au&=
gt;
wrote on 07/26/2019 12:39:48 AM:<br><br>&gt; From: Andrew Jeffery &lt;andre=
w@aj.id.au&gt;</span></tt><br><tt><span style=3D" font-size:10pt">&gt; To: =
linux-aspeed@lists.ozlabs.org</span></tt><br><tt><span style=3D" font-size:=
10pt">&gt; Cc: Andrew Jeffery &lt;andrew@aj.id.au&gt;,
robh+dt@kernel.org, <br>&gt; mark.rutland@arm.com, joel@jms.id.au, devicetr=
ee@vger.kernel.org,
<br>&gt; linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
<br>&gt; Adriana Kobylak &lt;anoo@us.ibm.com&gt;</span></tt><br><tt><span s=
tyle=3D" font-size:10pt">&gt; Date: 07/26/2019 12:40 AM</span></tt><br><tt>=
<span style=3D" font-size:10pt">&gt; Subject: [EXTERNAL] [PATCH 06/17]
ARM: dts: swift: Cleanup gpio-<br>&gt; keys-polled properties</span></tt><b=
r><tt><span style=3D" font-size:10pt">&gt; <br>&gt; dtbs=5Fcheck gave the f=
ollowing warning:<br>&gt; <br>&gt; &nbsp; &nbsp; Warning (avoid=5Funnecessa=
ry=5Faddr=5Fsize): /gpio-keys-polled:
<br>&gt; unnecessary #address-cells/#size-cells without &quot;ranges&quot;
or child <br>&gt; &quot;reg&quot; property<br>&gt; <br>&gt; Cc: Adriana Kob=
ylak &lt;anoo@us.ibm.com&gt;<br>&gt; Signed-off-by: Andrew Jeffery &lt;andr=
ew@aj.id.au&gt;</span></tt><br><br><tt><span style=3D" font-size:10pt">Revi=
ewed-by: Adriana Kobylak &lt;anoo@us.ibm.com&gt;</span></tt><br><tt><span s=
tyle=3D" font-size:10pt">Tested-by: Adriana Kobylak &lt;anoo@us.ibm.com&gt;=
</span></tt><br><tt><span style=3D" font-size:10pt"><br>&gt; ---<br>&gt; &n=
bsp;arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 2 --<br>&gt; &nbsp;1 file =
changed, 2 deletions(-)<br>&gt; <br>&gt; diff --git a/arch/arm/boot/dts/asp=
eed-bmc-opp-swift.dts b/arch/arm/<br>&gt; boot/dts/aspeed-bmc-opp-swift.dts=
<br>&gt; index 2077e8d0e096..9f934509ca1b 100644<br>&gt; --- a/arch/arm/boo=
t/dts/aspeed-bmc-opp-swift.dts<br>&gt; +++ b/arch/arm/boot/dts/aspeed-bmc-o=
pp-swift.dts<br>&gt; @@ -82,8 +82,6 @@<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp;=
 gpio-keys-polled {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;compatible =3D &quot=
;gpio-keys-polled&quot;;<br>&gt; - &nbsp; &nbsp; &nbsp;#address-cells =3D &=
lt;1&gt;;<br>&gt; - &nbsp; &nbsp; &nbsp;#size-cells =3D &lt;0&gt;;<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp;poll-interval =3D &lt;1000&gt;;<br>&gt; &nbsp;<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp;scm0-presence {<br>&gt; -- <br>&gt; 2.20.=
1<br>&gt; <br></span></tt><BR>

--=_alternative 006246DF86258443_=--
