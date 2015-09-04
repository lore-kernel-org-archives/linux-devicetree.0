From: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Subject: deps: update in regard to parallel initialization of static linked
 drivers
Date: Fri, 4 Sep 2015 11:18:18 +0200
Message-ID: <55E961DA.5040009@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440592108-3740-1-git-send-email-holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russel King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 26.08.2015 um 14:28 schrieb Alexander Holler:
> Hello,

(...)

> Some numbers (5 boots on each board, without and with ordering drivers),
> all times are seconds.

(...)

> imx6q (armv7):
>
> unordered:
> 3.451998 3.418864 3.446952 3.429974 3.440996 (3.4377568)
> ordered:
> 3.538312 3.549019 3.538105 3.515916 3.555715 (3.5394134)

(...)

> Further improvements could be to initialize drivers in parallel (using
> multiple cores) and/or to use this stuff on x86 (ACPI) too (e.g. by using a
> minimal DT which just includes dependencies).

I've now made a quick implementation which uses multiple threads to 
initialize annotated drivers in parallel. It worked out of the box.

Here are the times (dmesg | grep Freeing) I've now measured on the imx6q 
(4 cores):

3.388273 3.399892 3.411615 3.410523 3.388802 (3.399821)

So it's now at least as fast as without ordering the drivers. Even on 
the one system where ordering didn't help without parallel 
initialization (likely because the unordered sequence of initcalls is 
already quiet good on that system, in comparison to the other systems 
I've tested).

And my current implementation for the parallel stuff is far from being 
perfect and can be optimized much more (enough to not post a patch 
here). In addition I've added another driver to my config since I 
measure the old times, so the new times are including one more 
initialization of a driver (it now calls 30 annotated (static linked) 
drivers at boot, most stuff is still in modules (and some not annotated 
static linked drivers) on that system).

Maybe this helps raising interest enough that someone else will test and 
maybe give some (reasonable, not about style) feedback on my patches.

> Regards,
>
> Alexander Holler

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
