From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 1/2] ARM: berlin: add the LIBGPIO as a dependency for the
 BG2Q
Date: Tue, 15 Apr 2014 11:27:46 +0200
Message-ID: <20140415092746.GC4584@kwain>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
 <534CF901.2080400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <534CF901.2080400@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sebastian,

On Tue, Apr 15, 2014 at 11:16:49AM +0200, Sebastian Hesselbarth wrote:
> On 04/15/2014 10:07 AM, Antoine T=C3=A9nart wrote:

[=E2=80=A6]

> >diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kco=
nfig
> >index 291f1cac6c3d..c31968712095 100644
> >--- a/arch/arm/mach-berlin/Kconfig
> >+++ b/arch/arm/mach-berlin/Kconfig
> >@@ -28,6 +28,7 @@ config MACH_BERLIN_BG2Q
> >  	select CPU_V7
> >  	select HAVE_ARM_TWD if SMP
> >  	select HAVE_SMP
> >+	select ARCH_REQUIRE_GPIOLIB
>=20
> Apart from Jisheng's comment, I think we can directly move it
> into arch/arm/Kconfig's MACH_BERLIN directly?

I think so.

Antoine

--=20
Antoine T=C3=A9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
