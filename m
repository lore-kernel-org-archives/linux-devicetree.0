From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: gyro: st_gyro: fix L3GD20H support
Date: Tue, 20 Jun 2017 17:40:37 +0100
Message-ID: <20170620174037.657b47e4@kernel.org>
References: <20170619200431.9615-1-lorenzo.bianconi@st.com>
        <20170619200431.9615-2-lorenzo.bianconi@st.com>
        <CACRpkdaH0E9XbP5_TgENXxffPEg9fAf_UNpu8tkObZ9enm0DXA@mail.gmail.com>
        <CAA2SeNKKQM-zsg_8ieaiJbCCsjnPYgQMAds9tafiQHTyrO4fww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA2SeNKKQM-zsg_8ieaiJbCCsjnPYgQMAds9tafiQHTyrO4fww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Dolca <robert.dolca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Denis CIOCCA <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Jun 2017 13:54:30 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> > On Mon, Jun 19, 2017 at 10:04 PM, Lorenzo Bianconi
> > <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >  
> >> Add proper support for L3GD20H gyroscope sensor. In particular:
> >> - use L3GD20H as device name instead of L3GD20
> >> - fix available full scales
> >> - fix available sample frequencies
> >>
> >> Fixes: 9444a300c2be (IIO: Add support for L3GD20H gyroscope)
> >> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>  
> >  
> 
> Hi Linus,
> 
> > Is this then fixing the issue papered over by
> > commit a0657716416f834ef7710a9044614d50a36c3bdc
> > "iio:gyro: bug on L3GD20H gyroscope support"
> > ?
> >
> > Then we should probably state that as a Fixes: too.  
> 
> The sensor support was introduce in 496822c78236 (iio:gyro: Add
> STMicroelectronics gyroscopes driver).
> Commit a0657716416 just removes the support since it was not properly done.
> So what do you think?
> We can add Fixes: 496822c78236 (iio:gyro: Add STMicroelectronics
> gyroscopes driver).
> Jonathan should I send a v2?
Don't worry.  I've added the fixes tag and applied it.

I've also added a paragraph explaining what is going on with the two fixes
tags.  

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
> 
> Regards,
> Lorenzo
> 
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
