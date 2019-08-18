From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Introduce Tanix TX6 board
Date: Mon, 19 Aug 2019 00:18:27 +0200
Message-ID: <CAJiuCcfSejK-fkk1TQW7e-WpjNCqR4h12xTUMYgnCApofL+X6Q@mail.gmail.com>
References: <20190816205342.29552-3-jernej.skrabec@siol.net>
 <201908190222.ZdIp2gT1%lkp@intel.com> <7640522.c0V0aH5rf2@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7640522.c0V0aH5rf2@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: kbuild test robot <lkp@intel.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, 18 Aug 2019 at 21:00, Jernej =C5=A0krabec <jernej.skrabec@siol.net>=
 wrote:
>
> Dne nedelja, 18. avgust 2019 ob 20:42:49 CEST je kbuild test robot napisa=
l(a):
> > Hi Jernej,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [cannot apply to v5.3-rc4 next-20190816]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to
> > help improve the system]
> >
> > url:
> > https://github.com/0day-ci/linux/commits/Jernej-Skrabec/dt-bindings-arm=
-sun
> > xi-Add-compatible-for-Tanix-TX6-board/20190819-002034 config:
> > arm64-defconfig (attached as .config)
> > compiler: aarch64-linux-gcc (GCC) 7.4.0
> > reproduce:
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cros=
s -O
> > ~/bin/make.cross chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=3D7.4.0 make.cross ARCH=3Darm64
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> > >> Error: arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts:83.1-6 =
Label
> > >> or path r_ir not found FATAL ERROR: Syntax error parsing input tree
>
> Strange, Allwinner tree has commit, which introduces r_ir node:
> https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git/commit/?
> h=3Dsunxi/dt-for-5.4&id=3D9267811aad3524c857cf2e16bbadd8c569e15ab9
>
> Maybe kbuild test robot tree doesn't have it?
Yes Kbuild is on v5.3-rc4 vs the IR patch is planned for 5.4.

Regards,
Cl=C3=A9ment

>
> Best regards,
> Jernej
>
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology
> > Center https://lists.01.org/pipermail/kbuild-all                   Inte=
l
> > Corporation
>
>
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
