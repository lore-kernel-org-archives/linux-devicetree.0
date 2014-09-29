From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 3/6] arm64: dts/Makefile: Add support for Spreadtrum's
 Shark64 SoC.
Date: Mon, 29 Sep 2014 16:46:45 +0200
Message-ID: <542970D5.7010507@suse.de>
References: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com> <1411991314-6636-4-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411991314-6636-4-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zhang.lyra@gmail.com
Cc: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 29.09.2014 um 13:48 schrieb zhang.lyra@gmail.com:
> From: "zhizhou.zhang" <zhizhou.zhang@spreadtrum.com>
>=20
> Adds build support for Spreadtrum's Shark64 SoC in arm64 dts Makefile=
=2E
>=20
> Signed-off-by: zhizhou.zhang <zhizhou.zhang@spreadtrum.com>
> Signed-off-by: chunyan.zhang <chunyan.zhang@spreadtrum.com>
> ---
>  arch/arm64/boot/dts/Makefile |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makef=
ile
> index c52bdb0..7fdb9df 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_VEXPRESS) +=3D rtsm_ve-aemv8a.dtb foundation-v8.dt=
b
>  dtb-$(CONFIG_ARCH_XGENE) +=3D apm-mustang.dtb
> +dtb-$(CONFIG_ARCH_SHARK64) +=3D sprd_shark64.dtb
> =20
>  targets +=3D dtbs
>  targets +=3D $(dtb-y)

This patch seems so trivial that you could just squash it into 2/6
(adding the .dts file).

Also, it looks to me as if the ordering is alphabetical, so SHARK shoul=
d
probably go somewhere before VEXPRESS, not after XGENE.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
