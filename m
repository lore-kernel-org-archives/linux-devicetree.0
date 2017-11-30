From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 17:37:27 +0000
Message-ID: <CAKv+Gu8wJkNWufXsRYGe0juLWt9GRfRj=tg3M+on2wtwaj+6EA@mail.gmail.com>
References: <1512058396-15907-1-git-send-email-jassisinghbrar@gmail.com> <20171130.122917.542712364953497229.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20171130.122917.542712364953497229.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Dan Williams <dan.j.williams@intel.com>, Will Deacon <will.deacon@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jaswinder Singh <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

(+ Dan, Will)

On 30 November 2017 at 17:29, David Miller <davem@davemloft.net> wrote:
> From: jassisinghbrar@gmail.com
> Date: Thu, 30 Nov 2017 21:43:16 +0530
>
>> +     priv->eeprom_base = devm_memremap(&pdev->dev, eeprom_res->start,
>> +                                       resource_size(eeprom_res),
>> +                                       MEMREMAP_WT);
>> +     if (!priv->eeprom_base) {
>> +             dev_err(&pdev->dev, "devm_memremap() failed for EEPROM\n");
>> +             ret = -ENXIO;
>> +             goto free_ndev;
>> +     }
>
> dev_memremap() is implemented via memremap() which for MEMREMAP_WT is
> in turn implemented using ioremap_wt() which returns an "__iomem"
> pointer.
>
> The memremap() function talks about __iomem being about side effects.
> That's not really the full story.  The __iomem annotation is also
> about whether a special accessor is necessary to "dereference" the
> pointer.  On sparc64, for example, the ioremap_*() functions return a
> physical address not a virtual one.  So you cannot directly
> dereference pointers that are returned from the ioremap*() interfaces.
>
> You'll also need to mark priv->eeprom_base as "__iomem".
>
> devm_memremap() returns a straight "void *" without the __iomem
> annotation, and this is wrong then ioremap_*() is used.

Well, the whole point of using memremap() instead of ioremap() is that
the region has memory semantics, i.e., we read the MAC address and the
DMA engine microcode from it. If memremap() itself is flawed in this
regard, I agree we should fix it. But as I understand it, this is
really an implementation problem in memremap() [the fact that it falls
back to ioremap()] and not a problem in this driver.

So what alternative would you propose in this case?

BTW, this should be IOREMAP_WC not IOREMAP_WT, because the EEPROM on
the platform in question does not tolerate cached mappings (or rather,
shareable mappings). ioremap_wt() happens to result in device mappings
rather than writethrough cacheable mappings, but this is another
problem in itself. Once arm64 fixes ioremap_wt(), this code will no
longer work on the SynQuacer SoC.
