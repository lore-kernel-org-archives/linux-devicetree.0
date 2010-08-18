From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 02/14] ARM: vexpress: fix clocks definition to comply
	with new framework
Date: Wed, 18 Aug 2010 13:25:27 -0600
Message-ID: <AANLkTimbjoX7JxQTgbhKUUHAtNV0bTY+NyJytOgeKcW4@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-3-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> The new clock infrastructure introduced within the DT series of patches
> slightly changed how clocks are declared and initialized. Some clock
> definitions become platform specific.
>
> This patch fixes some typos on ARM Versatile Express clock definition
> and initialization that caused compile time errors.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

I'll pick this one up and squash it into Jeremy's original versatile patch.

> ---
> =A0arch/arm/mach-vexpress/include/mach/clkdev.h | =A0 =A02 +-
> =A0arch/arm/mach-vexpress/v2m.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 13 =
++++++++++++-
> =A02 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-vexpress/include/mach/clkdev.h b/arch/arm/mach=
-vexpress/include/mach/clkdev.h
> index ad3f6e7..9e23cac 100644
> --- a/arch/arm/mach-vexpress/include/mach/clkdev.h
> +++ b/arch/arm/mach-vexpress/include/mach/clkdev.h
> @@ -9,7 +9,7 @@ struct clk_v2m {
> =A0 =A0 =A0 =A0u32 =A0 =A0 =A0 =A0 =A0 =A0 config;
> =A0};
>
> -const struct clk_ops clk_v2m_ops;
> +extern const struct clk_ops clk_v2m_ops;
>
> =A0#define INIT_CLK_V2M(r,c) { .clk =3D INIT_CLK(clk_v2m_ops), \
> =A0 =A0 =A0 =A0.rate =3D r, .config =3D c }
> diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> index f22e272..06d6914 100644
> --- a/arch/arm/mach-vexpress/v2m.c
> +++ b/arch/arm/mach-vexpress/v2m.c
> @@ -285,12 +285,21 @@ static int clk_v2m_set_rate(struct clk *_clk, unsig=
ned long rate)
> =A0 =A0 =A0 =A0struct clk_v2m *clk =3D to_clk_v2m(_clk);
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 ret =3D v2m_cfg_write(clk->cofig, rate);
> + =A0 =A0 =A0 ret =3D v2m_cfg_write(clk->config, rate);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->rate =3D rate;
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> +static void clk_v2m_put(struct clk *_clk)
> +{
> +}
> +
> +static int clk_v2m_get(struct clk *_clk)
> +{
> + =A0 =A0 =A0 return 1;
> +}
> +
> =A0static unsigned long clk_v2m_get_rate(struct clk *clk)
> =A0{
> =A0 =A0 =A0 =A0return to_clk_v2m(clk)->rate;
> @@ -300,6 +309,8 @@ const struct clk_ops clk_v2m_ops =3D {
> =A0 =A0 =A0 =A0.round_rate =3D clk_v2m_round_rate,
> =A0 =A0 =A0 =A0.get_rate =3D clk_v2m_get_rate,
> =A0 =A0 =A0 =A0.set_rate =3D clk_v2m_set_rate,
> + =A0 =A0 =A0 .get =3D clk_v2m_get,
> + =A0 =A0 =A0 .put =3D clk_v2m_put,
> =A0};
>
> =A0static struct clk_v2m osc1_clk =3D
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
