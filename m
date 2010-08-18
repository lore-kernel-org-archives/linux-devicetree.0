From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 09/14] ARM: ARM flash driver DT port
Date: Wed, 18 Aug 2010 15:22:56 -0600
Message-ID: <AANLkTik2gPYrP+xh-jhFLWjVbr8dwCuCMnVXXvYP56e4@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-10-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
> When OF is enabled drivers should initialize the driver match table
> to allow the kernel to find and recognise drivers suitable for
> devices. The initialization is carried out through a static inline
> function at driver init time.
>
> This patch adds a match table and relative init code to support
> device tree probing methodology for the ARM flash driver.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/mtd/maps/integrator-flash.c | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integ=
rator-flash.c
> index 2aac41b..aa9a556 100644
> --- a/drivers/mtd/maps/integrator-flash.c
> +++ b/drivers/mtd/maps/integrator-flash.c
> @@ -291,6 +291,11 @@ static int armflash_remove(struct platform_device *d=
ev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static struct of_device_id armflash_matches[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "arm,arm-flash"},

(Assuming I'm reading the integrator-flash driver correctly...) When
using the device tree, the entire flash map should be encoded in the
tree, and this mapping driver is no longer needed.  See
mtd/maps/physmap_of.c.

> + =A0 =A0 =A0 {},
> +};
> +
> =A0static struct platform_driver armflash_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D armflash_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D armflash_remove,
> @@ -302,6 +307,7 @@ static struct platform_driver armflash_driver =3D {
>
> =A0static int __init armflash_init(void)
> =A0{
> + =A0 =A0 =A0 platform_init_match(&armflash_driver, armflash_matches);
> =A0 =A0 =A0 =A0return platform_driver_register(&armflash_driver);
> =A0}
>
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
