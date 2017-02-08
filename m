From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 08 Feb 2017 22:16:52 +0200
Message-ID: <1486585012.2133.420.camel@linux.intel.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
         <1486560068.2133.395.camel@linux.intel.com>
         <20170208135957.GA916@kroah.com>
         <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
         <1486572009.2133.406.camel@linux.intel.com>
         <80e533b6-4eb3-0019-fe18-82dd0d7aaa1c@g0hl1n.net>
         <1486581644.2133.409.camel@linux.intel.com>
         <3902c4a9-cd1d-23fe-df75-127b5cab61ad@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3902c4a9-cd1d-23fe-df75-127b5cab61ad-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-08 at 21:03 +0100, Richard Leitner wrote:
> On 02/08/2017 08:20 PM, Andy Shevchenko wrote:
> > On Wed, 2017-02-08 at 19:45 +0100, Richard Leitner wrote:
> > > On 02/08/2017 05:40 PM, Andy Shevchenko wrote:
> > > > On Wed, 2017-02-08 at 16:17 +0100, Richard Leitner wrote:
> > > > > On 02/08/2017 02:59 PM, Greg KH wrote:
> > > > > > 


>  Should I keep my inline {clr,set}_bit_in_byte() 
> functions an use BIT() in there, or delete them and use BIT()
> directly 
> in usb251xb_get_ofdata() ?

Does it make any sense?

Even just name of your function is longer than what it substitutes.

-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
