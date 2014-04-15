From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 1/2] ARM: berlin: add the LIBGPIO as a dependency for
 the BG2Q
Date: Tue, 15 Apr 2014 17:07:50 +0800
Message-ID: <20140415170750.7721e907@xhacker>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
	<1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397549245-3338-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>
Cc: "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Antoine,

On Tue, 15 Apr 2014 01:07:24 -0700
Antoine T=C3=A9nart <antoine.tenart@free-electrons.com> wrote:

> The BG2Q has GPIOs driven by the dwapb GPIO driver. Add the LIBGPIO a=
s a
> dependency to be able to support them.
>=20
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>
> ---
>  arch/arm/mach-berlin/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kcon=
fig
> index 291f1cac6c3d..c31968712095 100644
> --- a/arch/arm/mach-berlin/Kconfig
> +++ b/arch/arm/mach-berlin/Kconfig
> @@ -28,6 +28,7 @@ config MACH_BERLIN_BG2Q
>  	select CPU_V7
>  	select HAVE_ARM_TWD if SMP
>  	select HAVE_SMP
> +	select ARCH_REQUIRE_GPIOLIB

alphabetically sort.

Others looks good ;)

Thanks,
Jisheng
