From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH RESEND 1/5] pinctrl: allows not to define the get_group_pins
 operation
Date: Fri, 11 Apr 2014 11:21:53 +0200
Message-ID: <5347B431.5060506@gmail.com>
References: <1397135274-10764-1-git-send-email-antoine.tenart@free-electrons.com> <1397135274-10764-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397135274-10764-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart@free-electrons.com>, linus.walleij@linaro.org
Cc: alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/10/2014 03:07 PM, Antoine T=C3=A9nart wrote:
> When using a group only pinctrl driver, which does not have any
> information on the pins it is useless to define a get_group_pins
> always returning an empty list of pins.
>
> When not using get_group_pin[1], a driver must implement it so
> pins =3D NULL and num_pins =3D 0. This patch makes it the default
> behaviour if not defined in the pinctrl driver when used in
> pinmux enable and disable funtions and in pinctrl_groups_show.
>
> It also adds a check in pinctrl_get_group_pins and return -EINVAL if
> not defined. This function is called in the gpiolib when adding when
> pingroup range. It cannot be used if no group is defined, so this sea=
ms
> reasonable.

I don't have a strong opinion about making pins optional for pinctrl
drivers. I'll leave it for Linus to decide on it.

But have you checked all the other places pins are referred to?

One place that jumps into my mind would be the DEBUGFS files...

Sebastian

> [1] get_group_pin(struct pinctrl_dev *pctldev,
> 		  unsigned selector,
> 		  const unsigned **pins,
> 		  unsigned *num_pins);
>
> Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com=
>
> ---
>   drivers/pinctrl/core.c   | 17 ++++++++++-------
>   drivers/pinctrl/pinmux.c | 23 +++++++++++++----------
>   2 files changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index c0fe6091566a..e09474ecde23 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c
> @@ -468,6 +468,9 @@ int pinctrl_get_group_pins(struct pinctrl_dev *pc=
tldev, const char *pin_group,
>   	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
>   	int gs;
>
> +	if (!pctlops->get_group_pins)
> +		return -EINVAL;
> +
>   	gs =3D pinctrl_get_group_selector(pctldev, pin_group);
>   	if (gs < 0)
>   		return gs;
> @@ -1362,15 +1365,16 @@ static int pinctrl_groups_show(struct seq_fil=
e *s, void *what)
>
>   	seq_puts(s, "registered pin groups:\n");
>   	while (selector < ngroups) {
> -		const unsigned *pins;
> -		unsigned num_pins;
> +		const unsigned *pins =3D NULL;
> +		unsigned num_pins =3D 0;
>   		const char *gname =3D ops->get_group_name(pctldev, selector);
>   		const char *pname;
> -		int ret;
> +		int ret =3D 0;
>   		int i;
>
> -		ret =3D ops->get_group_pins(pctldev, selector,
> -					  &pins, &num_pins);
> +		if (ops->get_group_pins)
> +			ret =3D ops->get_group_pins(pctldev, selector,
> +						  &pins, &num_pins);
>   		if (ret)
>   			seq_printf(s, "%s [ERROR GETTING PINS]\n",
>   				   gname);
> @@ -1694,8 +1698,7 @@ static int pinctrl_check_ops(struct pinctrl_dev=
 *pctldev)
>
>   	if (!ops ||
>   	    !ops->get_groups_count ||
> -	    !ops->get_group_name ||
> -	    !ops->get_group_pins)
> +	    !ops->get_group_name)
>   		return -EINVAL;
>
>   	if (ops->dt_node_to_map && !ops->dt_free_map)
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index 9248ce4efed4..051e8592990e 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -391,14 +391,16 @@ int pinmux_enable_setting(struct pinctrl_settin=
g const *setting)
>   	struct pinctrl_dev *pctldev =3D setting->pctldev;
>   	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
>   	const struct pinmux_ops *ops =3D pctldev->desc->pmxops;
> -	int ret;
> -	const unsigned *pins;
> -	unsigned num_pins;
> +	int ret =3D 0;
> +	const unsigned *pins =3D NULL;
> +	unsigned num_pins =3D 0;
>   	int i;
>   	struct pin_desc *desc;
>
> -	ret =3D pctlops->get_group_pins(pctldev, setting->data.mux.group,
> -				      &pins, &num_pins);
> +	if (pctlops->get_group_pins)
> +		ret =3D pctlops->get_group_pins(pctldev, setting->data.mux.group,
> +					      &pins, &num_pins);
> +
>   	if (ret) {
>   		const char *gname;
>
> @@ -470,14 +472,15 @@ void pinmux_disable_setting(struct pinctrl_sett=
ing const *setting)
>   	struct pinctrl_dev *pctldev =3D setting->pctldev;
>   	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
>   	const struct pinmux_ops *ops =3D pctldev->desc->pmxops;
> -	int ret;
> -	const unsigned *pins;
> -	unsigned num_pins;
> +	int ret =3D 0;
> +	const unsigned *pins =3D NULL;
> +	unsigned num_pins =3D 0;
>   	int i;
>   	struct pin_desc *desc;
>
> -	ret =3D pctlops->get_group_pins(pctldev, setting->data.mux.group,
> -				      &pins, &num_pins);
> +	if (pctlops->get_group_pins)
> +		ret =3D pctlops->get_group_pins(pctldev, setting->data.mux.group,
> +					      &pins, &num_pins);
>   	if (ret) {
>   		const char *gname;
>
>
