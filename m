From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 08/14] ARM: versatile-i2c driver DT port
Date: Wed, 18 Aug 2010 15:17:59 -0600
Message-ID: <AANLkTikNWK-RGOk8ESoqT6vdy8yNCepUUEzJK9P8g0dF@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-9-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
> When OF is enabled, each driver should define a match table to
> allow the kernel to recognise drivers suitable for a given device.
> Initialization is carried out through a static inline at driver init
> time. The match-table is declared following OF bindings.
>
> This patch adds the required initialization call to the versatile-i2c
> driver.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/i2c/busses/i2c-versatile.c | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-versatile.c b/drivers/i2c/busses/i2c-=
versatile.c
> index 6055601..ea8e3b5 100644
> --- a/drivers/i2c/busses/i2c-versatile.c
> +++ b/drivers/i2c/busses/i2c-versatile.c
> @@ -133,6 +133,11 @@ static int i2c_versatile_remove(struct platform_devi=
ce *dev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static struct of_device_id versatile_i2c_matches[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "arm,versatile-i2c"},
> + =A0 =A0 =A0 {},
> +};
> +
> =A0static struct platform_driver i2c_versatile_driver =3D {
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D i2c_versatile_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D i2c_versatile_remove,
> @@ -144,6 +149,7 @@ static struct platform_driver i2c_versatile_driver =
=3D {
>
> =A0static int __init i2c_versatile_init(void)
> =A0{
> + =A0 =A0 =A0 platform_init_match(&i2c_versatile_driver, versatile_i2c_ma=
tches);

Ditto to my comments on the last driver.  I'd rather see the pointer
statically assigned instead of set at runtime.

> =A0 =A0 =A0 =A0return platform_driver_register(&i2c_versatile_driver);
> =A0}
>
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
