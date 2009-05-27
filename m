From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 17:32:24 +0100
Message-ID: <20090527163223.GE1970@sirena.org.uk>
References: <1243408083.13460.14.camel@debian-nb> <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com> <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com> <20090527150527.GK6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762010AbZE0Qcs@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090527150527.GK6805@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Schwebel <r.schwebel@pengutronix.de>
Cc: Timur Tabi <timur@freescale.com>, Janboe Ye <yuan-bo.ye@motorola.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, rmk@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 05:05:27PM +0200, Robert Schwebel wrote:

> I'm highly convinced that the existence of oftree-hell in ARM-land would
> have been *the* key motivation for FSL to have worked on mainline
> instead of inhouse-BSPs back in 2004 when we mainlined i.MX1 and in 2007
> when we started the mainline work on MX27 and MX31.

I remain to be convinced about that but anyway..

> Seriously: oftree in general is a good idea. Just that it doesn't work
> in practise. The concept has some serious flaws:

> - Platform data makes it possible to store function pointers. There
>   is no equivalent to this concept in oftree-land.

The handling of platform data is my main concern as someone working
primarily on platform independant drivers - function pointers are a
particular problem but the possibility of having to write code to
handle both OF and non-OF systems to cater for systems using both
approaches is also a concern for me.

> oftree could be a great tool if these things would be resolved.
> Currently they are not, and in result, ARM just works and is easy,
> whereas on PowerPC systems people often spend more time working on
> binding stuff than on the actual functionality.

This worries me too, my experiences with OF device tree handling for
ASoC have been pretty negative - but then audio is one of the worst
cases for handling within the device tree.
