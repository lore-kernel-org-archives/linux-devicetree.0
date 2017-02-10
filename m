From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v2] usb: host: fotg2: add device tree probing
Date: Fri, 10 Feb 2017 14:12:36 +0100
Message-ID: <CACRpkdYmfv0XCirnaMSqZ7O9cKp2XAvqJoGQBSXqHN9fSKGnHg@mail.gmail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
 <20170208200010.21522-2-ulli.kroll@googlemail.com> <alpine.LNX.2.00.1702091513580.6226@T420s>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1702091513580.6226@T420s>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 9, 2017 at 3:20 PM, Hans Ulli Kroll
<ulli.kroll@googlemail.com> wrote:

> Add device tree probe for fotg2 driver
>
> v2:
> fix in wrong MODULE_DEVICE_TABLE
>
> Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> +       /* Right now device-tree probed devices don't get dma_mask set.
> +        * Since shared usb code relies on it, set it here for now.
> +        * Once we have dma capability bindings this can go away.
> +        */
> +
> +       retval = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +       if (retval)
> +               goto fail_create_hcd;

Were you able to test this part? I saw the gemini has some DMA engine
but I never saw a driver for it. It looks like a reasonable thing to do to
my untrained DMA eye.

Yours,
Linus Walleij
