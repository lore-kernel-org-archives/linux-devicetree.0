From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] iio: st_sensors: do not always write enable_axis
 register
Date: Mon, 9 Oct 2017 21:59:08 +0100
Message-ID: <20171009215908.57358b45@archlinux>
References: <20170830115043.3738-1-lorenzo.bianconi@st.com>
        <20170830115043.3738-4-lorenzo.bianconi@st.com>
        <CACRpkdbFvAr26d_ExN-PuazsA_ZbPoOFuCKn-k-s3uwVvd64jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbFvAr26d_ExN-PuazsA_ZbPoOFuCKn-k-s3uwVvd64jg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Sep 2017 13:15:55 +0200
Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Aug 30, 2017 at 1:50 PM, Lorenzo Bianconi
> <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > New devices (e.g. LIS2DW12) enable all axis by default and do not export
> > that capability in register map. Check if the enable_axis register
> > address has been declared in st_sensor_settings map in order to verify if
> > the driver needs to enable all sensor axis
> >
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>  
> 
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Applied.
> 
> Yours,
> Linus Walleij
