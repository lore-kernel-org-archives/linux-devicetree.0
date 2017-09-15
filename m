From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: dac: ds4422/ds4424 dac driver
Date: Fri, 15 Sep 2017 09:11:31 +0200
Message-ID: <CACRpkdYDV-kS-VgvvssU4s6Hrg-5MQ5Xh3v3NNxZWMhAwDXxxQ@mail.gmail.com>
References: <20170914202449.31283-1-Ismail.Kose@maximintegrated.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170914202449.31283-1-Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ismail Kose <Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, William Breathitt Gray <vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Francois Dagenais <jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, "Ismail H. KOSE" <ihkose-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TaqPxH82wqD4g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 14, 2017 at 10:24 PM, Ismail Kose
<Ismail.Kose-zxKO94PEStzToO697jQleEEOCMrvLtNR@public.gmane.org> wrote:

> +struct ds4424_pdata {
> +       const char *vcc_supply_name;

Should not be needed at all, get the supply directly from the device tree.

> +       uint32_t rfs_res[DS4424_MAX_DAC_CHANNELS];
> +       struct iio_map *dac_iio_map;
> +};

Drop this entire platform data file and move all these fields
you still need into struct ds4424_data.

If you have legacy kernels still using platform data, that's too
bad, we will not maintain them upstream and not merge new
board files using platform data normally, use device tree or ACPI
DSTD only please.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
