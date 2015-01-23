From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH v2 RESEND 2/8] irqchip: Supply new driver for STi based
 devices
Date: Fri, 23 Jan 2015 17:10:55 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1501231702280.5526@nanos>
References: <1421920133-7914-1-git-send-email-lee.jones@linaro.org> <1421920133-7914-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421920133-7914-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 22 Jan 2015, Lee Jones wrote:

> This driver is used to enable System Configuration Register controlled
> External, CTI (Core Sight), PMU (Performance Management), and PL310 L2
> Cache IRQs prior to use.

I'm wondering how this is related to irq_chip, but well, I don't mind
it being parked here.

Though I really cannot say anything about this DT translation
machinery for a single sysconfig register, other than it looks
completely overengineered to me.

The only technical comment I have is: shouldn't all the stuff except
the resume function be marked __init or is any of this required post
init?

Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
