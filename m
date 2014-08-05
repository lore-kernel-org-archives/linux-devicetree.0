Return-Path: <delicious.quinoa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140802001538.GA11170@amd.pavel.ucw.cz>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
	<1406932118-13885-2-git-send-email-atull@opensource.altera.com>
	<20140802001538.GA11170@amd.pavel.ucw.cz>
Date: Tue, 5 Aug 2014 13:11:57 -0500
Message-ID: <CANk1AXSDNUjwdT6q0ZRKMrUwV0PaianSRkR61GFES9_4yE3mzg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fpga manager framework core
From: Alan Tull <delicious.quinoa@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Pavel Machek <pavel@denx.de>
Cc: atull@opensource.altera.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 1, 2014 at 7:15 PM, Pavel Machek <pavel@denx.de> wrote:
> Hi!
>
>> +static int fpga_mgr_get_new_minor(struct fpga_manager *mgr, int request_nr)
>> +{
>> +     int nr, start;
>> +
>> +     /* check specified minor number */
>> +     if (request_nr >= FPGA_MAX_MINORS) {
>> +             dev_err(mgr->parent, "Out of device minors (%d)\n", request_nr);
>> +             return -ENODEV;
>> +     }
>
> if (request_nr < -1)
>    return -EINVAL;
> ?
>
>> +     /* FPGA mangager isr */
>> +     irqreturn_t (*isr)(int irq, void *dev_id);
>> +};
>
> "manager"?
>
> Best regards,
>                                                                         Pavel

Thanks!  Will fix these.

Alan

>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
