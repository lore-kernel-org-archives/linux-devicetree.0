From: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] watchdog: bcm7038: add device tree binding
 documentation
Date: Tue, 25 Aug 2015 12:40:03 -0700
Message-ID: <20150825194001.GA34223@Justins-MacBook-Pro.local>
References: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
 <1440092486-16905-2-git-send-email-justinpopo6@gmail.com>
 <55DA9045.2060107@roeck-us.net>
 <20150825175538.GA16266@Justins-MacBook-Pro.local>
 <20150825190448.GA29547@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150825190448.GA29547-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 25, 2015 at 12:04:48PM -0700, Guenter Roeck wrote:
> Justin,
> 
> On Tue, Aug 25, 2015 at 10:55:40AM -0700, Justin Chen wrote:
> > 
> > Hello Guenter,
> > 
> > > Is 'clock-frequency' really needed (and useful), or would it make more sense
> > > to expect the user to configure a fixed clock if nothing else is available ?
> > > How do other drivers handle this ?
> > 
> > The reason for 'clock-frequency' was for a case where our device tree did not
> > have clocks. Creating a new fixed clock for a single device seems unnecessary
> > compared to a 'clock-frequency' property. Their is a use for 'clock-frequency',
> > but it is not really necessary. However, this is my first linux patch, so I do 
> > not fully trust my judgement on this...
> > 
> 
> All that is needed for a fixed clock is a devicetree entry for it. Not sure
> I understand your line of argument; you add a lot of complexity and code
> just to avoid those few lines in the dts file (especially with 500+
> "fixed-clock" nodes in other devicetree files).
> 
> Thanks,
> Guenter

Ok your argument makes sense. I will remove the clock-frequency property and 
modify the driver accordingly. Thank you for your feedback!

Thanks,
Justin
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
