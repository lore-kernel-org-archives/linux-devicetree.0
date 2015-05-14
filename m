From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Date: Thu, 14 May 2015 11:46:06 -0600
Message-ID: <5554DF5E.4020802@wwwdotorg.org>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431624773-4165-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/14/2015 11:32 AM, Brian Norris wrote:
> In commit 8ff16cf77ce3 ("Documentation: devicetree: m25p80: add "nor-jedec"
> binding"), we added a generic "nor-jedec" binding to catch all
> mostly-compatible SPI NOR flash which can be detected via the READ ID
> opcode (0x9F). This was discussed and reviewed at the time, however
> objections have come up since then as part of this discussion:
>
>    http://lkml.kernel.org/g/20150511224646.GJ32500@ld-irv-0074
>
> It seems the parties involved agree that "jedec,spi-nor" does a better
> job of capturing the fact that this is SPI-specific, not just any NOR
> flash.
>
> This binding was only merged for v4.1-rc1, so it's still OK to change
> the naming.
>
> At the same time, let's move the documentation to a better name.
>
> Next up: prune the m25p_ids[] table to the minimal necessary listing, so
> we can stop referring to code (drivers/mtd/devices/m25p80.c) from the
> documentation.

There's no need to change the code to update the documentation. Simply 
paste the list of valid device IDs into the documentation. The binding 
documentation needs to be completely standalone anyway. Binding 
documentation should never refer to Linux driver code as part of their 
definition.

You can never remove the currently-supported device-specific IDs from 
the driver, since existing DTs need to continue working forever, even 
with future drivers/kernels.

The binding document should also always include a complete list of 
supported flash devices. Standard practice is that the DT compatible 
property contains a list of compatible values, starting with the 
device-specific value, and followed by any generic values. All of those 
values should be standardized and specified in the DT documentation, 
even if the DT binding is written in such a way that a compliant driver 
need only actively match on the generic value. The device-specific 
values may not be used today, but are present in case some 
device-specific workaround needs to be retro-actively 
implemented/enabled, since that needs to happen for existing DTs too.

> I'd *really* like to get an 'ack' from a DT maintainer for this, those those
> are apparently very hard to come by. And I'd really not like to have to revisit
> this again in a few weeks. We have patches getting queued up for 4.2 that are
> using the "nor-jedec" binding, and I'd like to nip those in the bud ASAP.

I am not a DT maintainer, but the DT documentation part of this change:
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
