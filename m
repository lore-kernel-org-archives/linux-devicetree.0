From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/8] iio: mma8452: support more devices and improve
 driver
Date: Fri, 03 Jul 2015 09:32:07 +0200
Message-ID: <55963A77.5040202@posteo.de>
References: <1435738922-12580-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435738922-12580-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 2015-07-01 um 10:21 schrieb Martin Kepplinger:
> This is the 2nd version that adds support for motion interrupts and 3 more
> accelerometer chips, two of which use them because they don't support the
> until now included transient interrupt sources:
> 
> MMA8453Q, MMA8652FC and MMA8653FC; datasheets are in the commit messages.
> 
> The driver and module name remains the same, seperating it from the device
> names it now supports.
> 
> On top of this, there are minor documentation additions, and more notably,
> the change of the existing iio event type from IIO_EV_TYPE_THRESH to
> IIO_EV_TYPE_MAG since it's the magnitude of the threshold that is relevant
> for these devices, not a signed value.
> 
> Please review and test if you can. For MMA8452Q, other than the event type,
> nothing should have changed.
> 

Any wishes, suggestions, objections about this change?

thanks,
                           martin



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
