From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v17 0/5] ZII RAVE platform driver
Date: Tue, 2 Jan 2018 15:17:22 +0000
Message-ID: <20180102151722.padevvmko7cmh7qv@dell>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171221065118.29726-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cphealy@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Philippe Ombredanne <pombredanne@nexb.com>, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Dec 2017, Andrey Smirnov wrote:

> Everyone:
> 
> This patch series is v17 of the driver for supervisory processor found
> on RAVE series of devices from ZII. Supervisory processor is a PIC
> microcontroller connected to various electrical subsystems on RAVE
> devices whose firmware implements protocol to command/qery them.
> 
> NOTE:
> 
>  * This driver dependends on crc_ccitt_false(), added by
>    2da9378d531f8cc6670c7497f20d936b706ab80b in 'linux-next', the patch
>    was pulled in by Andrew Morton and is currently avaiting users, so
>    this series might have to go in through Andrew's tree

Hmm... well that's annoying!  I just attempted to merge this set, but
early build tests fail due to a dependency already merged into -next.

../drivers/mfd/rave-sp.c:227:25: error:
    implicit declaration of function ‘crc_ccitt_false’
    [-Werror=implicit-function-declaration]

We need to figure out if either of the following are true:

 - Patch [0] can be dropped from Andrew's tree
   - ... and I can take it via the MFD tree instead
 - Patch [0] is on an immutable branch I can pull in to my PR

If not, it will have to wait until the next cycle.

[0]:

Author: Andrey Vostrikov <andrey.vostrikov@cogentembedded.com>
Date:   Mon Dec 25 22:39:57 2017 +1100

    lib/crc-ccitt: add CCITT-FALSE CRC16 variant
    
    In support of a soon to be published MFD driver using serdev to talk to
    a supervisory processor that uses the CCITT-FALSE CRC16 variant in it's
    protocol, this patch was tested successfully on an i.MX6 ARM platform.
    
    Link: http://lkml.kernel.org/r/20170413142932.27287-1-andrew.smirnov@gmail.com
    Signed-off-by: Andrey Vostrikov <andrey.vostrikov@cogentembedded.com>
    Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
    Tested-by: Chris Healy <cphealy@gmail.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
