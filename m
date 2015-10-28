From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 2/4] watchdog: ts4800: add new driver for TS-4800 watchdog
Date: Wed, 28 Oct 2015 12:52:51 -0400
Message-ID: <20151028165251.GA5948@localhost>
References: <1445978021-13961-1-git-send-email-damien.riegel@savoirfairelinux.com>
 <1445978021-13961-3-git-send-email-damien.riegel@savoirfairelinux.com>
 <CADhT+wdWcYMQ_ZPhcGOye3oP=6N+Yos+sbqV20E5x5Hmfm8ycw@mail.gmail.com>
 <20151027215135.GA4676@localhost>
 <20151028020501.GA1548@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151028020501.GA1548-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 07:05:01PM -0700, Guenter Roeck wrote:
> In general, naming a driver for the first chip it supports is not
> problematic. Making it too generic is, on the other side, problematic.
> What are you going to do if ts4900 (or ts4801) implements a different
> watchdog ?

Okay, I will keep the current name.

I noticed that other boards might have their feed register at different
offsets from syscon base. For instance, feed register is at offset 0x6
on TS-4720 and offset 0xE on TS-4800 (syscon registers are 16-bit wide).
So I need to address that as well (it is related to the next point).

Currently, the driver maps all syscon registers even if it uses only one
of them. I was thinking about adding a "syscon" node and define the
watchdog as a child of it, but the syscon driver set
syscon_regmap_config.val_bits to 32. Do I have to create a new driver if
I want to use val_bits = 16, or is there another way ?

Damien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
