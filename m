From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH 1/3 v2] usb: host: fotg2: add device tree probing
Date: Fri, 17 Feb 2017 12:02:00 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1702171121500.12334@T420s>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <20170208200010.21522-2-ulli.kroll@googlemail.com> <alpine.LNX.2.00.1702091513580.6226@T420s> <CACRpkdYmfv0XCirnaMSqZ7O9cKp2XAvqJoGQBSXqHN9fSKGnHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYmfv0XCirnaMSqZ7O9cKp2XAvqJoGQBSXqHN9fSKGnHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Linus

On Fri, 10 Feb 2017, Linus Walleij wrote:

> On Thu, Feb 9, 2017 at 3:20 PM, Hans Ulli Kroll
> <ulli.kroll@googlemail.com> wrote:
> 
> > Add device tree probe for fotg2 driver
> >
> > v2:
> > fix in wrong MODULE_DEVICE_TABLE
> >
> > Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> > +       /* Right now device-tree probed devices don't get dma_mask set.
> > +        * Since shared usb code relies on it, set it here for now.
> > +        * Once we have dma capability bindings this can go away.
> > +        */
> > +
> > +       retval = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > +       if (retval)
> > +               goto fail_create_hcd;
> 
> Were you able to test this part? 

The driver itself is tested on my NAS 4220, which has *two* USB Ports. I 
transfered about 4 GB from one USB thumb drive to another one.

I must check my Inventory. I can remember of some Samsung SE-208BW.
It's CD/DVD Wifi device which uses also Gemini SoC, and has one host and 
gadget port.

And with the handling with the gadget port is odd. If this is connected 
with an USB host controller all parts are powerd off, only the CD/DVD part 
is running and the USB lines are passed trough. So there must be some 
switch device here.

There is also some VBUS and USB-ID pins controlled by the Gemini SoC, but 
these are not used on my NAS, maybe the CD/DVD Writer.

> I saw the gemini has some DMA engine
> but I never saw a driver for it. It looks like a reasonable thing to do to
> my untrained DMA eye.

I think the DMA engine is used for other stuff.
Some quick grep with SL2312_GENERAL_DMA_BASE and WRITE_DMA_REG
in the NAS 4420 sources 

drivers/char/gemini_i2s.c
drivers/telephony/gemini_ssp.c
drivers/telephony/gemini_ssp.h
include/asm-arm/arch-sl2312/gemini_i2s.h
include/asm-arm/arch-sl2312/gemini_ssp.h
sound/oss/Storm_ssp.c
sound/oss/storm_ssp.h

sound (via i2s) and telephone ???

Oh and your powercontroler is in
drivers/char/gemini_pwr.c

Greetings
Hans Ulli Kroll
