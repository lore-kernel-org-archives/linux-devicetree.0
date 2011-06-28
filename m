From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/gpio: Add new method for getting gpios under different
	property names
Date: Tue, 28 Jun 2011 15:42:58 -0600
Message-ID: <BANLkTimLmK=dx3cSVeiD__Tq4WF0zgC98w@mail.gmail.com>
References: <20110620225016.4530.73978.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110620225016.4530.73978.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2011 at 4:50 PM, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> This patch adds a new routine, of_get_named_gpio_flags(), which takes the
> property name as a parameter rather than assuming "gpios".
>
> of_get_gpio_flags() is modified to call of_get_named_gpio_flags() with "g=
pios"
> as the property parameter.
>
> Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Merged, thanks.
g.

> ---
>
> =A0drivers/of/gpio.c =A0 =A0 =A0 | =A0 12 +++++++-----
> =A0include/linux/of_gpio.h | =A0 42 +++++++++++++++++++++++++++++++++++++=
+----
> =A02 files changed, 45 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/of/gpio.c b/drivers/of/gpio.c
> index 9059603..6e6a786 100644
> --- a/drivers/of/gpio.c
> +++ b/drivers/of/gpio.c
> @@ -20,9 +20,11 @@
> =A0#include <linux/of_gpio.h>
> =A0#include <linux/slab.h>
>
> +
> =A0/**
> - * of_get_gpio_flags - Get a GPIO number and flags to use with GPIO API
> + * of_get_named_gpio_flags - Get a GPIO number and flags to use with GPI=
O API
> =A0* @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node to get GPIO from
> + * @list_name: property name that contains a list
> =A0* @index: =A0 =A0 index of the GPIO
> =A0* @flags: =A0 =A0 a flags pointer to fill in
> =A0*
> @@ -30,8 +32,8 @@
> =A0* value on the error condition. If @flags is not NULL the function als=
o fills
> =A0* in flags for the GPIO.
> =A0*/
> -int of_get_gpio_flags(struct device_node *np, int index,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum of_gpio_flags *flags)
> +int of_get_named_gpio_flags(struct device_node *np, const char *list_nam=
e,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int index, enum of_=
gpio_flags *flags)
> =A0{
> =A0 =A0 =A0 =A0int ret;
> =A0 =A0 =A0 =A0struct device_node *gpio_np;
> @@ -40,7 +42,7 @@ int of_get_gpio_flags(struct device_node *np, int index,
> =A0 =A0 =A0 =A0const void *gpio_spec;
> =A0 =A0 =A0 =A0const __be32 *gpio_cells;
>
> - =A0 =A0 =A0 ret =3D of_parse_phandles_with_args(np, "gpios", "#gpio-cel=
ls", index,
> + =A0 =A0 =A0 ret =3D of_parse_phandles_with_args(np, list_name, "#gpio-c=
ells", index,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0&gpio_np, &gpio_spec);
> =A0 =A0 =A0 =A0if (ret) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("%s: can't parse gpios property\n=
", __func__);
> @@ -79,7 +81,7 @@ err0:
> =A0 =A0 =A0 =A0pr_debug("%s exited with status %d\n", __func__, ret);
> =A0 =A0 =A0 =A0return ret;
> =A0}
> -EXPORT_SYMBOL(of_get_gpio_flags);
> +EXPORT_SYMBOL(of_get_named_gpio_flags);
>
> =A0/**
> =A0* of_gpio_count - Count GPIOs for a device
> diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
> index 6598c04..920f195 100644
> --- a/include/linux/of_gpio.h
> +++ b/include/linux/of_gpio.h
> @@ -46,8 +46,9 @@ static inline struct of_mm_gpio_chip *to_of_mm_gpio_chi=
p(struct gpio_chip *gc)
> =A0 =A0 =A0 =A0return container_of(gc, struct of_mm_gpio_chip, gc);
> =A0}
>
> -extern int of_get_gpio_flags(struct device_node *np, int index,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum of_gpio_fla=
gs *flags);
> +extern int of_get_named_gpio_flags(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *list_name, int index, enum of_g=
pio_flags *flags);
> +
> =A0extern unsigned int of_gpio_count(struct device_node *np);
>
> =A0extern int of_mm_gpiochip_add(struct device_node *np,
> @@ -60,8 +61,8 @@ extern struct gpio_chip *of_node_to_gpiochip(struct dev=
ice_node *np);
> =A0#else /* CONFIG_OF_GPIO */
>
> =A0/* Drivers may not strictly depend on the GPIO support, so let them li=
nk. */
> -static inline int of_get_gpio_flags(struct device_node *np, int index,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enu=
m of_gpio_flags *flags)
> +static inline int of_get_named_gpio_flags(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *list_name, int index, enum of_g=
pio_flags *flags)
> =A0{
> =A0 =A0 =A0 =A0return -ENOSYS;
> =A0}
> @@ -77,6 +78,39 @@ static inline void of_gpiochip_remove(struct gpio_chip=
 *gc) { }
> =A0#endif /* CONFIG_OF_GPIO */
>
> =A0/**
> + * of_get_gpio_flags - Get a GPIO number and flags to use with GPIO API
> + * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node to get GPIO from
> + * @index: =A0 =A0 index of the GPIO
> + * @flags: =A0 =A0 a flags pointer to fill in
> + *
> + * Returns GPIO number to use with Linux generic GPIO API, or one of the=
 errno
> + * value on the error condition. If @flags is not NULL the function also=
 fills
> + * in flags for the GPIO.
> + */
> +static inline int of_get_gpio_flags(struct device_node *np, int index,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum of_gpio_flags *flags)
> +{
> + =A0 =A0 =A0 return of_get_named_gpio_flags(np, "gpios", index, flags);
> +}
> +
> +
> +/**
> + * of_get_named_gpio - Get a GPIO number to use with GPIO API
> + * @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node to get GPIO from
> + * @list_name: property name that contains a list
> + * @index: =A0 =A0 index of the GPIO
> + *
> + * Returns GPIO number to use with Linux generic GPIO API, or one of the=
 errno
> + * value on the error condition.
> + */
> +static inline int of_get_named_gpio(struct device_node *np,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 con=
st char *list_name, int index)
> +{
> + =A0 =A0 =A0 return of_get_named_gpio_flags(np, list_name, index, NULL);
> +}
> +
> +
> +/**
> =A0* of_get_gpio - Get a GPIO number to use with GPIO API
> =A0* @np: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device node to get GPIO from
> =A0* @index: =A0 =A0 index of the GPIO
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
