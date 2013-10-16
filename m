From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] mfd: tc3589x: reform device tree probing
Date: Wed, 16 Oct 2013 10:43:56 +0100
Message-ID: <20131016094356.GE19112@lee--X1>
References: <1381871803-22796-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1381871803-22796-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 15 Oct 2013, Linus Walleij wrote:

> This changes the following mechanisms in the TC3589x device tree
> probing path:
>=20
> - Use the .of_match_table in struct device_driver to match the
>   device in the device tree.
> - Add matches for the proper compatible strings "toshiba,..."
>   and all sub-variants, just as is done for the .id matches.
> - Move over all the allocation of platform data etc to the
>   tc3589x_of_probe() function and follow the pattern of passing
>   a platform data pointer back, or an error pointer on error,
>   as found in the STMPE driver.
> - Match the new (proper) compatible strings for the GPIO and
>   keypad MFD cells.
> - Use of_device_is_compatible() rather than just !strcmp()
>   to discover which cells to instantiate.
>=20
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/tc3589x.c | 84 ++++++++++++++++++++++++++++++++++++-----=
----------
>  1 file changed, 59 insertions(+), 25 deletions(-)

Nice patch overall.

> +	of_id =3D of_match_device(tc3589x_match, dev);
> +	if (!of_id)
> +		return ERR_PTR(-ENODEV);

I still think -EINVAL is better in this case, but I see that some
people are using -ENODEV as well and I'm not religious enough about it
to care, so:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

:)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
