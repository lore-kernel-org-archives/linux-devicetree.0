From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [BUG BISECT] Ethernet fail on VF50 (OF: Don't set default
 coherent DMA mask)
Date: Tue, 31 Jul 2018 16:58:41 +0100
Message-ID: <10c2ca4d-d587-2705-2802-b6df3dc72fd4@arm.com>
References: <CAJKOXPeaguNxRr7pCArJ5Db4tS6Kr5BDheCxskY+vd0dUN+0GQ@mail.gmail.com>
 <CAJKOXPfageiBVXddtdJRBS+092O3QfD0yoS_Mk+PoX7+qNYNUA@mail.gmail.com>
 <20180727140448.GA29001@lst.de> <20180728165820.GA5731@roeck-us.net>
 <45f7fc82-fb9c-e666-4ada-c5338d2c1c96@arm.com>
 <39fa11ce4b7dd151d98868f375baf818@agner.ch>
 <0e893142-a5db-d119-6eb3-f849db6b5d04@arm.com>
 <f67628ad-4cae-96cd-d0c4-3b2f7d12a822@roeck-us.net>
 <4ce17098-850f-3bb0-b977-8d7932e74e06@arm.com>
 <20180731154353.GA29601@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731154353.GA29601@roeck-us.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stefan Agner <stefan@agner.ch>, Christoph Hellwig <hch@lst.de>, Krzysztof Kozlowski <krzk@kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Fugang Duan <fugang.duan@nxp.com>
List-Id: devicetree@vger.kernel.org

On 31/07/18 16:43, Guenter Roeck wrote:
> On Tue, Jul 31, 2018 at 03:09:34PM +0100, Robin Murphy wrote:
>>> Please note that sparc images still generate the warning (next-20180731).
>>
>> Ugh, OK, any ideas what sparc does to create these platform devices that
>> isn't of_platform_device_create_pdata() and has somehow grown an implicit
>> dependency on of_dma_configure() since 4.12? I'm looking, but nothing jumps
>> out...
>>
> 
> I suspect it might be of_device_register(), called from
> 	arch/sparc/kernel/of_device_64.c:scan_one_device()
> 	arch/sparc/kernel/of_device_32.c:scan_one_device()

Right, that's as far as I got as well, so I'm struggling to see how 
these things ever got DMA masks set before the of_dma_configure() call 
moved out of of_platform_device_create_pdata(), or why it wasn't a 
problem prior to the generic dma_ops rework if they didn't :/

Robin.
