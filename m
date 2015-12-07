From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] of: fix build failure
Date: Mon, 7 Dec 2015 19:12:30 +0100
Message-ID: <CAMuHMdVQhW6P79-rNG=oz5QF3eHgQUGWUt0LAbhAzxMxvL+-3w@mail.gmail.com>
References: <1449490849-1833-1-git-send-email-sudipm.mukherjee@gmail.com>
	<CAMuHMdWFaHGnT5GNsN+HEYH2RhMwocwV0GNQbnXBiTYuocZ3QA@mail.gmail.com>
	<20151207163006.GA3819@sudip-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151207163006.GA3819@sudip-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 7, 2015 at 5:30 PM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>> > --- a/include/linux/of_address.h
>> > +++ b/include/linux/of_address.h
>> > @@ -112,8 +112,6 @@ static inline bool of_dma_is_coherent(struct device_node *np)
>> >  extern int of_address_to_resource(struct device_node *dev, int index,
>> >                                   struct resource *r);
>> >  void __iomem *of_iomap(struct device_node *node, int index);
>> > -void __iomem *of_io_request_and_map(struct device_node *device,
>> > -                                       int index, const char *name);
>>
>> Upon closer look, both of_address_to_resource() and of_iomap() are
>> provided by drivers/of/address.c, so they should also be protected by
>> #ifdef CONFIG_OF_ADDRESS instead of CONFIG_OF.
>> Then the whole #ifdef CONFIG_OF section becomes empty.
>>
>> >  #else
> <snip>
>> >
>> >  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
>> >  extern const __be32 *of_get_pci_address(struct device_node *dev, int bar_no,
>>
>> Hence can you please move all of them to the existing
>> #ifdef CONFIG_OF_ADDRESS section, and move the #include <linux/io.h>
>> to the top?
>
> oops, no. I think you have missed seeing few more places.
> of_address_to_resource() of_iomap() are both defined in
> arch/sparc/kernel/of_device_common.c
> So if it is moved under #ifdef CONFIG_OF_ADDRESS then we again
> get a build failure for duplicate definition of them.

Oops, you're right.

Sorry, I never noticed before sparc provides its own definitions.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
