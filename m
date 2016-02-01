From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V7 2/8] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Mon, 1 Feb 2016 09:02:39 +0000
Message-ID: <20160201090239.GB3368@x1>
References: <201601310157.sKXyINX7%fengguang.wu@intel.com>
 <56ACEEE1.1050800@nvidia.com>
 <20160201082553.GW3368@x1>
 <56AF17D6.2090106@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56AF17D6.2090106@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Mon, 01 Feb 2016, Laxman Dewangan wrote:

>=20
> On Monday 01 February 2016 01:55 PM, Lee Jones wrote:
> >On Sat, 30 Jan 2016, Laxman Dewangan wrote:
> >
> >>This depends on patch
> >>[PATCH V2] mfd: core: add macro for adding mfd cells
> >>
> >>and due to absence of this patch, it reports the error.
> >If you have dependencies, why aren't they in this set?
> >
>=20
> This change is not related to the series as such and so independent.
> I just thought that mentioning on commit log will be fine here. May
> be I missed some points here.

If you have patches which use/depend on it, then it's not so
independent, right?

> Let me know if I need to add this to back on series.
=20
In order to avoid any mishaps, that would be preferable, yes.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
