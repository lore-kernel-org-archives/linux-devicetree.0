From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 1/1] drivers/staging/pi433: New driver
Date: Sun, 16 Jul 2017 12:15:31 +0200
Message-ID: <20170716101531.GA19773@kroah.com>
References: <20170715112454.GB1753@kroah.com>
 <89433969.66090.1500123565835@ox.hosteurope.de>
 <20170715130220.GA22977@kroah.com>
 <826180465.66159.1500124248340@ox.hosteurope.de>
 <20170715131628.GA29222@kroah.com>
 <1152815224.66246.1500126030682@ox.hosteurope.de>
 <20170715134739.GA20360@kroah.com>
 <8d152de9387d8ebae5b3cd11277e8ada-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheXH4CVVE=-webmailer1@server05.webmailer.hosteurope.de>
 <20170716064546.GA11484@kroah.com>
 <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1-aF9hzfVklKyMhzHtofonGKYwuClDyyMfX55GXzBGTY8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolf Entwicklungen <Marcus.Wolf-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 16, 2017 at 11:52:32AM +0200, Wolf Entwicklungen wrote:
> From: Marcus Wolf <linux-79IPTMiko8heq5RAq1AYSxS11BummzK+@public.gmane.org>
> Date: Tue,16 Jul 2017 11:52:06 +0100
> Subject: [PATCH 1/1] drivers/staging/pi433: New driver

Why is this all here in the patch body?  Usually git will strip this
out, but in the future, please don't put it here.

I'll try to queue this up in a few days and let's see what breaks :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
