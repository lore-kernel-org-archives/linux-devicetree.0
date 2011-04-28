From: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
Subject: Re: [PATCH 6/6] Add CONFIG_OF_LIBFDT to more boards.
Date: Thu, 28 Apr 2011 14:51:44 +0200
Message-ID: <4DB962E0.3000209__15691.0237427384$1304001743$gmane$org@aribaud.net>
References: <20110328195231.10235.36716.stgit@ponder>
	<20110328195906.10235.68517.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110328195906.10235.68517.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <public-grant.likely-s3s/WqlpOiPyB63q8FvJNQ-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>
Cc: public-vanbaren-He//nVnquyzQT0dZR+AlfA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, public-wd-ynQEQJNshbs-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, public-linaro-kernel-cunTk1MwBs8s++Sfvej+rw-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, public-u-boot-0aAXYlwwYIKGBzrmiIFOJg-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, John Rigby <public-john.rigby-QSEj5FYQhm4dnm+yROfE0A-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, public-devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ-wOFGN7rlS/M9smdsby/KFg@public.gmane.org, public-patches-QSEj5FYQhm4dnm+yROfE0A-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: devicetree@vger.kernel.org




Hi Grant,

Le 28/03/2011 21:59, Grant Likely a =E9crit :
> From: Grant Likely<grant.likely-QSEj5FYQhm4dnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>
> The following boards gain device tree support with this patch:
>
> ca9x4_ct_vxp - Versatile Express
>
> i.mx5 boards:
> efikamx
> mx51evk
> mx53evk
>
> OMAP boards:
> devkit8000
> igep0020
> igep0030
> omap3_overo
> omap3_pandora
> omap4_sdp3430
> omap3_zoom1
> omap3_zoom2
> omap4_panda
> omap4_sdp4430
>
> Tegra boards:
> Harmony
>
> Signed-off-by: Grant Likely<grant.likely-QSEj5FYQhm4dnm+yROfE0A-XMD5yJDbdMQAvxtiuMwx3w@public.gmane.org=
ane.org>
> ---
>   include/configs/ca9x4_ct_vxp.h  |    2 ++
>   include/configs/devkit8000.h    |    2 ++
>   include/configs/efikamx.h       |    2 ++
>   include/configs/igep0020.h      |    2 ++
>   include/configs/igep0030.h      |    2 ++
>   include/configs/mx51evk.h       |    2 ++
>   include/configs/mx53evk.h       |    2 ++
>   include/configs/omap3_overo.h   |    2 ++
>   include/configs/omap3_pandora.h |    2 ++
>   include/configs/omap3_sdp3430.h |    2 ++
>   include/configs/omap3_zoom1.h   |    2 ++
>   include/configs/omap3_zoom2.h   |    2 ++
>   include/configs/omap4_panda.h   |    2 ++
>   include/configs/omap4_sdp4430.h |    2 ++
>   include/configs/tegra2-common.h |    1 +
>   15 files changed, 29 insertions(+), 0 deletions(-)

Applied to u-boot-arm/master, thanks.

Amicalement,
-- =

Albert.
