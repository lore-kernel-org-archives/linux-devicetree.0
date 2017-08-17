From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] dt-bindings: iio: magn: add LIS2MDL sensor device
 binding
Date: Thu, 17 Aug 2017 15:55:28 +0100
Message-ID: <20170817155528.68354457@archlinux>
References: <20170816170253.8382-1-lorenzo.bianconi@st.com>
        <20170816170253.8382-5-lorenzo.bianconi@st.com>
        <CAA2SeN+iPatt4h1B+qkez0HuVd1ZiojjgXkvu5hYLL_xOU5O2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA2SeN+iPatt4h1B+qkez0HuVd1ZiojjgXkvu5hYLL_xOU5O2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo BIANCONI <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Aug 2017 09:01:22 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Added devicetree ml in cc
> 
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
I've applied this as it is about as trivial as you can get.
If one of the devicetree maintainers really wants to reply then feel free ;)

Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan
> > ---
> >  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > index 1e305f61f3df..9ec6f5ce54fc 100644
> > --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> > +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > @@ -64,6 +64,7 @@ Magnetometers:
> >  - st,lsm303dlhc-magn
> >  - st,lsm303dlm-magn
> >  - st,lis3mdl-magn
> > +- st,lis2mdl
> >
> >  Pressure sensors:
> >  - st,lps001wp-press
> > --
> > 2.14.0
> >  
