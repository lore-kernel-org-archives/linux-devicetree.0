Return-Path: <SRS0=byqR=4V=linaro.org=guodong.xu@kernel.org>
MIME-Version: 1.0
In-Reply-To: <201705151738.ls8RIrFp%fengguang.wu@intel.com>
References: <20170515062745.70082-1-songxiaowei@hisilicon.com> <201705151738.ls8RIrFp%fengguang.wu@intel.com>
From: Guodong Xu <guodong.xu@linaro.org>
Date: Mon, 15 May 2017 17:36:38 +0800
Message-ID: <CAFGCpxwmuEKdc6FF=OmQz8tEipbcO+PjkwmywXLtY5=UxSeKvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: hi3660: add pcie node
Content-Type: multipart/alternative; boundary="001a114934dcb87a80054f8cca4a"
To: kbuild test robot <lkp@intel.com>, "xuwei (O)" <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Song Xiaowei <songxiaowei@hisilicon.com>, kbuild-all@01.org, Bjorn Helgaas <bhelgaas@google.com>, Kishon <kishon@ti.com>, jingoohan1@gmail.com, Arnd Bergmann <arnd@arndb.de>, tn@semihalf.com, keith.busch@intel.com, Niklas Cassel <niklas.cassel@axis.com>, Duc Dang <dhdang@apm.com>, "liudongdong (C)" <liudongdong3@huawei.com>, "Chenfeng (puck)" <puck.chen@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, Suzhuangluan <suzhuangluan@hisilicon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a114934dcb87a80054f8cca4a
Content-Type: text/plain; charset="UTF-8"

This PCIe node has dependencies on &crg_ctrl and &gpio11. However, both of
them are not appearing in mainline kernel tree yet. Sorry about that. But I
do have a plan to send all dts related changes to maillist within this
week, no later than this Wed (17/May). Would it be possible you maintainers
review this patch in parallel?

+Device tree maintainers.

-Guodong


On Mon, May 15, 2017 at 5:18 PM, kbuild test robot <lkp@intel.com> wrote:

> Hi Song,
>
> [auto build test ERROR on pci/next]
> [also build test ERROR on v4.12-rc1 next-20170515]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Song-Xiaowei/
> arm64-dts-hi3660-add-pcie-node/20170515-144035
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
> next
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/
> sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64
>
> All errors (new ones prefixed by >>):
>
> >> Error: arch/arm64/boot/dts/hisilicon/hi3660.dtsi:180.24-25 syntax error
>    FATAL ERROR: Unable to parse input tree
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
>

--001a114934dcb87a80054f8cca4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This PCIe node has dependencies on &amp;crg_ctrl and &amp;=
gpio11. However, both of them are not appearing in mainline kernel tree yet=
. Sorry about that. But I do have a plan to send all dts related changes to=
 maillist within this week, no later than this Wed (17/May). Would it be po=
ssible you maintainers review this patch in parallel?=C2=A0<div><br></div><=
div>+Device tree maintainers.</div><div><br></div><div>-Guodong</div><div>=
=C2=A0<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Mon, May 15, 2017 at 5:18 PM, kbuild test robot <span dir=3D"ltr">&=
lt;<a href=3D"mailto:lkp@intel.com" target=3D"_blank">lkp@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Song,<br>
<br>
[auto build test ERROR on pci/next]<br>
[also build test ERROR on v4.12-rc1 next-20170515]<br>
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp improve the system]<br>
<br>
url:=C2=A0 =C2=A0 <a href=3D"https://github.com/0day-ci/linux/commits/Song-=
Xiaowei/arm64-dts-hi3660-add-pcie-node/20170515-144035" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/0day-ci/<wbr>linux/commits/Song-Xiaowe=
i/<wbr>arm64-dts-hi3660-add-pcie-<wbr>node/20170515-144035</a><br>
base:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/gi=
t/helgaas/pci.git" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.=
org/pub/<wbr>scm/linux/kernel/git/helgaas/<wbr>pci.git</a> next<br>
config: arm64-defconfig (attached as .config)<br>
compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705<br>
reproduce:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wget <a href=3D"https://raw.githubusercontent.c=
om/01org/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer" target=3D"_bl=
ank">https://raw.githubusercontent.<wbr>com/01org/lkp-tests/master/<wbr>sbi=
n/make.cross</a> -O ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x ~/bin/make.cross<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # save the attached .config to linux build tree=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make.cross ARCH=3Darm64<br>
<br>
All errors (new ones prefixed by &gt;&gt;):<br>
<br>
&gt;&gt; Error: arch/arm64/boot/dts/hisilicon/<wbr>hi3660.dtsi:180.24-25 sy=
ntax error<br>
=C2=A0 =C2=A0FATAL ERROR: Unable to parse input tree<br>
<br>
---<br>
0-DAY kernel test infrastructure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Open Source Technology Center<br>
<a href=3D"https://lists.01.org/pipermail/kbuild-all" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.01.org/<wbr>pipermail/kbuild-all</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Corpora=
tion<br>
</blockquote></div><br></div>

--001a114934dcb87a80054f8cca4a--
