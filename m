From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 2/3] rtc: Add support for Abracon AB-RTCMC-32.768kHz-B5ZE-S3 I2C RTC chip
Date: Thu, 15 Jan 2015 09:02:23 +0100
Message-ID: <87h9vsqxo0.fsf@natisbad.org>
References: <cover.1421045942.git.arno@natisbad.org>
	<1ae63ab80cfb39305884bd0c2648a420ba3bc0a5.1421045942.git.arno@natisbad.org>
	<20150114165557.d44c5752.akpm@linux-foundation.org>
	<20150114170343.6f8d807a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114170343.6f8d807a.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> (Andrew
	Morton's message of "Wed, 14 Jan 2015 17:03:43 -0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> writes:

> On Wed, 14 Jan 2015 16:55:57 -0800 Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
>
>> Something like this?
>
> Leading to changes in [3/3].  Please have a think about where we should
> be calling device_init_wakeup(dev, false) on the error recovery path.
>
> Let me know if I should just drop it all and await a v2...

I'll work on a v2 to handle your comments and suggestions. I will also
take into account the other comment I got regarding the use of "abracon"
instead of "abcn" as vendor prefix for Abracon Corporation.

Thanks for the review.

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
