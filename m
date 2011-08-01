From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] arm/mx5: add device tree support for imx53 boards
Date: Mon, 1 Aug 2011 23:01:39 +0100
Message-ID: <CACxGe6vvL=xGCGMR0yhyJ8r2zLvBgYhYS1b9_VF3dg5hRNhNzQ@mail.gmail.com>
References: <1312226252-8566-1-git-send-email-shawn.guo@linaro.org>
	<1312226252-8566-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312226252-8566-2-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 1, 2011 at 8:17 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> It adds device tree support for imx53 boards.
>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

It's *really* close, but I see a problem...

> +static const char *imx53_dt_board_compat[] __initdata =3D {
> + =A0 =A0 =A0 "fsl,imx53-ard",
> + =A0 =A0 =A0 "fsl,imx53-evk",
> + =A0 =A0 =A0 "fsl,imx53-qsb",
> + =A0 =A0 =A0 "fsl,imx53-smd",
> + =A0 =A0 =A0 NULL
> +};
> +
> +DT_MACHINE_START(IMX53_DT, "Freescale i.MX53 (Device Tree Support)")
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D mx53_map_io,
> + =A0 =A0 =A0 .init_early =A0 =A0 =3D imx53_init_early,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D mx53_init_irq,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &imx53_timer,
> + =A0 =A0 =A0 .init_machine =A0 =3D imx53_dt_init,
> + =A0 =A0 =A0 .dt_compat =A0 =A0 =A0=3D imx53_dt_board_compat,
> +MACHINE_END
> +
> +DT_MACHINE_START(IMX53_DT_ARD, "Freescale i.MX53 ARD (Device Tree Suppor=
t)")
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D mx53_map_io,
> + =A0 =A0 =A0 .init_early =A0 =A0 =3D imx53_init_early,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D mx53_init_irq,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &imx53_timer,
> + =A0 =A0 =A0 .init_machine =A0 =3D imx53_ard_init,
> + =A0 =A0 =A0 .dt_compat =A0 =A0 =A0=3D imx53_dt_board_compat,
> +MACHINE_END

These two machine_descs will match on exactly the same boards because
they use the same dt_compat table.  So the ard variant will probably
never get matched since it will be picked up by the IMX53_DT variant
first.  Each machine_desc must have a different match table.

However, today when we were talking you asked if it would be better to
use a callback into board-specific code instead of the iomux table
that is implemented in this patch.  I was fine either way, but my
opinion was that the table would probably result in less code.  Well,
combined with the above problem, I think I was wrong.  Since the only
difference in the ard variant is the call to
imx53_ard_weim_cs_config(), both the cs config and the iomux setup
will be simpler if both are handled in a callback.  You're original
instinct was correct.

g.

> diff --git a/arch/arm/plat-mxc/include/mach/common.h b/arch/arm/plat-mxc/=
include/mach/common.h
> index 4e3d978..32c24a4 100644
> --- a/arch/arm/plat-mxc/include/mach/common.h
> +++ b/arch/arm/plat-mxc/include/mach/common.h
> @@ -72,4 +72,6 @@ extern void mxc_arch_reset_init(void __iomem *);
> =A0extern void mx51_efikamx_reset(void);
> =A0extern int mx53_revision(void);
> =A0extern int mx53_display_revision(void);
> +extern int imx53_ard_weim_cs_config(void);
> +
> =A0#endif
> diff --git a/arch/arm/plat-mxc/include/mach/iomux-mx53.h b/arch/arm/plat-=
mxc/include/mach/iomux-mx53.h
> index 9440b9e..adcf2c0 100644
> --- a/arch/arm/plat-mxc/include/mach/iomux-mx53.h
> +++ b/arch/arm/plat-mxc/include/mach/iomux-mx53.h
> @@ -21,6 +21,11 @@
>
> =A0#include <mach/iomux-v3.h>
>
> +extern struct iomux_v3_pad_data imx53_ard_pad_data;
> +extern struct iomux_v3_pad_data imx53_evk_pad_data;
> +extern struct iomux_v3_pad_data imx53_loco_pad_data;
> +extern struct iomux_v3_pad_data imx53_smd_pad_data;
> +
> =A0/* These 2 defines are for pins that may not have a mux register, but =
could
> =A0* have a pad setting register, and vice-versa. */
> =A0#define NON_PAD_I =A0 =A0 =A00x00
> diff --git a/arch/arm/plat-mxc/include/mach/iomux-v3.h b/arch/arm/plat-mx=
c/include/mach/iomux-v3.h
> index ebbce33..5689965 100644
> --- a/arch/arm/plat-mxc/include/mach/iomux-v3.h
> +++ b/arch/arm/plat-mxc/include/mach/iomux-v3.h
> @@ -55,6 +55,11 @@
>
> =A0typedef u64 iomux_v3_cfg_t;
>
> +struct iomux_v3_pad_data {
> + =A0 =A0 =A0 iomux_v3_cfg_t *pads;
> + =A0 =A0 =A0 int num;
> +};
> +
> =A0#define MUX_CTRL_OFS_SHIFT =A0 =A0 0
> =A0#define MUX_CTRL_OFS_MASK =A0 =A0 =A0((iomux_v3_cfg_t)0xfff << MUX_CTR=
L_OFS_SHIFT)
> =A0#define MUX_PAD_CTRL_OFS_SHIFT 12
> --
> 1.7.4.1
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
