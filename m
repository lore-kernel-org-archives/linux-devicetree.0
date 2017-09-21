From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] iio: st_sensors: do not always write enable_axis register
Date: Thu, 21 Sep 2017 13:15:55 +0200
Message-ID: <CACRpkdbFvAr26d_ExN-PuazsA_ZbPoOFuCKn-k-s3uwVvd64jg@mail.gmail.com>
References: <20170830115043.3738-1-lorenzo.bianconi@st.com> <20170830115043.3738-4-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170830115043.3738-4-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 30, 2017 at 1:50 PM, Lorenzo Bianconi
<lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> New devices (e.g. LIS2DW12) enable all axis by default and do not export
> that capability in register map. Check if the enable_axis register
> address has been declared in st_sensor_settings map in order to verify if
> the driver needs to enable all sensor axis
>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>

Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
