From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] gpio/mxc: get rid of the uses of cpu_is_mx()
Date: Tue, 5 Jul 2011 11:44:47 -0600
Message-ID: <CACxGe6tA8E5jC+dW0oXvZE4TCq7V7Z-SCLo7YS5q34L2cYaAEw@mail.gmail.com>
References: <1309879166-25788-1-git-send-email-shawn.guo@linaro.org>
	<1309879166-25788-3-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1309879166-25788-3-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 5, 2011 at 9:19 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> The patch removes all the uses of cpu_is_mx(). =A0Instead, it utilizes
> platform_device_id to distinguish the gpio differences among SoCs.
>
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Don't forget to cc linux-kernel on GPIO patches.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
> =A0arch/arm/mach-imx/mm-imx1.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A08 +-
> =A0arch/arm/mach-imx/mm-imx21.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
12 +-
> =A0arch/arm/mach-imx/mm-imx25.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A08 +-
> =A0arch/arm/mach-imx/mm-imx27.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
12 +-
> =A0arch/arm/mach-imx/mm-imx31.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A06 +-
> =A0arch/arm/mach-imx/mm-imx35.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A06 +-
> =A0arch/arm/mach-mx5/mm-mx50.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
12 +-
> =A0arch/arm/mach-mx5/mm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 22 ++--
> =A0arch/arm/plat-mxc/devices/platform-gpio-mxc.c | =A0 =A04 +-
> =A0arch/arm/plat-mxc/include/mach/common.h =A0 =A0 =A0 | =A0 =A02 +-
> =A0drivers/gpio/gpio-mxc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0131 +++++++++++++++++++++----
> =A011 files changed, 159 insertions(+), 64 deletions(-)
>
> diff --git a/arch/arm/mach-imx/mm-imx1.c b/arch/arm/mach-imx/mm-imx1.c
> index f2a6566..2bded59 100644
> --- a/arch/arm/mach-imx/mm-imx1.c
> +++ b/arch/arm/mach-imx/mm-imx1.c
> @@ -50,12 +50,12 @@ void __init mx1_init_irq(void)
>
> =A0void __init imx1_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX1_GPIO1_BASE_ADDR, SZ_256,
> + =A0 =A0 =A0 mxc_register_gpio("imx1-gpio", 0, MX1_GPIO1_BASE_ADDR, SZ_2=
56,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0MX1_GPIO_INT_PORTA, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX1_GPIO2_BASE_ADDR, SZ_256,
> + =A0 =A0 =A0 mxc_register_gpio("imx1-gpio", 1, MX1_GPIO2_BASE_ADDR, SZ_2=
56,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0MX1_GPIO_INT_PORTB, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX1_GPIO3_BASE_ADDR, SZ_256,
> + =A0 =A0 =A0 mxc_register_gpio("imx1-gpio", 2, MX1_GPIO3_BASE_ADDR, SZ_2=
56,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0MX1_GPIO_INT_PORTC, 0);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX1_GPIO4_BASE_ADDR, SZ_256,
> + =A0 =A0 =A0 mxc_register_gpio("imx1-gpio", 3, MX1_GPIO4_BASE_ADDR, SZ_2=
56,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0MX1_GPIO_INT_PORTD, 0);
> =A0}
> diff --git a/arch/arm/mach-imx/mm-imx21.c b/arch/arm/mach-imx/mm-imx21.c
> index 4f32a8a..d02e20d 100644
> --- a/arch/arm/mach-imx/mm-imx21.c
> +++ b/arch/arm/mach-imx/mm-imx21.c
> @@ -77,12 +77,12 @@ void __init mx21_init_irq(void)
>
> =A0void __init imx21_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX21_GPIO1_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX21_GPIO2_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX21_GPIO3_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX21_GPIO4_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(4, MX21_GPIO5_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(5, MX21_GPIO6_BASE_ADDR, SZ_256, MX21_INT=
_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 0, MX21_GPIO1_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 1, MX21_GPIO2_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 2, MX21_GPIO3_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 3, MX21_GPIO4_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 4, MX21_GPIO5_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 5, MX21_GPIO6_BASE_ADDR, SZ_=
256, MX21_INT_GPIO, 0);
>
> =A0 =A0 =A0 =A0imx_add_imx_dma();
> =A0}
> diff --git a/arch/arm/mach-imx/mm-imx25.c b/arch/arm/mach-imx/mm-imx25.c
> index 1e0c956..65099e6 100644
> --- a/arch/arm/mach-imx/mm-imx25.c
> +++ b/arch/arm/mach-imx/mm-imx25.c
> @@ -86,10 +86,10 @@ static struct sdma_platform_data imx25_sdma_pdata __i=
nitdata =3D {
>
> =A0void __init imx25_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX25_GPIO1_BASE_ADDR, SZ_16K, MX25_INT=
_GPIO1, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX25_GPIO2_BASE_ADDR, SZ_16K, MX25_INT=
_GPIO2, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX25_GPIO3_BASE_ADDR, SZ_16K, MX25_INT=
_GPIO3, 0);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX25_GPIO4_BASE_ADDR, SZ_16K, MX25_INT=
_GPIO4, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx25-gpio", 0, MX25_GPIO1_BASE_ADDR, SZ=
_16K, MX25_INT_GPIO1, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx25-gpio", 1, MX25_GPIO2_BASE_ADDR, SZ=
_16K, MX25_INT_GPIO2, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx25-gpio", 2, MX25_GPIO3_BASE_ADDR, SZ=
_16K, MX25_INT_GPIO3, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx25-gpio", 3, MX25_GPIO4_BASE_ADDR, SZ=
_16K, MX25_INT_GPIO4, 0);
>
> =A0 =A0 =A0 =A0imx_add_imx_sdma(MX25_SDMA_BASE_ADDR, MX25_INT_SDMA, &imx2=
5_sdma_pdata);
> =A0}
> diff --git a/arch/arm/mach-imx/mm-imx27.c b/arch/arm/mach-imx/mm-imx27.c
> index 944e02d..5a62969 100644
> --- a/arch/arm/mach-imx/mm-imx27.c
> +++ b/arch/arm/mach-imx/mm-imx27.c
> @@ -77,12 +77,12 @@ void __init mx27_init_irq(void)
>
> =A0void __init imx27_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX27_GPIO1_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX27_GPIO2_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX27_GPIO3_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX27_GPIO4_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(4, MX27_GPIO5_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> - =A0 =A0 =A0 mxc_register_gpio(5, MX27_GPIO6_BASE_ADDR, SZ_256, MX27_INT=
_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 0, MX27_GPIO1_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 1, MX27_GPIO2_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 2, MX27_GPIO3_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 3, MX27_GPIO4_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 4, MX27_GPIO5_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx2-gpio", 5, MX27_GPIO6_BASE_ADDR, SZ_=
256, MX27_INT_GPIO, 0);
>
> =A0 =A0 =A0 =A0imx_add_imx_dma();
> =A0}
> diff --git a/arch/arm/mach-imx/mm-imx31.c b/arch/arm/mach-imx/mm-imx31.c
> index a1ff96f..7017c4a 100644
> --- a/arch/arm/mach-imx/mm-imx31.c
> +++ b/arch/arm/mach-imx/mm-imx31.c
> @@ -78,9 +78,9 @@ void __init imx31_soc_init(void)
> =A0{
> =A0 =A0 =A0 =A0int to_version =3D mx31_revision() >> 4;
>
> - =A0 =A0 =A0 mxc_register_gpio(0, MX31_GPIO1_BASE_ADDR, SZ_16K, MX31_INT=
_GPIO1, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX31_GPIO2_BASE_ADDR, SZ_16K, MX31_INT=
_GPIO2, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX31_GPIO3_BASE_ADDR, SZ_16K, MX31_INT=
_GPIO3, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 0, MX31_GPIO1_BASE_ADDR, SZ_1=
6K, MX31_INT_GPIO1, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 1, MX31_GPIO2_BASE_ADDR, SZ_1=
6K, MX31_INT_GPIO2, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 2, MX31_GPIO3_BASE_ADDR, SZ_1=
6K, MX31_INT_GPIO3, 0);
>
> =A0 =A0 =A0 =A0if (to_version =3D=3D 1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strncpy(imx31_sdma_pdata.fw_name, "sdma-im=
x31-to1.bin",
> diff --git a/arch/arm/mach-imx/mm-imx35.c b/arch/arm/mach-imx/mm-imx35.c
> index da530ca..568a5c6 100644
> --- a/arch/arm/mach-imx/mm-imx35.c
> +++ b/arch/arm/mach-imx/mm-imx35.c
> @@ -95,9 +95,9 @@ void __init imx35_soc_init(void)
> =A0{
> =A0 =A0 =A0 =A0int to_version =3D mx35_revision() >> 4;
>
> - =A0 =A0 =A0 mxc_register_gpio(0, MX35_GPIO1_BASE_ADDR, SZ_16K, MX35_INT=
_GPIO1, 0);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX35_GPIO2_BASE_ADDR, SZ_16K, MX35_INT=
_GPIO2, 0);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX35_GPIO3_BASE_ADDR, SZ_16K, MX35_INT=
_GPIO3, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 0, MX35_GPIO1_BASE_ADDR, SZ_1=
6K, MX35_INT_GPIO1, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 1, MX35_GPIO2_BASE_ADDR, SZ_1=
6K, MX35_INT_GPIO2, 0);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 2, MX35_GPIO3_BASE_ADDR, SZ_1=
6K, MX35_INT_GPIO3, 0);
>
> =A0 =A0 =A0 =A0if (to_version =3D=3D 1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strncpy(imx35_sdma_pdata.fw_name, "sdma-im=
x35-to1.bin",
> diff --git a/arch/arm/mach-mx5/mm-mx50.c b/arch/arm/mach-mx5/mm-mx50.c
> index 28c3f60..39e4a17 100644
> --- a/arch/arm/mach-mx5/mm-mx50.c
> +++ b/arch/arm/mach-mx5/mm-mx50.c
> @@ -62,10 +62,10 @@ void __init mx50_init_irq(void)
>
> =A0void __init imx50_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX50_GPIO1_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO1_LOW, MX50_INT_GPIO1_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX50_GPIO2_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO2_LOW, MX50_INT_GPIO2_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX50_GPIO3_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO3_LOW, MX50_INT_GPIO3_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX50_GPIO4_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO4_LOW, MX50_INT_GPIO4_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(4, MX50_GPIO5_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO5_LOW, MX50_INT_GPIO5_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(5, MX50_GPIO6_BASE_ADDR, SZ_16K, MX50_INT=
_GPIO6_LOW, MX50_INT_GPIO6_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 0, MX50_GPIO1_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO1_LOW, MX50_INT_GPIO1_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 1, MX50_GPIO2_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO2_LOW, MX50_INT_GPIO2_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 2, MX50_GPIO3_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO3_LOW, MX50_INT_GPIO3_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 3, MX50_GPIO4_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO4_LOW, MX50_INT_GPIO4_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 4, MX50_GPIO5_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO5_LOW, MX50_INT_GPIO5_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 5, MX50_GPIO6_BASE_ADDR, SZ_1=
6K, MX50_INT_GPIO6_LOW, MX50_INT_GPIO6_HIGH);
> =A0}
> diff --git a/arch/arm/mach-mx5/mm.c b/arch/arm/mach-mx5/mm.c
> index 1b7059f..1444140 100644
> --- a/arch/arm/mach-mx5/mm.c
> +++ b/arch/arm/mach-mx5/mm.c
> @@ -142,23 +142,23 @@ static struct sdma_platform_data imx53_sdma_pdata _=
_initdata =3D {
>
> =A0void __init imx51_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX51_GPIO1_BASE_ADDR, SZ_16K, MX51_MXC=
_INT_GPIO1_LOW, MX51_MXC_INT_GPIO1_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX51_GPIO2_BASE_ADDR, SZ_16K, MX51_MXC=
_INT_GPIO2_LOW, MX51_MXC_INT_GPIO2_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX51_GPIO3_BASE_ADDR, SZ_16K, MX51_MXC=
_INT_GPIO3_LOW, MX51_MXC_INT_GPIO3_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX51_GPIO4_BASE_ADDR, SZ_16K, MX51_MXC=
_INT_GPIO4_LOW, MX51_MXC_INT_GPIO4_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 0, MX51_GPIO1_BASE_ADDR, SZ_1=
6K, MX51_MXC_INT_GPIO1_LOW, MX51_MXC_INT_GPIO1_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 1, MX51_GPIO2_BASE_ADDR, SZ_1=
6K, MX51_MXC_INT_GPIO2_LOW, MX51_MXC_INT_GPIO2_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 2, MX51_GPIO3_BASE_ADDR, SZ_1=
6K, MX51_MXC_INT_GPIO3_LOW, MX51_MXC_INT_GPIO3_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 3, MX51_GPIO4_BASE_ADDR, SZ_1=
6K, MX51_MXC_INT_GPIO4_LOW, MX51_MXC_INT_GPIO4_HIGH);
>
> =A0 =A0 =A0 =A0imx_add_imx_sdma(MX51_SDMA_BASE_ADDR, MX51_INT_SDMA, &imx5=
1_sdma_pdata);
> =A0}
>
> =A0void __init imx53_soc_init(void)
> =A0{
> - =A0 =A0 =A0 mxc_register_gpio(0, MX53_GPIO1_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO1_LOW, MX53_INT_GPIO1_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(1, MX53_GPIO2_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO2_LOW, MX53_INT_GPIO2_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(2, MX53_GPIO3_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO3_LOW, MX53_INT_GPIO3_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(3, MX53_GPIO4_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO4_LOW, MX53_INT_GPIO4_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(4, MX53_GPIO5_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO5_LOW, MX53_INT_GPIO5_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(5, MX53_GPIO6_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO6_LOW, MX53_INT_GPIO6_HIGH);
> - =A0 =A0 =A0 mxc_register_gpio(6, MX53_GPIO7_BASE_ADDR, SZ_16K, MX53_INT=
_GPIO7_LOW, MX53_INT_GPIO7_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 0, MX53_GPIO1_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO1_LOW, MX53_INT_GPIO1_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 1, MX53_GPIO2_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO2_LOW, MX53_INT_GPIO2_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 2, MX53_GPIO3_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO3_LOW, MX53_INT_GPIO3_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 3, MX53_GPIO4_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO4_LOW, MX53_INT_GPIO4_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 4, MX53_GPIO5_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO5_LOW, MX53_INT_GPIO5_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 5, MX53_GPIO6_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO6_LOW, MX53_INT_GPIO6_HIGH);
> + =A0 =A0 =A0 mxc_register_gpio("imx-gpio", 6, MX53_GPIO7_BASE_ADDR, SZ_1=
6K, MX53_INT_GPIO7_LOW, MX53_INT_GPIO7_HIGH);
>
> =A0 =A0 =A0 =A0imx_add_imx_sdma(MX53_SDMA_BASE_ADDR, MX53_INT_SDMA, &imx5=
3_sdma_pdata);
> =A0}
> diff --git a/arch/arm/plat-mxc/devices/platform-gpio-mxc.c b/arch/arm/pla=
t-mxc/devices/platform-gpio-mxc.c
> index cf1b7fd..a7919a2 100644
> --- a/arch/arm/plat-mxc/devices/platform-gpio-mxc.c
> +++ b/arch/arm/plat-mxc/devices/platform-gpio-mxc.c
> @@ -8,7 +8,7 @@
> =A0*/
> =A0#include <mach/devices-common.h>
>
> -struct platform_device *__init mxc_register_gpio(int id,
> +struct platform_device *__init mxc_register_gpio(char *name, int id,
> =A0 =A0 =A0 =A0resource_size_t iobase, resource_size_t iosize, int irq, i=
nt irq_high)
> =A0{
> =A0 =A0 =A0 =A0struct resource res[] =3D {
> @@ -28,5 +28,5 @@ struct platform_device *__init mxc_register_gpio(int id,
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0return platform_device_register_resndata(&mxc_aips_bus,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "gpio-mxc", id, res, ARRAY_=
SIZE(res), NULL, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 name, id, res, ARRAY_SIZE(r=
es), NULL, 0);
> =A0}
> diff --git a/arch/arm/plat-mxc/include/mach/common.h b/arch/arm/plat-mxc/=
include/mach/common.h
> index 91fa263..4e3d978 100644
> --- a/arch/arm/plat-mxc/include/mach/common.h
> +++ b/arch/arm/plat-mxc/include/mach/common.h
> @@ -64,7 +64,7 @@ extern int mx51_clocks_init(unsigned long ckil, unsigne=
d long osc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long ckih1, unsig=
ned long ckih2);
> =A0extern int mx53_clocks_init(unsigned long ckil, unsigned long osc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long ckih1, unsig=
ned long ckih2);
> -extern struct platform_device *mxc_register_gpio(int id,
> +extern struct platform_device *mxc_register_gpio(char *name, int id,
> =A0 =A0 =A0 =A0resource_size_t iobase, resource_size_t iosize, int irq, i=
nt irq_high);
> =A0extern int mxc_register_device(struct platform_device *pdev, void *dat=
a);
> =A0extern void mxc_set_cpu_type(unsigned int type);
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 8241680..4875690 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -27,9 +27,29 @@
> =A0#include <linux/platform_device.h>
> =A0#include <linux/slab.h>
> =A0#include <linux/basic_mmio_gpio.h>
> -#include <mach/hardware.h>
> =A0#include <asm-generic/bug.h>
>
> +enum mxc_gpio_hwtype {
> + =A0 =A0 =A0 IMX1_GPIO =3D 1,
> + =A0 =A0 =A0 IMX2_GPIO,
> + =A0 =A0 =A0 IMX_GPIO,
> +};
> +
> +/* device type dependent stuff */
> +struct mxc_gpio_hwdata {
> + =A0 =A0 =A0 unsigned dr_reg;
> + =A0 =A0 =A0 unsigned gdir_reg;
> + =A0 =A0 =A0 unsigned psr_reg;
> + =A0 =A0 =A0 unsigned icr1_reg;
> + =A0 =A0 =A0 unsigned icr2_reg;
> + =A0 =A0 =A0 unsigned imr_reg;
> + =A0 =A0 =A0 unsigned isr_reg;
> + =A0 =A0 =A0 unsigned low_level;
> + =A0 =A0 =A0 unsigned high_level;
> + =A0 =A0 =A0 unsigned rise_edge;
> + =A0 =A0 =A0 unsigned fall_edge;
> +};
> +
> =A0struct mxc_gpio_port {
> =A0 =A0 =A0 =A0struct list_head node;
> =A0 =A0 =A0 =A0void __iomem *base;
> @@ -40,6 +60,72 @@ struct mxc_gpio_port {
> =A0 =A0 =A0 =A0u32 both_edges;
> =A0};
>
> +static struct mxc_gpio_hwdata imx1_imx2_gpio_hwdata =3D {
> + =A0 =A0 =A0 .dr_reg =A0 =A0 =A0 =A0 =3D 0x1c,
> + =A0 =A0 =A0 .gdir_reg =A0 =A0 =A0 =3D 0x00,
> + =A0 =A0 =A0 .psr_reg =A0 =A0 =A0 =A0=3D 0x24,
> + =A0 =A0 =A0 .icr1_reg =A0 =A0 =A0 =3D 0x28,
> + =A0 =A0 =A0 .icr2_reg =A0 =A0 =A0 =3D 0x2c,
> + =A0 =A0 =A0 .imr_reg =A0 =A0 =A0 =A0=3D 0x30,
> + =A0 =A0 =A0 .isr_reg =A0 =A0 =A0 =A0=3D 0x34,
> + =A0 =A0 =A0 .low_level =A0 =A0 =A0=3D 0x03,
> + =A0 =A0 =A0 .high_level =A0 =A0 =3D 0x02,
> + =A0 =A0 =A0 .rise_edge =A0 =A0 =A0=3D 0x00,
> + =A0 =A0 =A0 .fall_edge =A0 =A0 =A0=3D 0x01,
> +};
> +
> +static struct mxc_gpio_hwdata imx_gpio_hwdata =3D {
> + =A0 =A0 =A0 .dr_reg =A0 =A0 =A0 =A0 =3D 0x00,
> + =A0 =A0 =A0 .gdir_reg =A0 =A0 =A0 =3D 0x04,
> + =A0 =A0 =A0 .psr_reg =A0 =A0 =A0 =A0=3D 0x08,
> + =A0 =A0 =A0 .icr1_reg =A0 =A0 =A0 =3D 0x0c,
> + =A0 =A0 =A0 .icr2_reg =A0 =A0 =A0 =3D 0x10,
> + =A0 =A0 =A0 .imr_reg =A0 =A0 =A0 =A0=3D 0x14,
> + =A0 =A0 =A0 .isr_reg =A0 =A0 =A0 =A0=3D 0x18,
> + =A0 =A0 =A0 .low_level =A0 =A0 =A0=3D 0x00,
> + =A0 =A0 =A0 .high_level =A0 =A0 =3D 0x01,
> + =A0 =A0 =A0 .rise_edge =A0 =A0 =A0=3D 0x02,
> + =A0 =A0 =A0 .fall_edge =A0 =A0 =A0=3D 0x03,
> +};
> +
> +static enum mxc_gpio_hwtype mxc_gpio_hwtype;
> +static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
> +
> +#define GPIO_DR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(mxc_gpio=
_hwdata->dr_reg)
> +#define GPIO_GDIR =A0 =A0 =A0 =A0 =A0 =A0 =A0(mxc_gpio_hwdata->gdir_reg)
> +#define GPIO_PSR =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mxc_gpio_hwdata->psr_reg)
> +#define GPIO_ICR1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(mxc_gpio_hwdata->icr1_reg)
> +#define GPIO_ICR2 =A0 =A0 =A0 =A0 =A0 =A0 =A0(mxc_gpio_hwdata->icr2_reg)
> +#define GPIO_IMR =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mxc_gpio_hwdata->imr_reg)
> +#define GPIO_ISR =A0 =A0 =A0 =A0 =A0 =A0 =A0 (mxc_gpio_hwdata->isr_reg)
> +
> +#define GPIO_INT_LOW_LEV =A0 =A0 =A0 (mxc_gpio_hwdata->low_level)
> +#define GPIO_INT_HIGH_LEV =A0 =A0 =A0(mxc_gpio_hwdata->high_level)
> +#define GPIO_INT_RISE_EDGE =A0 =A0 (mxc_gpio_hwdata->rise_edge)
> +#define GPIO_INT_FALL_EDGE =A0 =A0 (mxc_gpio_hwdata->fall_edge)
> +#define GPIO_INT_NONE =A0 =A0 =A0 =A0 =A00x4
> +
> +static struct platform_device_id mxc_gpio_devtype[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx1-gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX1_GPIO,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx21-gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX2_GPIO,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx25-gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX_GPIO,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx27-gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX2_GPIO,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D "imx-gpio",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .driver_data =3D IMX_GPIO,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* sentinel */
> + =A0 =A0 =A0 }
> +};
> +
> =A0/*
> =A0* MX2 has one interrupt *for all* gpio ports. The list is used
> =A0* to save the references to all ports, so that mx2_gpio_irq_handler
> @@ -47,22 +133,6 @@ struct mxc_gpio_port {
> =A0*/
> =A0static LIST_HEAD(mxc_gpio_ports);
>
> -#define cpu_is_mx1_mx2() =A0 =A0 =A0 (cpu_is_mx1() || cpu_is_mx2())
> -
> -#define GPIO_DR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(cpu_is_mx1_mx2() ? 0x1c =
: 0x00)
> -#define GPIO_GDIR =A0 =A0 =A0(cpu_is_mx1_mx2() ? 0x00 : 0x04)
> -#define GPIO_PSR =A0 =A0 =A0 (cpu_is_mx1_mx2() ? 0x24 : 0x08)
> -#define GPIO_ICR1 =A0 =A0 =A0(cpu_is_mx1_mx2() ? 0x28 : 0x0C)
> -#define GPIO_ICR2 =A0 =A0 =A0(cpu_is_mx1_mx2() ? 0x2C : 0x10)
> -#define GPIO_IMR =A0 =A0 =A0 (cpu_is_mx1_mx2() ? 0x30 : 0x14)
> -#define GPIO_ISR =A0 =A0 =A0 (cpu_is_mx1_mx2() ? 0x34 : 0x18)
> -
> -#define GPIO_INT_LOW_LEV =A0 =A0 =A0 (cpu_is_mx1_mx2() ? 0x3 : 0x0)
> -#define GPIO_INT_HIGH_LEV =A0 =A0 =A0(cpu_is_mx1_mx2() ? 0x2 : 0x1)
> -#define GPIO_INT_RISE_EDGE =A0 =A0 (cpu_is_mx1_mx2() ? 0x0 : 0x2)
> -#define GPIO_INT_FALL_EDGE =A0 =A0 (cpu_is_mx1_mx2() ? 0x1 : 0x3)
> -#define GPIO_INT_NONE =A0 =A0 =A0 =A0 =A00x4
> -
> =A0/* Note: This driver assumes 32 GPIOs are handled in one register */
>
> =A0static int gpio_set_irq_type(struct irq_data *d, u32 type)
> @@ -236,6 +306,28 @@ static void __init mxc_gpio_init_gc(struct mxc_gpio_=
port *port)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_NOREQUEST=
, 0);
> =A0}
>
> +static void __devinit mxc_gpio_get_hw(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 enum mxc_gpio_hwtype hwtype =3D pdev->id_entry->driver_data;
> +
> + =A0 =A0 =A0 if (mxc_gpio_hwtype) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* The driver works with a reasonable pre=
supposition,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* that is all gpio ports must be the sam=
e type when
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* running on one soc.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(mxc_gpio_hwtype !=3D hwtype);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (hwtype =3D=3D IMX1_GPIO || hwtype =3D=3D IMX2_GPIO)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mxc_gpio_hwdata =3D &imx1_imx2_gpio_hwdata;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mxc_gpio_hwdata =3D &imx_gpio_hwdata;
> +
> + =A0 =A0 =A0 mxc_gpio_hwtype =3D hwtype;
> +}
> +
> =A0static int __devinit mxc_gpio_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct mxc_gpio_port *port;
> @@ -243,6 +335,8 @@ static int __devinit mxc_gpio_probe(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0static int once =3D 0;
> =A0 =A0 =A0 =A0int err;
>
> + =A0 =A0 =A0 mxc_gpio_get_hw(pdev);
> +
> =A0 =A0 =A0 =A0port =3D kzalloc(sizeof(struct mxc_gpio_port), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!port)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> @@ -276,7 +370,7 @@ static int __devinit mxc_gpio_probe(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0writel(0, port->base + GPIO_IMR);
> =A0 =A0 =A0 =A0writel(~0, port->base + GPIO_ISR);
>
> - =A0 =A0 =A0 if (cpu_is_mx2()) {
> + =A0 =A0 =A0 if (mxc_gpio_hwtype =3D=3D IMX2_GPIO) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* setup one handler for all GPIO interrup=
ts */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!once) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_set_chained_handler(po=
rt->irq,
> @@ -334,6 +428,7 @@ static struct platform_driver mxc_gpio_driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D mxc_gpio_probe,
> + =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D mxc_gpio_devtype,
> =A0};
>
> =A0static int __init gpio_mxc_init(void)
> --
> 1.7.4.1
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
