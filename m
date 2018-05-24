Return-Path: <SRS0=0Bfh=IL=endian.se=benjamin.lindqvist@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
References: <cover.1526990589.git.stefan@agner.ch> <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
From: Benjamin Lindqvist <benjamin.lindqvist@endian.se>
Date: Thu, 24 May 2018 09:40:44 +0200
Message-ID: <CAGefG56E+hqg6rso5RLvzcmDSen0Ea5AJeQrVmKEtU0RtSNcSg@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Content-Type: multipart/alternative; boundary="000000000000ec0670056ceec4ef"
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, miquel.raynal@bootlin.com, richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000ec0670056ceec4ef
Content-Type: text/plain; charset="UTF-8"

Hi Stefan (and all),

First off, I apoloigize in advance if I'm deviating from common kernel
mailing list courtesy -- this is my first time responding. I just have a
comment on the NAND driver that I'd like to bring to the public.

> +       switch (mtd->oobsize) {
> ...
> +       case 224:
> +               mtd_set_ooblayout(mtd, &tegra_nand_oob_224_ops);
> +               chip->ecc.strength = 8;
> +               chip->ecc.bytes = 18;
> +               value |= CFG_ECC_SEL | CFG_TVAL_8;
> +               break; +       case 224:

I am not sure how you arrived at this oobsize-based inference. I have not
seen any explicit relation between oob size and ECC algorithm used in the
reference manual. Indeed, the U-Boot I was working on (a fork of the
Toradex 2015.04 U-Boot) always has oobsize == 224 but used either BCH[t=16]
or RS[t=4]. In fact, we tried choosing RS[t=8] in U-Boot but we failed to
make the BootROM decode this at all. So we had to use RS[t=4]. But changing
the algorithm did not automatically change the oobsize, at least it didn't
for us. So maybe you should consider if this is really the way to go about
deciding which algorithm is used.

Note that we're in fact using this patch set in Linux today, but we had to
remove the oobsize inference part. Currently we're simply hard coding it to
CFG_TVAL_4, but maybe it would be cleaner to add ECC algo as a board config
instead, e.g. in the .dts file or whatever. This seems to be done by other
vendors already, see for example excerpt of
Documentation/devicetree/bindings/mtd/gpmc-nand.txt
below:

 - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
"sw" 1-bit Hamming ecc code via software
"hw" <deprecated> use "ham1" instead
"hw-romcode" <deprecated> use "ham1" instead
"ham1" 1-bit Hamming ecc code
"bch4" 4-bit BCH ecc code
"bch8" 8-bit BCH ecc code
"bch16" 16-bit BCH ECC code
Refer below "How to select correct ECC scheme for your device ?"

It seems as if this method would be equally applicable to Tegra NAND.

Best regards,
Benjamin

--000000000000ec0670056ceec4ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
font-size:12.8px;float:none;display:inline">Hi Stefan (and all),</span><div=
><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;font-size:12.8px=
;float:none;display:inline"><br></span></div><div><span style=3D"font-size:=
12.8px">First off, I apoloigize in advance if I&#39;m deviating from common=
 kernel mailing list courtesy -- this is my first time responding. I just h=
ave a comment on the NAND driver that I&#39;d like to bring to the public.<=
/span></div><div><br></div><div><span style=3D"font-size:12.8px"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (mtd-&gt;oobsize) =
{</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial">&gt; ...=C2=A0</span></div><div><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;font-size:12.8px;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0case 224:</span><br style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;font-size:12.8px"><span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;font-size:12.8px;float:none;display:inline">&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd_set_ooblayout(mtd, =
&amp;tegra_nand_oob_224_ops);</span><br style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;font-size:12.8px"><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;font-size:12.8px;float:none;display:inline">&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chip-&gt;ecc.strength =3D 8=
;</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;font-size:1=
2.8px"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;font-size:=
12.8px;float:none;display:inline">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0chip-&gt;ecc.bytes =3D 18;</span><br style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;font-size:12.8px"><span style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;font-size:12.8px;float:none;display:inli=
ne">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value |=3D=
 CFG_ECC_SEL | CFG_TVAL_8;</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;font-size:12.8px"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;font-size:12.8px;float:none;display:inline">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;</span><span style=3D"fo=
nt-size:12.8px">=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 224:</span><div><br>=
</div><div><span style=3D"font-size:12.8px">I am not sure how you arrived a=
t this oobsize-based inference. I have not seen any explicit relation betwe=
en oob size and ECC algorithm used in the reference manual. Indeed, the U-B=
oot I was working on (a fork of the Toradex <span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">2015=
.04=C2=A0</span>U-Boot) always has oobsize =3D=3D 224 but used either BCH[t=
=3D16] or RS[t=3D4]. In fact, we tried choosing RS[t=3D8] in U-Boot but we =
failed to make the BootROM decode this at all. So we had to use RS[t=3D4]. =
But changing the algorithm did not automatically change the oobsize, at lea=
st it didn&#39;t for us. So maybe you should consider if this is really the=
 way to go about deciding which algorithm is used.</span></div><div><span s=
tyle=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12=
.8px">Note that we&#39;re in fact using this patch set in Linux today, but =
we had to remove the oobsize inference part. Currently we&#39;re simply har=
d coding it to CFG_TVAL_4, but=C2=A0</span><span style=3D"font-size:12.8px"=
>maybe it would be cleaner to add ECC algo as a board config instead, e.g. =
in the .dts file or whatever. This seems to be done by other vendors alread=
y, see for example excerpt of=C2=A0</span><span style=3D"font-size:12.8px">=
Documentation/devicetree/bindings/mtd/gpmc-nand.txt below:</span></div><div=
><span style=3D"font-size:12.8px"><br></span></div><div><div><span style=3D=
"font-size:12.8px">=C2=A0- ti,nand-ecc-opt:<span style=3D"white-space:pre">=
		</span>A string setting the ECC layout to use. One of:</span></div><div><=
span style=3D"font-size:12.8px"><span style=3D"white-space:pre">		</span>&q=
uot;sw&quot;<span style=3D"white-space:pre">		</span>1-bit Hamming ecc code=
 via software</span></div><div><span style=3D"font-size:12.8px"><span style=
=3D"white-space:pre">		</span>&quot;hw&quot;<span style=3D"white-space:pre"=
>		</span>&lt;deprecated&gt; use &quot;ham1&quot; instead</span></div><div>=
<span style=3D"font-size:12.8px"><span style=3D"white-space:pre">		</span>&=
quot;hw-romcode&quot;<span style=3D"white-space:pre">	</span>&lt;deprecated=
&gt; use &quot;ham1&quot; instead</span></div><div><span style=3D"font-size=
:12.8px"><span style=3D"white-space:pre">		</span>&quot;ham1&quot;<span sty=
le=3D"white-space:pre">		</span>1-bit Hamming ecc code</span></div><div><sp=
an style=3D"font-size:12.8px"><span style=3D"white-space:pre">		</span>&quo=
t;bch4&quot;<span style=3D"white-space:pre">		</span>4-bit BCH ecc code</sp=
an></div><div><span style=3D"font-size:12.8px"><span style=3D"white-space:p=
re">		</span>&quot;bch8&quot;<span style=3D"white-space:pre">		</span>8-bit=
 BCH ecc code</span></div><div><span style=3D"font-size:12.8px"><span style=
=3D"white-space:pre">		</span>&quot;bch16&quot;<span style=3D"white-space:p=
re">		</span>16-bit BCH ECC code</span></div><div><span style=3D"font-size:=
12.8px"><span style=3D"white-space:pre">		</span>Refer below &quot;How to s=
elect correct ECC scheme for your device ?&quot;</span></div><div style=3D"=
font-size:12.8px"><br></div></div><div style=3D"font-size:12.8px">It seems =
as if this method would be equally applicable to Tegra NAND.</div><div><spa=
n style=3D"font-size:12.8px"><br></span></div><div>Best regards,</div></div=
><div>Benjamin</div></div>

--000000000000ec0670056ceec4ef--
