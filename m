From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: move tca9554 from pcf857x to pca953x
Date: Mon, 24 Apr 2017 18:28:25 +0200
Message-ID: <CACRpkdZBiXhhqiKGKYKU8-h9Y4=915UGbwhkJjgx0b5p9bfgng@mail.gmail.com>
References: <20170421124631.19269-1-anders@chargestorm.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170421124631.19269-1-anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 21, 2017 at 2:46 PM, Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org> wrote:

> The TCA9554 doesn't work with the pcf857x driver, trying to change the direction
> gives a NAK bailout error.
>
> TCA9554 is similar to the PCA9554, thus change the driver.
>
> Signed-off-by: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
