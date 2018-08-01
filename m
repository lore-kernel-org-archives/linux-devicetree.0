From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUG BISECT] Ethernet fail on VF50 (OF: Don't set default
 coherent DMA mask)
Date: Wed, 1 Aug 2018 11:23:26 -0700
Message-ID: <20180801182326.GA20550@roeck-us.net>
References: <20180728165820.GA5731@roeck-us.net>
 <45f7fc82-fb9c-e666-4ada-c5338d2c1c96@arm.com>
 <39fa11ce4b7dd151d98868f375baf818@agner.ch>
 <0e893142-a5db-d119-6eb3-f849db6b5d04@arm.com>
 <f67628ad-4cae-96cd-d0c4-3b2f7d12a822@roeck-us.net>
 <4ce17098-850f-3bb0-b977-8d7932e74e06@arm.com>
 <20180731154353.GA29601@roeck-us.net>
 <10c2ca4d-d587-2705-2802-b6df3dc72fd4@arm.com>
 <20180731173859.GA17007@roeck-us.net>
 <9f32010e-3bcb-2153-dac3-996e9d1b1e9b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9f32010e-3bcb-2153-dac3-996e9d1b1e9b@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Stefan Agner <stefan@agner.ch>, Christoph Hellwig <hch@lst.de>, Krzysztof Kozlowski <krzk@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fugang Duan <fugang.duan@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 05:33:30PM +0100, Robin Murphy wrote:
> On 31/07/18 18:38, Guenter Roeck wrote:
> >On Tue, Jul 31, 2018 at 04:58:41PM +0100, Robin Murphy wrote:
> >>On 31/07/18 16:43, Guenter Roeck wrote:
> >>>On Tue, Jul 31, 2018 at 03:09:34PM +0100, Robin Murphy wrote:
> >>>>>Please note that sparc images still generate the warning (next-20180731).
> >>>>
> >>>>Ugh, OK, any ideas what sparc does to create these platform devices that
> >>>>isn't of_platform_device_create_pdata() and has somehow grown an implicit
> >>>>dependency on of_dma_configure() since 4.12? I'm looking, but nothing jumps
> >>>>out...
> >>>>
> >>>
> >>>I suspect it might be of_device_register(), called from
> >>>	arch/sparc/kernel/of_device_64.c:scan_one_device()
> >>>	arch/sparc/kernel/of_device_32.c:scan_one_device()
> >>
> >>Right, that's as far as I got as well, so I'm struggling to see how these
> >>things ever got DMA masks set before the of_dma_configure() call moved out
> >>of of_platform_device_create_pdata(), or why it wasn't a problem prior to
> >>the generic dma_ops rework if they didn't :/
> >>
> >Ah, ok. No idea, sorry. All I know is that the messages were first seen
> >with next-20180727.
> 
> OK, I spent this afternoon wrangling toolchains and QEMU to boot an
> instrumented 4.11 kernel, and the answer is that the warnings are arguably
> correct. These masks have indeed never been set where they should have been,
> but then the sbus_dma_ops don't reference them anyway.
> 
> The coherent mask WARN_ON *should* have started appearing in 4.16 with
> 205e1b7f51e4("dma-mapping: warn when there is no coherent_dma_mask"), but
> happened to be hidden by the inadvertent side-effect of the prior
> dma_configure() change. Since there's seemingly no actual regression of
> functionality, I'm inclined to leave this in the hands of whoever cares
> about sparc32.
> 

You mean there is now a warning stating that coherent_dma_mask is not set,
but coherent_dma_mask isn't used by sparc32 in the first place ?

Guenter
