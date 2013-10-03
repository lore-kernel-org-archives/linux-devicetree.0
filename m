From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v5 1/2] iio: cm36651: Add CM36651 proximity/light sensor
Date: Thu, 03 Oct 2013 10:36:28 +0200
Message-ID: <524D2C8C.3010502@metafoo.de>
References: <524AC65C.20400@samsung.com> <524B3E0D.3040803@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524B3E0D.3040803-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald l <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/01/2013 11:26 PM, Jonathan Cameron wrote:
> On 10/01/13 13:55, Beomho Seo wrote:
>>
>> This patch adds a new driver for Capella CM36651 proximity and RGB sensor.
>>
>> Signed-off-by: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> A couple of little points inline. In short, some unnecessary
> variable initializations (bad idea as they may hide real bugs)
> and you should use IRQF_DISABLED if you really do need to have
> the interrupt disabled.

IRQF_DISABLED actually does something else (or well did something else,
these days it's a no-op and shouldn't be used). But yea, a flag that keeps
the interrupt disabled would be nice.

> 
> Also, sorry if I missed an explanation, but I can't see why you need
> the enable and disable on the interrupt.  As you explicitly turn the
> interrupt on by writing to a device register why would an interrupt
> occur at any other time?  Convention is normally to not do the disabling
> of the irq unless it is actually necessary.  It complicates
> the code for no gain.

Yep, I don't see any reason why the code actually has to use
enable_irq/disable_irq. Unless there is a problem with the chip that it
tends to generate lots of spurious interrupts. In that case this should be
documented in the code though.

- Lars
