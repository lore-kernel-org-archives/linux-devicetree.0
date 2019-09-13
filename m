MIME-Version: 1.0
Date: Fri, 13 Sep 2019 16:29:55 +0100
References: <20190907161537.27258-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161537.27258-1-marek.vasut@gmail.com>
Message-ID: <CAL_JsqKSWD5EOGdvGS7Z8pd6OALRsqxv2GmVLd+9ZoOyPgbr-w@mail.gmail.com>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 7, 2019 at 5:15 PM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.

Just moving to boolean has seemed like weak justification for this
churn, but now that I've seen your work on PCI dma-ranges it makes a
bit more sense.

We do have a problem that unlike 'ranges', 'dma-ranges' being missing
probably needs to be treated as 1:1 translation. I can't really
picture a case where dma-ranges would be used with a non-translatable
address. Perhaps a module with optional DMA and the DMA is not hooked
up. That could be expressed with dma-ranges with a 0 size or a
different compatible. So your v1 patch was perhaps correct change in
behavior, but only for dma-ranges. (I've written one that works in
both cases).

Rob
