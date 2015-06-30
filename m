From: Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: mma8452: add support for 3 more accelerometer chips
Date: Tue, 30 Jun 2015 14:49:45 +0300
Message-ID: <CAEnQRZCKkztOc1y4x3mJAakYewDUB52yVd7C03N9eRX=vrrOvA@mail.gmail.com>
References: <1435663602-29868-1-git-send-email-martink@posteo.de>
	<1435663602-29868-2-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435663602-29868-2-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 30, 2015 at 2:26 PM, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org> wrote:
> The one that supports the existing event interrupt settings, uses it. The
> others use their motion detection interrupts.
>
> This is tested on the MMA8653FC.

Would be nice to explicitly add here the names of the new supported
chips, together with link to their datasheets (if available).

thanks,
Daniel.
