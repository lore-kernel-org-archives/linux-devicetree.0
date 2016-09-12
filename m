From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 03/22] usb: ulpi: Support device discovery via DT
Date: Mon, 12 Sep 2016 15:05:01 -0700
Message-ID: <147371790115.20135.5378574586724662470@sboyd-linaro>
References: <20160907213519.27340-1-stephen.boyd@linaro.org>
 <20160907213519.27340-4-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160907213519.27340-4-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2016-09-07 14:35:00)
> @@ -174,6 +219,21 @@ static int ulpi_register(struct device *dev, struct =
ulpi *ulpi)
>         ulpi->id.product =3D ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
>         ulpi->id.product |=3D ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
>  =

> +       /* Some ULPI devices don't have a vendor id so rely on OF match */
> +       if (ulpi->id.vendor =3D=3D 0)
> +               goto err;
> +
> +       request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.produ=
ct);
> +
> +       return 0;
> +err:
> +       return of_device_request_module(&ulpi->dev);

This can't return the value of of_device_request_module() because that
returns an error if the module is builtin or if module loading is
disabled. I'll have to ignore the error here and just return success all
the time.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
