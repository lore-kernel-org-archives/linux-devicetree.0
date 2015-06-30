From: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Subject: Re: [PATCH 0/2] iio: mma8452: add support for 3 more devices
Date: Tue, 30 Jun 2015 14:21:41 +0200
Message-ID: <559289D5.5020503@theobroma-systems.com>
References: <1435663602-29868-1-git-send-email-martink@posteo.de> <alpine.DEB.2.02.1506301336410.12832@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1506301336410.12832-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2015-06-30 13:39, Peter Meerwald wrote:
> Hello Martin,
> 
>> The first patch doesn't change anything for existing users of mma8452. Please
>> test this if you can!
> 
> nice to see the driver improved!
> the first patch does quite I bit more than it claims; it's not only
> adding more device, I'd prefer the patch split up for review

well, yes. It adds an interrupt source for those that don't support the
existing one, but I could come up with even more seperate changes,
that's true.

>  
>> The second patch corrects how interrupts are described as IIO events. It exists
>> seperately because it changes the driver's behaviour for existing users of
>> mma8452.
> 
> what is the difference?

Since the threshold is no signed value, it changes the event type
from IIO_EV_TYPE_THRESH to IIO_EV_TYPE_MAG, see the patch or
sysfs-bus-iio Documentation:

What:		/sys/.../iio:deviceX/events/in_accel_x_mag_en

Similar to in_accel_x_thresh[_rising|_falling]_en, but here the
magnitude of the channel is compared to the threshold, not its
signed value.

> 
> thanks, p.
> 
