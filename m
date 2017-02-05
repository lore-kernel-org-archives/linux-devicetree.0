From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 2/3] MAINTAINERS: add zx2967 watchdog controller
 driver to ARM ZTE architecture
Date: Sun, 5 Feb 2017 12:54:30 +0800
Message-ID: <20170205045429.GE3407@dragon>
References: <1486172055-13162-1-git-send-email-baoyou.xie@linaro.org>
 <1486172055-13162-2-git-send-email-baoyou.xie@linaro.org>
 <4cba1be6-ee85-7371-ea02-1bf8e7eb628e@roeck-us.net>
 <CA+DQWkyOZPQORy-rVSqGY8Ht9xWttYt6Csp6pvShGG4OVA_2YQ@mail.gmail.com>
 <20170205034504.GD3407@dragon>
 <e8573429-8082-abc2-be23-4605172cedf1@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e8573429-8082-abc2-be23-4605172cedf1-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "xie.baoyou" <xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On Sat, Feb 04, 2017 at 08:29:27PM -0800, Guenter Roeck wrote:
> Yes. One of the problems is that the patch doesn't apply to my tree
> (which is based on v4.10-rc3), and it doesn't have a common anchestor,
> meaning it is most likely not based on mainline. I would prefer to avoid
> conflicts with the arm tree if possible.

Understood.  You only need to handle patch #1 and #3, and we will sort
out MAINTAINERS update separately.  Thanks.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
