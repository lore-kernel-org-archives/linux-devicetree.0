From: Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: remoteproc: Resource table for IRQs
Date: Tue, 20 Mar 2012 19:34:05 +0200
Message-ID: <CAK=WgbaX7HJJkAW-rn4e7BHstgV+zvSnjzg980gGui9ZCRxMqQ@mail.gmail.com>
References: <4F5F1657.9090200@monstr.eu> <CAK=WgbamnCRrEGM-xRZGie+ZoiyZx3uudXb-_dopEj7yMQYuUA@mail.gmail.com>
 <4F6736B9.4070307@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F6736B9.4070307@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: monstr@monstr.eu
Cc: LKML <linux-kernel@vger.kernel.org>, John Williams <john.williams@petalogix.com>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, "Guzman Lugo, Fernando" <fernando.lugo@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Mon, Mar 19, 2012 at 3:38 PM, Michal Simek <monstr@monstr.eu> wrote:
> Maybe I am trying to do things more complicated than they are but
> I still see that make sense to do it.

I agree, it definitely does.

OMAP4 is using this kind of resource allocation for a plethora of resources.

In general there are two options to do this:

- static, via remoteproc (firmware tells us about its resources
requirements via the resource table, Linux allocates them before
booting firmware)
- dynamic, via rpmsg (firmware tells us about its resources
requirements by sending a message just before the relevant use case
kicks in, Linux allocates it only at that point)

The former consumes the resource as long as the remote processor is
powered on, but it's super simple: just add a new resource type.

The latter consumes the resource on when really needed, but it
requires a "resource manager": an rpmsg driver which does this kind of
resource allocation and tracking. Fernando (cc'ed) implemented it
already, and will be posting sometimes in the near future (it's
already available in Fernando's github tree if you're interested).

> What do you think?

Go for it :)

Thanks,
Ohad.
