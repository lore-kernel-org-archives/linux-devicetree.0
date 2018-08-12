Return-Path: <SRS0=p8e2=K3=gmail.com=ctatlor97@kernel.org>
MIME-Version: 1.0
References: <20180811162549.12312-1-ctatlor97@gmail.com> <201808120959.98WQBsJj%fengguang.wu@intel.com>
In-Reply-To: <201808120959.98WQBsJj%fengguang.wu@intel.com>
From: Craig Tatlor <ctatlor97@gmail.com>
Date: Sun, 12 Aug 2018 08:06:47 +0100
Message-ID: <CAALoacrF2yqmPGcrjKikmo+W0R5xdBWZ-YZ7dvB9HT+PFxwyjg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sdm630 SoC and Sony Pioneer (Xperia XA2) support
Content-Type: multipart/alternative; boundary="0000000000006a6c650573379f27"
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000006a6c650573379f27
Content-Type: text/plain; charset="UTF-8"

Oh, yeah, forgot to mention this patch depends on all of these:
https://patchwork.kernel.org/bundle/opendata/Pioneer%20Mainline/

On Sun, 12 Aug 2018, 03:12 kbuild test robot, <lkp@intel.com> wrote:

> Hi Craig,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on agross/for-next]
> [also build test ERROR on v4.18-rc8 next-20180810]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improve the system]
>
> url:
> https://github.com/0day-ci/linux/commits/Craig-Tatlor/arm64-dts-sdm630-SoC-and-Sony-Pioneer-Xperia-XA2-support/20180812-061913
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
> for-next
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/arm64/boot/dts/qcom/sdm630-pioneer.dtsi:4:0,
>                     from arch/arm64/boot/dts/qcom/sdm630-pioneer.dts:6:
> >> arch/arm64/boot/dts/qcom/sdm630.dtsi:5:10: fatal error:
> dt-bindings/clock/qcom,gcc-sdm660.h: No such file or directory
>     #include <dt-bindings/clock/qcom,gcc-sdm660.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> vim +5 arch/arm64/boot/dts/qcom/sdm630.dtsi
>
>      3
>      4  #include <dt-bindings/interrupt-controller/arm-gic.h>
>    > 5  #include <dt-bindings/clock/qcom,gcc-sdm660.h>
>      6
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
>

--0000000000006a6c650573379f27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Oh, yeah, forgot to mention this patch depends on al=
l of these: <a href=3D"https://patchwork.kernel.org/bundle/opendata/Pioneer=
%20Mainline/">https://patchwork.kernel.org/bundle/opendata/Pioneer%20Mainli=
ne/</a><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, 12 Aug 2=
018, 03:12 kbuild test robot, &lt;<a href=3D"mailto:lkp@intel.com">lkp@inte=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Craig,<br>
<br>
Thank you for the patch! Yet something to improve:<br>
<br>
[auto build test ERROR on agross/for-next]<br>
[also build test ERROR on v4.18-rc8 next-20180810]<br>
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp improve the system]<br>
<br>
url:=C2=A0 =C2=A0 <a href=3D"https://github.com/0day-ci/linux/commits/Craig=
-Tatlor/arm64-dts-sdm630-SoC-and-Sony-Pioneer-Xperia-XA2-support/20180812-0=
61913" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/0=
day-ci/linux/commits/Craig-Tatlor/arm64-dts-sdm630-SoC-and-Sony-Pioneer-Xpe=
ria-XA2-support/20180812-061913</a><br>
base:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/agross/linux.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git</a> for-next<br>
config: arm64-defconfig (attached as .config)<br>
compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0<br>
reproduce:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget <a href=3D"https://raw.githubusercontent.c=
om/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross</a> -O ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # save the attached .config to linux build tree=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GCC_VERSION=3D7.2.0 make.cross ARCH=3Darm64 <br=
>
<br>
All errors (new ones prefixed by &gt;&gt;):<br>
<br>
=C2=A0 =C2=A0In file included from arch/arm64/boot/dts/qcom/sdm630-pioneer.=
dtsi:4:0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from =
arch/arm64/boot/dts/qcom/sdm630-pioneer.dts:6:<br>
&gt;&gt; arch/arm64/boot/dts/qcom/sdm630.dtsi:5:10: fatal error: dt-binding=
s/clock/qcom,gcc-sdm660.h: No such file or directory<br>
=C2=A0 =C2=A0 #include &lt;dt-bindings/clock/qcom,gcc-sdm660.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~<br>
=C2=A0 =C2=A0compilation terminated.<br>
<br>
vim +5 arch/arm64/boot/dts/qcom/sdm630.dtsi<br>
<br>
=C2=A0 =C2=A0 =C2=A03=C2=A0 <br>
=C2=A0 =C2=A0 =C2=A04=C2=A0 #include &lt;dt-bindings/interrupt-controller/a=
rm-gic.h&gt;<br>
=C2=A0 =C2=A0&gt; 5=C2=A0 #include &lt;dt-bindings/clock/qcom,gcc-sdm660.h&=
gt;<br>
=C2=A0 =C2=A0 =C2=A06=C2=A0 <br>
<br>
---<br>
0-DAY kernel test infrastructure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Open Source Technology Center<br>
<a href=3D"https://lists.01.org/pipermail/kbuild-all" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://lists.01.org/pipermail/kbuild-all</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Cor=
poration<br>
</blockquote></div></div></div>

--0000000000006a6c650573379f27--
