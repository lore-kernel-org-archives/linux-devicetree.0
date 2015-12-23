From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/6] dt-bindings: misc: add document for reboot-mode driver
Date: Wed, 23 Dec 2015 00:37:22 -0800
Message-ID: <CAAtXAHfkfqELHamMVK3-6UE+LtVwimA7oe=QEzfF2WyrHXxcaQ@mail.gmail.com>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com>
	<1450775124-23966-1-git-send-email-andy.yan@rock-chips.com>
	<20151223003217.GA18700@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151223003217.GA18700@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilm
List-Id: devicetree@vger.kernel.org

Rob,

On Tue, Dec 22, 2015 at 4:32 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> I would like to see the property names here standardized as much as
> possible. I'm not sure if we can define the properties as a u32 or need
> some flexibility here.

Quick question, semi on topic. I have a similar case (and a driver in
the pipeline),
however all I got is a (persistent over reboot) hardware register to
which I can write whatever.
On the other side I'd have u-boot pull out the value, but as it's up
to u-boot to
implement whatever it does with this info I'm kinda struggling with the idea
of a standardized binding. In my case I'd like it to go into 'safe
mode' or 'firmware update'.

With loader = <0xace0ba5e>, <0xdeadbeef> ... and loader-names <> I
could have u-boot read the values
from fdt at boot. Then again I'm not describing hardware, but specific
settings ...

Would that be acceptable?

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
