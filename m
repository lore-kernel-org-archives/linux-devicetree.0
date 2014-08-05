Return-Path: <delicious.quinoa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140802001848.GB11170@amd.pavel.ucw.cz>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
	<1406932118-13885-2-git-send-email-atull@opensource.altera.com>
	<20140802001848.GB11170@amd.pavel.ucw.cz>
Date: Tue, 5 Aug 2014 15:05:40 -0500
Message-ID: <CANk1AXTAMCo_0c2+B9_6AbPPPof=rHZnE+NyxipzVYFnNuS2LQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] fpga manager framework core
From: Alan Tull <delicious.quinoa@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Pavel Machek <pavel@denx.de>
Cc: atull@opensource.altera.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 1, 2014 at 7:18 PM, Pavel Machek <pavel@denx.de> wrote:
> Hi!
>
>> +     nr = ida_simple_get(&fpga_mgr_ida, start, FPGA_MAX_MINORS, GFP_KERNEL);
>> +
>
> Actually, are you sure ida framework is a good idea here? AFAICT, you
> only use it to keep track of used minors.
>                                                                 pavel
>

Yes, the ida is to keep track of minors.  I think that was the intent
of introducing ida into the kernel (looking at git logs of idr.c).
SImilar to idr, but uses less memory.  I see some other frameworks
using it for this purpose, such as the rtc class.  I can change this
if this is something the kernel wants to move away from.  What issues
are you seeing here and what would you suggest?

Alan Tull
aka
delcious.quinoa
aka
atull@opensource.altera.com
