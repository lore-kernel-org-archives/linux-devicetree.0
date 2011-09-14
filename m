From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] isp1760: Make probing via device tree
	non-powerpc-specific
Date: Wed, 14 Sep 2011 15:10:54 +0100
Message-ID: <CA+wbFdeLCOh5DdcPkWhmtsbchn7BYvLj5t+0_KXfH_iV_o6OuA@mail.gmail.com>
References: <1316008633-31009-1-git-send-email-dave.martin@linaro.org>
	<1316008633-31009-2-git-send-email-dave.martin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316008633-31009-2-git-send-email-dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2011 at 2:57 PM, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch just replaces the (presumably historical) CONFIG_OF_PPC

Apologies, it looks like a script ate part of the commit message for
this commit.

It should read:

    isp1760: Make probing via device tree non-powerpc-specific

    This patch just replaces the (presumably historical) CONFIG_OF_PPC
    ifdefs with CONFIG_OF, and supplies some missing includes.


I can fix that when reposting, but feedback on the patch is still
appreciated in the meantime.

Thanks
---Dave

>
> Signed-off-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/usb/host/isp1760-if.c | =A0 10 ++++++----
> =A01 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
> index 7ee3005..69ee32c 100644
> --- a/drivers/usb/host/isp1760-if.c
> +++ b/drivers/usb/host/isp1760-if.c
> @@ -17,16 +17,18 @@
>
> =A0#include "isp1760-hcd.h"
>
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
> =A0#include <linux/of.h>
> =A0#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> =A0#endif
>
> =A0#ifdef CONFIG_PCI
> =A0#include <linux/pci.h>
> =A0#endif
>
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
> =A0static int of_isp1760_probe(struct platform_device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct usb_hcd *hcd;
> @@ -396,7 +398,7 @@ static int __init isp1760_init(void)
> =A0 =A0 =A0 =A0ret =3D platform_driver_register(&isp1760_plat_driver);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0any_ret =3D 0;
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
> =A0 =A0 =A0 =A0ret =3D platform_driver_register(&isp1760_of_driver);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0any_ret =3D 0;
> @@ -416,7 +418,7 @@ module_init(isp1760_init);
> =A0static void __exit isp1760_exit(void)
> =A0{
> =A0 =A0 =A0 =A0platform_driver_unregister(&isp1760_plat_driver);
> -#ifdef CONFIG_PPC_OF
> +#ifdef CONFIG_OF
> =A0 =A0 =A0 =A0platform_driver_unregister(&isp1760_of_driver);
> =A0#endif
> =A0#ifdef CONFIG_PCI
> --
> 1.7.4.1
>
>



-- =

Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Linaro Kernel Working Group

--
http://www.linaro.org/ -- Open source software for ARM SoCs

http://www.facebook.com/pages/Linaro
http://twitter.com/#!/linaroorg
http://www.linaro.org/linaro-blog/
