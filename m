Return-Path: <SRS0=sWet=Q2=labundy.com=jeff@kernel.org>
Date: Mon, 18 Feb 2019 20:05:49 -0600
From: Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v6 2/2] input: touchscreen: Add support for Azoteq
 IQS550/572/525
Message-ID: <20190219020549.GA2531@labundy.com>
References: <1549838394-3852-1-git-send-email-jeff@labundy.com>
 <1549838394-3852-2-git-send-email-jeff@labundy.com>
 <20190218064054.GA242714@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190218064054.GA242714@dtor-ws>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, rydberg@bitmath.org, robh+dt@kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

Hi Dmitry,

Many thanks for your kind review. All of your comments sound great
to me; would just like to provide some background behind the first
one before spinning a v7 (comments below).

On Sun, Feb 17, 2019 at 10:40:54PM -0800, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sun, Feb 10, 2019 at 04:39:54PM -0600, Jeff LaBundy wrote:
> > This patch adds support for the Azoteq IQS550/572/525 family of
> > trackpad/touchscreen controllers.
> > 
> > The driver has been tested with an IQS550EV02 evaluation board. A
> > demonstration of the driver's capabilities is available here:
> > 
> > https://youtu.be/sRNNx4XZBts
> 
> A few comments:
> 
> - we have request_ihex_firmware that requests and validates biary
>   representation of ihex into the kernel. There is not really a good
>   reason to parse text ihex in kernel.
>   There is idex2bin in ./firmware to convert it.

Agreed on all counts; using request_ihex_firmware was my original
intent. However the vendor's ihex format is slightly nonstandard in
that the checksum field is not calculated for every record, and the
EOF record contains a nonzero address (0xFFFF), both of which cause
ihex2bin to produce an error.

This means the vendor's firmware would have to be passed through a
second (custom) fixup tool before being converted yet again with
ihex2bin. Therefore I (reluctantly) made the decision to handle the
vendor's semi-custom ihex format in the driver directly.

If that's a deal breaker, I'm happy to adopt request_ihex_firmware
and contact the vendor to suggest that their configuration tool is
updated to export true ihex files. However, there is no guarantee
as to when/if that would happen, and it seems I would need to offer
said fixup tool in the meantime (which I can certainly do).

Let me know if that background changes your mind, or if you would
still like to see this changed (either way works for me).

> - I would recommend against doing this whole business of automatic
>   uprevving and updating firmware on probe. The controller mees to have
>   persistent firmware, so just check whether the device comes up in
>   bootloader or normal mode, and if it is in bootloader mode simply
>   forego creating and registering input device and wait for the
>   userspace to update firmware ad fix it up.
>   Not having to deal with firmware on probe will also allow compiling
>   the driver into the kernel (vs being a module) as firmware loading is
>   not normally available until after root filesystem is mounted.

Agreed on all counts; I like that idea much better.

> - firmware update is usually keyed off device model, not DT name.

Agreed; I wasn't sold on my original method.

My new plan is to let user space specify the name of the firmware, as
the vendor's configuration tool appends some customer-specific revision
information to the exported file's name that customers may opt to keep.

> > +static int iqs5xx_read_burst(struct i2c_client *client,
> > +				u16 reg, u8 *val8, u8 len)
> 
> If you make val8 void * you won't need to cast.

Thanks for the tip; will do.

> > +
> > +static int iqs5xx_write_burst(struct i2c_client *client,
> > +				u16 reg, u8 *val8, u8 len)
> 
> const void *.

Thanks for the tip; will do.

> > +	error = devm_request_threaded_irq(&client->dev, client->irq,
> > +			NULL, iqs5xx_irq,
> > +			IRQF_ONESHOT | IRQF_TRIGGER_RISING,
> 
> Please do not specify IRQ trigger, let it come from device tree, so only
> use IRQF_ONESHOT.

Agreed; will do.

> By the way, I'd recommend using level interrupts so you never miss the
> edge.

Sounds good; I will update the example in the bindings doc to reflect.

> Thanks.
> 
> -- 
> Dmitry
> 
