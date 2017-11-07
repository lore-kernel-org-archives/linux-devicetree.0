From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Tue, 7 Nov 2017 23:12:45 +0300
Message-ID: <20171107201245.gptgfli54o6eqmrj@speedy.hunter>
References: <20171103195855.15283-1-geomatsi@gmail.com>
 <20171103195855.15283-2-geomatsi@gmail.com>
 <CAMty3ZCs8kq1vUGLOi0ZghY7n0iXgUQ1E=ngBO6Y4wm7wMLF7Q@mail.gmail.com>
 <20171104154221.ao7kkcwqhnja3cxe@speedy.hunter>
 <20171106122633.5mnqfh6xhmmxr45s@flea>
 <20171106161306.tq6yeq6bq36ridj3@speedy.hunter>
 <CAMty3ZCYQx0MfiJnOZPtO4nSAtOrGicOzw_x_AznTiEW8h2sLg@mail.gmail.com>
 <CAMty3ZANhL7cHqYw4VY2Sj_JUZGyqFZ+7pLssc1tniN3BdupOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZANhL7cHqYw4VY2Sj_JUZGyqFZ+7pLssc1tniN3BdupOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> >>> > Did you try to boot from sdcard ? I am not able to boot my board from
> >>> > sd-card without this change. As I mentioned earlier in my email
> >>> > to buildroot mailing list, with mmc debug enabled I see that mmc
> >>> > tries to init sd-card when I remove it from the slot.
> >>> >
> >>> > Maybe there is a minor differences between h/w versions or batches ?
> >>> > What is you board version ? I tested on board v1.0.
> >>>
> >>> Looking at the schematics, it definitely looks like it's active low.
> >>
> >> Is it ok to merge it then ? Or using 'cd-inverted' property
> >> is the preferable option ?
> >
> > W/o any change mainline works unstable for me, it wasn't booting
> > at-all[1] did you find the same?
> >
> > Even tried with active LOW and cd-inverted.
> >
> > [1] https://paste.ubuntu.com/25909064/
> 
> Look like something broken for H5 and A64 between v4.14-rc8 to latest

Both 4.13.7 and 4.14-rc8 (synched today) kernels worked fine for me.
DTS behavior is all the same:
  - default DTS: sd-card is not detected, kernel is waiting forever
  - DTS with 'active low' or 'cd-inverted' fix: sd-card and boot ok

I have been using rootfs from buildroot with your zero-plus2 patches.

Regards,
Sergey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
