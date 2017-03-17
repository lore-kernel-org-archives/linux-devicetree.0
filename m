From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: wm831x: Add basic device tree binding
Date: Fri, 17 Mar 2017 09:37:20 +0000
Message-ID: <20170317093720.ggraoffx6d6rggtw@dell>
References: <1489592384-11510-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170316140019.eoe757vox5wrlkmu@dell>
 <20170316143144.GL6986@localhost.localdomain>
 <20170317091502.kzcrhj7vlku5mtq7@dell>
 <20170317092520.GM6986@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170317092520.GM6986-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 17 Mar 2017, Charles Keepax wrote:

> On Fri, Mar 17, 2017 at 09:15:02AM +0000, Lee Jones wrote:
> > On Thu, 16 Mar 2017, Charles Keepax wrote:
> > 
> > > On Thu, Mar 16, 2017 at 02:00:19PM +0000, Lee Jones wrote:
> > > > On Wed, 15 Mar 2017, Charles Keepax wrote:
> > > > > +	if (i2c->dev.of_node) {
> > > > > +		const struct of_device_id *id = of_match_device(wm831x_of_match,
> > > > > +								&i2c->dev);
> > > > 
> > > > Not keen on this.  Please declare the variable up with the others.
> > > > 
> > > 
> > > They are never going to be used anywhere else in the function.
> > > Again I can if you feel strongly but isn't it really better to
> > > limit the scope of the variables if they are only being used
> > > locally.
> > 
> > I understand the motivation, but if we did that all the time, the code
> > would look pretty dire IMHO.
> > 
> 
> Ok I do another spin.
> 
> > > > > +		unsigned long of_type = (unsigned long)id->data;
> > > > 
> > > > And this one.
> > > > 
> > > > > +		type = (enum wm831x_parent)of_type;
> > > > 
> > > > Looks like you don't even need of_type.
> > > > 
> > > > Just cast id->data straight into wm81x_parent.
> > > 
> > > Pretty sure you will get a warning on 64-bit systems if I do
> > > that.
> > 
> > What makes you think that?
> > 
> 
> commit 942786e6e647cef94cf96dcd836d343be55fc452
> Author: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> mfd: arizona: Rid data size incompatibility warn when building for 64bit
> 
> I am fairly sure an enum would get treated the same as an int by
> the compiler. I will try it and see.

I already prototyped it.  No warnings seen.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
