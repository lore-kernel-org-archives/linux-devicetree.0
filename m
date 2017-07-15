From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: Submit of a driver for Pi433 - a radio module for Raspberry Pi
Date: Sat, 15 Jul 2017 15:47:39 +0200
Message-ID: <20170715134739.GA20360@kroah.com>
References: <281067739.16216.1499788929736@ox.hosteurope.de>
 <20170712074305.GA20198@kroah.com>
 <197075499.65628.1500117344413@ox.hosteurope.de>
 <20170715112454.GB1753@kroah.com>
 <89433969.66090.1500123565835@ox.hosteurope.de>
 <20170715130220.GA22977@kroah.com>
 <826180465.66159.1500124248340@ox.hosteurope.de>
 <20170715131628.GA29222@kroah.com>
 <1152815224.66246.1500126030682@ox.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1152815224.66246.1500126030682-mPx3TeDXVI9fnkZfMEZNjw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 15, 2017 at 03:40:30PM +0200, Marcus Wolf wrote:
> Hi Greg,
>  
> I absolutly agree. My patch should meet the needs of an official patch.

Again, don't use html email :)

> But I don't know about the exact needs. Can you please help me? What is needed
> / missing in my patch and how do I produce it?
> Maybe you can pass me a link, where I can read, what to do?

The link I sent you, Documentation/SubmittingPatches in the kernel
source tree, should contain everything you need to know.  As a minimum
you need a good subject, a good changelog body text, and a
signed-off-by: line.  The file should tell you all about how to create
this.

If you have specific questions after reading that about these things,
please let us know.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
