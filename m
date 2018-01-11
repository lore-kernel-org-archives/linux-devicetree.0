From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon
 drivers
Date: Thu, 11 Jan 2018 10:59:23 +0100
Message-ID: <20180111095923.GA29233@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com>
 <1515661011.31850.27.camel@au1.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515661011.31850.27.camel-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Jae Hyun Yoo <jae.hyun.yoo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jae Hyun Yoo <jae.hyun.yoo-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 07:56:51PM +1100, Benjamin Herrenschmidt wrote:
> On Thu, 2018-01-11 at 08:30 +0100, Greg KH wrote:
> > 4.13?  Why that kernel?  It too is obsolete and insecure and
> > unsupported.
> 
> Haha, it's n-1. come on :-)

And, if you use it in a device, it's still totally unsupported and
insecure.  Seriously, does no one actually pay attention to the patches
I merge in the stable trees anymore?

Anyway, your other comments are good, glad to see work is progressing
well, and yes it's better than a 2.6.y based kernel, but really, that's
a low bar...

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
