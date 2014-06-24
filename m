Return-Path: <ioan.nicu.ext@nsn.com>
Date: Tue, 24 Jun 2014 20:31:55 +0200
From: Ioan Nicu <ioan.nicu.ext@nsn.com>
Subject: Re: [PATCH 5/6] OF: Utility helper functions for dynamic nodes
Message-ID: <20140624183155.GA12606@heimdall>
References: <20140623183343.GA10389@heimdall>
 <78ACBAF6-A73E-4272-8D3A-258C4B10858C@konsulko.com>
 <53A8848A.3000803@roeck-us.net>
 <F23F6108-A3BE-47CB-B545-4F40520979BF@konsulko.com>
 <CAL_Jsq+wdybDOWtEJFiRn7TMxAdJ8at27G_KvCHkO_444hqZuw@mail.gmail.com>
 <53A982ED.3070709@nsn.com>
 <CAL_Jsq+H6qu_Bvs=3+c6EXCmpO7L9vGUmgxDHeqtUKiT+2+0GA@mail.gmail.com>
 <53A99CB5.70704@nsn.com>
 <AD9656AF-FBD2-4BAC-B4E2-79409D491F26@konsulko.com>
 <20140624182247.GA12169@heimdall>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140624182247.GA12169@heimdall>
To: ext Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nsn.com>, ext Rob Herring <robherring2@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Tue, Jun 24, 2014 at 08:23:08PM +0200, Ioan Nicu wrote:
> Hi Pantelis,
> 
> 
> Those are not the only users, and drivers/ is not the only place to look
> for them. For example in sound/ppc/tumbler.c:
> 
> [...]
>         paddr = of_get_property(tas_node, "i2c-address", NULL);
>         if (paddr == NULL)
>                 paddr = of_get_property(tas_node, "reg", NULL);
> [...]
> 
> This code should also use of_find_property() IMHO.
> 

One correction. This example is wrong for our discussion, so ignore it.
But I was showing it just to highlight that there may be other wrong uses
which don't fit the pattern you specified.

I guess that the only way to catch them all is using your patch which issues
a warning.

Regards,
Ioan.
