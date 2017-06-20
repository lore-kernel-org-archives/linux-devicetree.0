From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: gyro: st_gyro: fix L3GD20H support
Date: Tue, 20 Jun 2017 13:28:58 +0200
Message-ID: <CACRpkdaH0E9XbP5_TgENXxffPEg9fAf_UNpu8tkObZ9enm0DXA@mail.gmail.com>
References: <20170619200431.9615-1-lorenzo.bianconi@st.com> <20170619200431.9615-2-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170619200431.9615-2-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Dolca <robert.dolca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 19, 2017 at 10:04 PM, Lorenzo Bianconi
<lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Add proper support for L3GD20H gyroscope sensor. In particular:
> - use L3GD20H as device name instead of L3GD20
> - fix available full scales
> - fix available sample frequencies
>
> Fixes: 9444a300c2be (IIO: Add support for L3GD20H gyroscope)
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>

Is this then fixing the issue papered over by
commit a0657716416f834ef7710a9044614d50a36c3bdc
"iio:gyro: bug on L3GD20H gyroscope support"
?

Then we should probably state that as a Fixes: too.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
