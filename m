From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] iio: accel: st_accel_spi: add OF capability to st_accel_spi
Date: Thu, 29 Jun 2017 14:48:31 +0200
Message-ID: <CACRpkdbF3iVLSr3kBNGmoZjoPX=1KOO74OS3wmTSxFrzqwak3A@mail.gmail.com>
References: <20170626225346.12019-1-lorenzo.bianconi@st.com> <20170626225346.12019-2-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626225346.12019-2-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 12:53 AM, Lorenzo Bianconi
<lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Add device tree support for LIS3DH, LSM330D, LSM330DL, LSM330DLC,
> LIS331DLH, LSM330, LSM303AGR, LIS2DH12, LIS3L02DQ, LNG2DM accel sensors.
> Fix LIS302DL support defining of_device_id data field in st_accel_of_match
> table
>
> Fixes: 762227721fe6 (iio: accel: st_accel: handle deprecated bindings)
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>

Looks right.

Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
