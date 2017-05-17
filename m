From: Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/3] arm64: dts: add LS1043A DPAA FMan support
Date: Wed, 17 May 2017 11:03:20 +0000
Message-ID: <AM5PR0402MB2691847B7DAA3C3B4A609A9BECE70@AM5PR0402MB2691.eurprd04.prod.outlook.com>
References: <1494936443-14869-3-git-send-email-madalin.bucur@nxp.com>
 <201705171805.DxANFDT3%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201705171805.DxANFDT3%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Shawn,

The patch that failed depends on a patch set that should be in Shawn's tree=
:

	-----Original Message-----
	From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]=20
	Sent: Tuesday, May 16, 2017 4:40 AM
	To: Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
	Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; catalin.marinas@arm.=
com; will.deacon-5wv7dgnIgG8@public.gmane.org; linux-	kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org=
; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
	Subject: Re: [PATCH v2 0/3] arm64: dts: introduce QorIQ DPAA 1.x QBMan dev=
ice tree nodes

	On Mon, May 15, 2017 at 12:21:15PM +0300, Madalin Bucur wrote:
	> Madalin Bucur (3):
	>   arm64: dts: add DPAA QBMan portals
	>   arm64: dts: add LS1043A DPAA QBMan nodes
	>   arm64: dts: add LS1046A DPAA QBMan nodes

	Applied all, thanks.

Crash is related to the use of GIC_SPI and IRQ_TYPE_LEVEL_HIGH that require=
 the
header included in the above patches (<dt-bindings/interrupt-controller/arm=
-gic.h>).

Madalin

> -----Original Message-----
> From: kbuild test robot [mailto:lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org]
> Sent: Wednesday, May 17, 2017 1:42 PM
> To: Madalin-Cristian Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org; shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> catalin.marinas-5wv7dgnIgG8@public.gmane.org; will.deacon-5wv7dgnIgG8@public.gmane.org; Madalin-Cristian Bucur
> <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> Subject: Re: [PATCH 2/3] arm64: dts: add LS1043A DPAA FMan support
>=20
> Hi Madalin,
>=20
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.12-rc1 next-20170517]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Madalin-Bucur/arm64-dts-
> add-DPAA-FMan-nodes/20170517-103731
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
> for-next
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=3Darm64
>=20
> All errors (new ones prefixed by >>):
>=20
> >> Error: arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi:16.16-17 synta=
x
> error
>    FATAL ERROR: Unable to parse input tree
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
