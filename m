From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: misc: add a generic regulator driver
Date: Wed, 28 Dec 2016 14:00:58 +0100
Message-ID: <CACRpkdYam=VTXHh--fnnC+R7g=7z_4wGT8bg+=n01gEMSa5Buw@mail.gmail.com>
References: <1480432969-20913-1-git-send-email-bgolaszewski@baylibre.com>
 <44cce3d5-f65e-1a35-20a4-5eb9fda42312@metafoo.de> <CAMpxmJWDWk-mXUHHGEKm-VVwzqEGLDQjc274Xq+Qwc2eN=YbsQ@mail.gmail.com>
 <d4c7f1ca-49d4-7abe-bfc9-e1728f62a9fb@metafoo.de> <bf3dde7e-cee8-c54c-db93-447ffa063116@kernel.org>
 <CAMpxmJVJ+y9tRbRBsVg+i0EJO_6EFuvrypwC=ETnBWbMnxRFyg@mail.gmail.com>
 <c670d597-46b6-235f-545f-7136a3abff7f@metafoo.de> <CAMpxmJVpj57s-m_FS58J+QWvu-MnVmaZP-6ECnYHeRVSCfd-Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMpxmJVpj57s-m_FS58J+QWvu-MnVmaZP-6ECnYHeRVSCfd-Fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2016 at 3:28 PM, Bartosz Golaszewski
<bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:

> + Linus
>
> While the new GPIO interface would be very convenient - in our case we
> could simply name the lines appropriately in the device tree - I'm not
> sure this would be the correct approach.
>
> From this year's ELCE in Berlin I remember Linus suggested during his
> talk that it's always better to write a kernel driver. Also: this way
> the relevant GPIO lines would not be reserved for exclusive use by
> power switches.
>
> Linus - do you have any thoughts/suggestions on that subject?

If the probe you are power cycling has its own DT node and is
described as a device per se in the system, then it should have
a device driver grabbing and toggling its own GPIO line.

If the probe is only really known in userspace, and driven
from userspace, it's GPIO reset line should also be driven
from userspace, using the chardev ABI as you describe.

Whether something should have a userspace or kernelspace
driver is a gray area, admittedly. There are cases for both.
The general consideration would be reuse and deployment.
If you expect all users of this probe to always use libiio and
some other userspace, I guess userspace-only makes sense?

Yours,
Linus Walleij
