Return-Path: <SRS0=dopm=DS=gmail.com=zongbox@kernel.org>
Date: Fri, 22 Dec 2017 05:07:47 -0800 (PST)
From: zongbox@gmail.com
Message-Id: <bfc6ad4a-a028-4121-bc8e-3d24d845a97a@groups.riscv.org>
In-Reply-To: <mhng-40be3873-485c-4cb6-9990-1137745f5425@palmer-si-x1c4>
References: <CAK8P3a2TVbrnjN00iZe2R_FNzLB+82BkiekPOwqtt6WDgFw30w@mail.gmail.com>
 <mhng-40be3873-485c-4cb6-9990-1137745f5425@palmer-si-x1c4>
Subject: Re: [patches] [PATCH] RISC-V: Support built-in dtb
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_8301_1113229977.1513948067766"
To: RISC-V Patches <patches@groups.riscv.org>
Cc: arnd@arndb.de, zongbox@gmail.com, olof@lixom.net, albert@sifive.com, robh+dt@kernel.org, mark.rutland@arm.com, wesley@sifive.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, zong@andestech.com, palmer@sifive.com
List-ID: <devicetree@vger.kernel.org>

------=_Part_8301_1113229977.1513948067766
Content-Type: multipart/alternative;
	boundary="----=_Part_8302_538841906.1513948067767"

------=_Part_8302_538841906.1513948067767
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



Palmer Dabbelt=E6=96=BC 2017=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=BA=94 UTC+8=E4=B8=8A=E5=8D=884=E6=99=8248=E5=88=8606=E7=A7=92=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Thu, 21 Dec 2017 12:43:20 PST (-0800), Arnd Bergmann wrote:=20
> > On Thu, Dec 21, 2017 at 9:32 PM, Palmer Dabbelt <pal...@sifive.com=20
> <javascript:>> wrote:=20
> >> On Wed, 20 Dec 2017 01:14:31 PST (-0800), zon...@gmail.com=20
> <javascript:> wrote:=20
> >=20
> >> I've added Arnd and Olof, in case they have a bit more perspective=20
> here.  If=20
> >> I'm reading this correctly, there isn't an arm or arm64 option to do=
=20
> this.=20
> >> There is an option to built in many DTBs, which makes a lot more sense=
=20
> to me=20
> >> as it doesn't tie the kernel to any one particular implementation.=20
>  We'd=20
> >> need a mechanism for picking the DTB that Linux should use.  We've=20
> kicked=20
> >> around the idea of:=20
> >>=20
> >> * Having the bootloader always provide a DTB.=20
> >> * Taking a hash of that DTB when booting Linux.=20
> >> * Using that hash to look up DTBs that are built in to Linux.=20
> >>=20
> >> This would allow us to support replacing broken DTBs if they escape=20
> into the=20
> >> wild, but would still allow us to have a portable kernel.=20
> >=20
> > Having an embedded DTB is only necessary for platforms with a legacy=20
> bootloader=20
> > that doesn't understand DT at all, you should never need that here.=20
> >=20
> > I would suggest to require each bootloader to provide a way to replace=
=20
> the DTB=20
> > with one that gets installed alongside the kernel.=20
>
> Sounds good to me.=20
>

Palmer Dabbelt=E6=96=BC 2017=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=BA=94 UTC+8=E4=B8=8A=E5=8D=884=E6=99=8248=E5=88=8606=E7=A7=92=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On Thu, 21 Dec 2017 12:43:20 PST (-0800), Arnd Bergmann wrote:=20
> > On Thu, Dec 21, 2017 at 9:32 PM, Palmer Dabbelt <pal...@sifive.com=20
> <javascript:>> wrote:=20
> >> On Wed, 20 Dec 2017 01:14:31 PST (-0800), zon...@gmail.com=20
> <javascript:> wrote:=20
> >=20
> >> I've added Arnd and Olof, in case they have a bit more perspective=20
> here.  If=20
> >> I'm reading this correctly, there isn't an arm or arm64 option to do=
=20
> this.=20
> >> There is an option to built in many DTBs, which makes a lot more sense=
=20
> to me=20
> >> as it doesn't tie the kernel to any one particular implementation.=20
>  We'd=20
> >> need a mechanism for picking the DTB that Linux should use.  We've=20
> kicked=20
> >> around the idea of:=20
> >>=20
> >> * Having the bootloader always provide a DTB.=20
> >> * Taking a hash of that DTB when booting Linux.=20
> >> * Using that hash to look up DTBs that are built in to Linux.=20
> >>=20
> >> This would allow us to support replacing broken DTBs if they escape=20
> into the=20
> >> wild, but would still allow us to have a portable kernel.=20
> >=20
> > Having an embedded DTB is only necessary for platforms with a legacy=20
> bootloader=20
> > that doesn't understand DT at all, you should never need that here.=20
> >=20
> > I would suggest to require each bootloader to provide a way to replace=
=20
> the DTB=20
> > with one that gets installed alongside the kernel.=20
>
> Sounds good to me.=20
>

It's exactly. The portability is the thing that first priority to consider=
=20
in the furture.
The built in DTB function can be found on many architectures, but it seem=
=20
out of date.
I think this is the reason that I can't find any dts file in the kernel=20
source.
I usually use the built in DTB for quick and conveniet development on=20
specific platform.
Thanks a lot.

------=_Part_8302_538841906.1513948067767
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Palmer Dabbelt=E6=96=BC 2017=E5=B9=B412=E6=9C=8822=
=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8=E4=B8=8A=E5=8D=884=E6=99=8248=E5=
=88=8606=E7=A7=92=E5=AF=AB=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quot=
e" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;paddin=
g-left: 1ex;">On Thu, 21 Dec 2017 12:43:20 PST (-0800), Arnd Bergmann wrote=
:
<br>&gt; On Thu, Dec 21, 2017 at 9:32 PM, Palmer Dabbelt &lt;<a href=3D"jav=
ascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"YR5ZPO4bDQAJ" rel=3D"n=
ofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onc=
lick=3D"this.href=3D&#39;javascript:&#39;;return true;">pal...@sifive.com</=
a>&gt; wrote:
<br>&gt;&gt; On Wed, 20 Dec 2017 01:14:31 PST (-0800), <a href=3D"javascrip=
t:" target=3D"_blank" gdf-obfuscated-mailto=3D"YR5ZPO4bDQAJ" rel=3D"nofollo=
w" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=
=3D"this.href=3D&#39;javascript:&#39;;return true;">zon...@gmail.com</a> wr=
ote:
<br>&gt;
<br>&gt;&gt; I&#39;ve added Arnd and Olof, in case they have a bit more per=
spective here. =C2=A0If
<br>&gt;&gt; I&#39;m reading this correctly, there isn&#39;t an arm or arm6=
4 option to do this.
<br>&gt;&gt; There is an option to built in many DTBs, which makes a lot mo=
re sense to me
<br>&gt;&gt; as it doesn&#39;t tie the kernel to any one particular impleme=
ntation. =C2=A0We&#39;d
<br>&gt;&gt; need a mechanism for picking the DTB that Linux should use. =
=C2=A0We&#39;ve kicked
<br>&gt;&gt; around the idea of:
<br>&gt;&gt;
<br>&gt;&gt; * Having the bootloader always provide a DTB.
<br>&gt;&gt; * Taking a hash of that DTB when booting Linux.
<br>&gt;&gt; * Using that hash to look up DTBs that are built in to Linux.
<br>&gt;&gt;
<br>&gt;&gt; This would allow us to support replacing broken DTBs if they e=
scape into the
<br>&gt;&gt; wild, but would still allow us to have a portable kernel.
<br>&gt;
<br>&gt; Having an embedded DTB is only necessary for platforms with a lega=
cy bootloader
<br>&gt; that doesn&#39;t understand DT at all, you should never need that =
here.
<br>&gt;
<br>&gt; I would suggest to require each bootloader to provide a way to rep=
lace the DTB
<br>&gt; with one that gets installed alongside the kernel.
<br>
<br>Sounds good to me.
<br></blockquote><br>Palmer Dabbelt=E6=96=BC 2017=E5=B9=B412=E6=9C=8822=E6=
=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8=E4=B8=8A=E5=8D=884=E6=99=8248=E5=88=
=8606=E7=A7=92=E5=AF=AB=E9=81=93=EF=BC=9A<blockquote class=3D"gmail_quote" =
style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-l=
eft: 1ex;">On Thu, 21 Dec 2017 12:43:20 PST (-0800), Arnd Bergmann wrote:
<br>&gt; On Thu, Dec 21, 2017 at 9:32 PM, Palmer Dabbelt &lt;<a href=3D"jav=
ascript:" target=3D"_blank" gdf-obfuscated-mailto=3D"YR5ZPO4bDQAJ" rel=3D"n=
ofollow" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onc=
lick=3D"this.href=3D&#39;javascript:&#39;;return true;">pal...@sifive.com</=
a>&gt; wrote:
<br>&gt;&gt; On Wed, 20 Dec 2017 01:14:31 PST (-0800), <a href=3D"javascrip=
t:" target=3D"_blank" gdf-obfuscated-mailto=3D"YR5ZPO4bDQAJ" rel=3D"nofollo=
w" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=
=3D"this.href=3D&#39;javascript:&#39;;return true;">zon...@gmail.com</a> wr=
ote:
<br>&gt;
<br>&gt;&gt; I&#39;ve added Arnd and Olof, in case they have a bit more per=
spective here. =C2=A0If
<br>&gt;&gt; I&#39;m reading this correctly, there isn&#39;t an arm or arm6=
4 option to do this.
<br>&gt;&gt; There is an option to built in many DTBs, which makes a lot mo=
re sense to me
<br>&gt;&gt; as it doesn&#39;t tie the kernel to any one particular impleme=
ntation. =C2=A0We&#39;d
<br>&gt;&gt; need a mechanism for picking the DTB that Linux should use. =
=C2=A0We&#39;ve kicked
<br>&gt;&gt; around the idea of:
<br>&gt;&gt;
<br>&gt;&gt; * Having the bootloader always provide a DTB.
<br>&gt;&gt; * Taking a hash of that DTB when booting Linux.
<br>&gt;&gt; * Using that hash to look up DTBs that are built in to Linux.
<br>&gt;&gt;
<br>&gt;&gt; This would allow us to support replacing broken DTBs if they e=
scape into the
<br>&gt;&gt; wild, but would still allow us to have a portable kernel.
<br>&gt;
<br>&gt; Having an embedded DTB is only necessary for platforms with a lega=
cy bootloader
<br>&gt; that doesn&#39;t understand DT at all, you should never need that =
here.
<br>&gt;
<br>&gt; I would suggest to require each bootloader to provide a way to rep=
lace the DTB
<br>&gt; with one that gets installed alongside the kernel.
<br>
<br>Sounds good to me.
<br></blockquote><div><br></div><div>It&#39;s exactly. The portability is t=
he thing that first priority to consider in the furture.</div><div>The buil=
t in DTB function can be found on many architectures, but it seem out of da=
te.</div><div>I think this is the reason that I can&#39;t find any dts file=
 in the kernel source.</div><div>I usually use the built in DTB for quick a=
nd conveniet development on specific platform.</div><div>Thanks a lot.</div=
></div>
------=_Part_8302_538841906.1513948067767--

------=_Part_8301_1113229977.1513948067766--
