From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/3] spi: mpc512x_psc_spi: move probe-routine to __init
Date: Thu, 16 Dec 2010 10:27:22 -0700
Message-ID: <AANLkTikP9CiUXda0ENwNKfviAE6oDVqXwDUKgj8zvpGr@mail.gmail.com>
References: <1292519639-21859-1-git-send-email-w.sang@pengutronix.de> <1292519639-21859-4-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1292519639-21859-4-git-send-email-w.sang@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 16, 2010 at 10:13 AM, Wolfram Sang <w.sang@pengutronix.de> wrote:
> Since of_probe_platform_driver(), this SoC-device can be moved from
> __devinit to __init because it is not hotpluggable.
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

I really wouldn't bother.  You're counting pennies when the kernel
uses upwards of 4 megabytes for .text alone, and I don't like fiddling
with the driver model the way platform_bus_probe() does.

g.
