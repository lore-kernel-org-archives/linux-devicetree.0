From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Thu, 6 Feb 2014 16:08:27 +0200
Message-ID: <52F3975B.2080806@ti.com>
References: <1391608060-10760-1-git-send-email-ivan.khoronzhuk@ti.com> <1391608060-10760-2-git-send-email-ivan.khoronzhuk@ti.com> <alpine.DEB.2.02.1402052123560.24986@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1402052123560.24986-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: santosh.shilimkar-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 02/05/2014 10:27 PM, Thomas Gleixner wrote:
> On Wed, 5 Feb 2014, Ivan Khoronzhuk wrote:
>> +	/* here we have to be sure the timer has been disabled */
> Sigh. This is not a proper explanation for a barrier, really. You want
> to explain what it serializes against what. i.e. you want to explain
> why you are using the relaxed functions and avoid a separate non
> relaxed variant in favour of an explicit barrier.
>
>> +	__iowmb();
> The proper thing is to have an inline function key_stone_barrier() and
> a full explanation of the issue in exactly that place instead of
> handwaving comments here and there.
>
> Thanks,
>
> 	tglx

I can add new inline function like:

/**
  * keystone_timer_barrier: write memory barrier
  * use explicit barrier to avoid using readl/writel non relaxed function
  * variants, because in our case relaxed variants hide the true places
  * where barrier is needed.
  */
static inline void keystone_timer_barrier(void)
{
     __iowmb();
}

and use it where it is needed.
Are you OK with it?

And I propose to leave comments under the barriers in order to be
able to understand why they are used.

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
