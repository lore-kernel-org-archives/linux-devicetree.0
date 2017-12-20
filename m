From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 00/19] ARM: dts: aspeed: updates and new machines
Date: Wed, 20 Dec 2017 09:24:03 +0100
Message-ID: <CAK8P3a2WQ3MDq_49t=uifC8dPVJ2Zgus35QoTBDOCaa3L0DamQ@mail.gmail.com>
References: <20171220032328.30584-1-joel@jms.id.au> <CACPK8Xdf3__yuMEvD0NiZXihU-8F1R15aEwwJueHLZ6Jfs82oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xdf3__yuMEvD0NiZXihU-8F1R15aEwwJueHLZ6Jfs82oQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 4:37 AM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> On Wed, Dec 20, 2017 at 1:53 PM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
>> This series of device tree patches for the ASPEED BMC machines
>> moves all systems to use the soon to be merged clk driver, and
>> updates machines to use all of the drivers we have upstream.
>>
>>  v3: Address review from Rob and Cedric
>>   - Move aspeed-gpio.h usage out into the patches where use of the GPIO
>>     is added
>>   - Clarify that the aspeed-clock.h patch will be merged as part of
>>     the device tree tree. This is to ensure we don't depend on the clk
>>     tree for building.
>
> Arnd, Michael, Stephen; how do we resolve this? We need the
> dt-bindings header to be present for both the clk driver and the
> device tree to build.
>
> The clk driver is not (yet - soon I hope?) merged by Michael and
> Stephen. I am about to commit the device tree changes that will go
> through the ARM SoC tree.

There are several options:

- avoid the use of the header and redefine the binding to have a
  clear mapping between hardware clock lines and the numeric
  representation. This works better for some SoCs than others,
  YMMV.
- Don't use the constants in the dts files for now, but use the
  numbers directly, and update the dts files for the next merge window
- merge only one side for 4.16, either the driver or the dts files,
  and follow up with the other one in 4.17
- make one shared git branch that contains only the headers
  and base both the driver and the dts files on that branch so you
  get a single shared commit ID.

I'm fine with any of the above, please pick whatever suits you best.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
