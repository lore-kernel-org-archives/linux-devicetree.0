From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3 v2] usb: host: fotg2: add device tree probing
Date: Fri, 10 Feb 2017 21:26:55 +0100
Message-ID: <3421824.lhyKKsOD1E@wuerfel>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com> <alpine.LNX.2.00.1702091513580.6226@T420s> <CACRpkdYmfv0XCirnaMSqZ7O9cKp2XAvqJoGQBSXqHN9fSKGnHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYmfv0XCirnaMSqZ7O9cKp2XAvqJoGQBSXqHN9fSKGnHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Friday, February 10, 2017 2:12:36 PM CET Linus Walleij wrote:
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
> Were you able to test this part? I saw the gemini has some DMA engine
> but I never saw a driver for it. It looks like a reasonable thing to do to
> my untrained DMA eye.

We should never use dma_coerce_mask_and_coherent() for new code, it's
only needed for broken platforms without DT.

A 32-bit mask is set by default.

	Arnd
