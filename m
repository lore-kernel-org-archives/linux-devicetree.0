From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] iio: st_sensors: decouple irq1 configuration
 parameters from the irq2 ones
Date: Mon, 9 Oct 2017 21:05:05 +0100
Message-ID: <20171009210505.0b3eee5f@archlinux>
References: <20170830115043.3738-1-lorenzo.bianconi@st.com>
        <20170830115043.3738-3-lorenzo.bianconi@st.com>
        <CACRpkdY-xgQ_Eu_Zf1EH-AnSo1pxTq8Pfg37UorMKCk_N7_TEg@mail.gmail.com>
        <CAA2SeNJ8cq+hdEQP4d9Ped9SBQnwCgmSydbShtOexuSEwRGzeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA2SeNJ8cq+hdEQP4d9Ped9SBQnwCgmSydbShtOexuSEwRGzeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 21 Sep 2017 17:38:34 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > On Wed, Aug 30, 2017 at 1:50 PM, Lorenzo Bianconi
> > <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >  
> >> Separate data-ready configuration parameters for INT1 and INT2 pins in
> >> st_sensor_data_ready_irq data structure. That change will be use to
> >> properly support LIS2DW12 accel sensor.
> >>
> >> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>  
> >
> > Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > Also here I feel we should make a sweep over old sensors
> > and make sure we got this right everywhere.  
> 
> I checked all supported devices and irq configurations seem fine.
> Regards,
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> 
> Lorenzo
> 
> >
> > Yours,
> > Linus Walleij  
> 
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
