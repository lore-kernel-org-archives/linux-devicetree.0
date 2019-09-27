From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Subject: Re: [PATCH 1/4] MIPS: CI20: DTS: Add I2C nodes
Date: Fri, 27 Sep 2019 06:20:26 +0200
Message-ID: <9669145c-ba55-c079-cbd3-f61ffdff7450@deutnet.info>
References: <3f74e79546aff3e2f77e94361685d53f4e44fa7b.1569181001.git.agriveaux@deutnet.info>
 <201909231038.WLeaU93z%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201909231038.WLeaU93z%lkp@intel.com>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

> Hi Alexandre,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190920]
> [if your patch is applied to the wrong git tree, please drop us a note =
to help
> improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
>
> url:    https://github.com/0day-ci/linux/commits/Alexandre-GRIVEAUX/MIP=
S-CI20-DTS-Add-nodes-to-Creator-CI20-board/20190923-041656
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.4.0 make.cross ARCH=3Dmips=20
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:90.1-6 Label or path i2c0 =
not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:168.1-6 Label or path i2c1=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:176.1-6 Label or path i2c2=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:184.1-6 Label or path i2c3=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:192.1-6 Label or path i2c4=
 not found
>    FATAL ERROR: Syntax error parsing input tree
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology =
Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration

Do I need to add the patch "[PATCHv4] MIPS: JZ4780: DTS: Add I2C nodes"
to=A0 the begin of this patchset ?


Thanks.
