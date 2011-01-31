From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] SDHCI: S3C: Add support for retrieving memory and irq
	resource information from device tree.
Date: Mon, 31 Jan 2011 09:41:21 -0700
Message-ID: <AANLkTi=YFo0q12eNZ3oHjSp9rvBz6AQddo6oOh_fQk2-@mail.gmail.com>
References: <1296491294-11030-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1296491294-11030-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kgene.kim-Sze3O3UU22LR7s880joybQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Thomas Abraham <thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 9:28 AM,  <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> From: Thomas Abraham <thomas.abraham-68IGFXMjmZ7QT0dZR+AlfA@public.gmane.org>
>
> Add support for retrieving memory and irq resource information
> from device tree for Samsung's SDHCI controller driver.
>
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> The modification will be made more generic to support both
> DT and non-DT versions of the driver without the #ifdef's.
> For now, this patch is for review and to understand if the
> approach adopted to obtain resource information from the
> device tree is appropriate.
>
> =A0drivers/mmc/host/sdhci-s3c.c | =A0 32 ++++++++++++++++++++++++++++++++
> =A01 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
> index 1720358..f536061 100644
> --- a/drivers/mmc/host/sdhci-s3c.c
> +++ b/drivers/mmc/host/sdhci-s3c.c
> @@ -19,6 +19,9 @@
> =A0#include <linux/clk.h>
> =A0#include <linux/io.h>
> =A0#include <linux/gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
>
> =A0#include <linux/mmc/host.h>
>
> @@ -348,23 +351,52 @@ static int __devinit sdhci_s3c_probe(struct platfor=
m_device *pdev)
> =A0 =A0 =A0 =A0struct sdhci_s3c *sc;
> =A0 =A0 =A0 =A0struct resource *res;
> =A0 =A0 =A0 =A0int ret, irq, ptr, clks;
> + =A0 =A0 =A0 struct device_node *np =3D NULL;
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 struct resource iores;
> +#endif
>
> =A0 =A0 =A0 =A0if (!pdata) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "no device data specified\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOENT;
> =A0 =A0 =A0 =A0}
>
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 for_each_compatible_node(np, NULL, "samsung,sdhci-s3c") {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u32 *id =3D of_get_property(np, "cell=
-index", NULL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(*id) =3D=3D pdev->id)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!np) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "no matching device node speci=
fied in device tree\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;
> + =A0 =A0 =A0 }

I think I've got a better solution to this which I'll be posting
today.  I've got code that allows the dt support code to 'snoop'
platform bus registrations and set the of_node pointer for matching
nodes.  Then all the normal platform_bus support will work just fine.
Doing it this way prevents building a kernel that supports both dt and
non-dt booting.

Also, relying on cell-index is generally considered a bad idea.  When
using the dt, let the kernel do the device enumeration instead of
specifying it explicitly with cell-index.

> +#endif
> +
> +#ifndef CONFIG_OF
> =A0 =A0 =A0 =A0irq =3D platform_get_irq(pdev, 0);
> +#else
> + =A0 =A0 =A0 irq =3D of_irq_to_resource(np, 0, NULL);
> +#endif

When using the dt, platform_get_irq() should still work correctly.
This shouldn't be necessary.

> =A0 =A0 =A0 =A0if (irq < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "no irq specified\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return irq;
> =A0 =A0 =A0 =A0}
>
> +#ifndef CONFIG_OF
> =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> =A0 =A0 =A0 =A0if (!res) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "no memory specified\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOENT;
> =A0 =A0 =A0 =A0}
> +#else
> + =A0 =A0 =A0 if (of_address_to_resource(np, 0, &iores)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "no memory specified in device=
 tree\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 res =3D &iores;
> +#endif

Ditto

>
> =A0 =A0 =A0 =A0host =3D sdhci_alloc_host(dev, sizeof(struct sdhci_s3c));
> =A0 =A0 =A0 =A0if (IS_ERR(host)) {
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
