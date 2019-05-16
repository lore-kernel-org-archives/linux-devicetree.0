From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Thu, 16 May 2019 14:21:35 +0100
Message-ID: <fa434575-5576-aff5-8705-1f93eefa209c@arm.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
 <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
 <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
 <3c2c9094-69d4-bace-d5ee-c02b7f56ac82@arm.com>
 <CAJiuCcd=gCQJ4mxn3wNhHXveOhFLnYSEs+cnOMHcALPvd7bQZw@mail.gmail.com>
 <CAC=3edbn1yXih5vP0SwsDkqRB0j5q0c4FL0jhCq9DQ9Wt2-hAA@mail.gmail.com>
 <e8618889-9b22-7f9f-7451-3c08a80a0f9b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e8618889-9b22-7f9f-7451-3c08a80a0f9b@arm.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <rob.e.herring@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 16/05/2019 12:19, Robin Murphy wrote:
[...]
> I was expecting to see a similar behaviour to my T620 (which I now
> assume was down to 64-bit job descriptors sort-of-but-not-quite working)
> but this does look a bit more fundamental - the fact that it's a level 1
> fault with VA == head == tail suggests to me that the MMU can't see the
> page tables at all to translate anything. I really hope that the H6 GPU
> integration doesn't suffer from the same DMA offset as the Allwinner
> display pipeline stuff, because that would be a real pain to support in
> io-pgtable.

Assuming you mean the case where the physical address (as seen by the
CPU) is different from the dma address (as seen by the GPU), then I
highly doubt it because mali_kbase doesn't support it:

[from kbase_mem_pool_alloc_page() in mali_kbase_mem_pool.c]:

	dma_addr = dma_map_page(dev, p, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
	if (dma_mapping_error(dev, dma_addr)) {
		__free_page(p);
		return NULL;
	}

	WARN_ON(dma_addr != page_to_phys(p));


That being said it's quite possible there could be something in the bus
which needs configuring to make this work - in which case your best bet
is to look at the vendor kernel and see if anything extra is poked when
the Mali driver is loaded.

Steve
