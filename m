From: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/2] iio: mma8452: add support for 3 more devices
Date: Tue, 30 Jun 2015 13:39:10 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1506301336410.12832@pmeerw.net>
References: <1435663602-29868-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435663602-29868-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Martin,

> The first patch doesn't change anything for existing users of mma8452. Please
> test this if you can!

nice to see the driver improved!
the first patch does quite I bit more than it claims; it's not only
adding more device, I'd prefer the patch split up for review
 
> The second patch corrects how interrupts are described as IIO events. It exists
> seperately because it changes the driver's behaviour for existing users of
> mma8452.

what is the difference?

thanks, p.

-- 

Peter Meerwald
+43-664-2444418 (mobile)
