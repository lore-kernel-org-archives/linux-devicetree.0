From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 0/5] MTD: Add Initial Hyperbus support
Date: Thu, 18 Apr 2019 19:39:02 +0300
Message-ID: <9ec33aa3-91aa-15f1-bd25-f94eccc65fcb@cogentembedded.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
 <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9e8575e2-b8de-341d-7ab5-08055b84c805@ti.com>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 04/17/2019 08:24 PM, Vignesh Raghavendra wrote:

>> Vignesh Raghavendra (5):
>>    mtd: cfi_cmdset_0002: Add support for polling status register
>>    dt-bindings: mtd: Add binding documentation for HyperFlash
>>    mtd: Add support for HyperBus memory devices
>>    dt-bindings: mtd: Add bindings for TI's AM654 HyperBus memory
>>      controller
>>    mtd: hyperbus: Add driver for TI's HyperBus memory controller
>>
> 
> Thanks for all the reviews!
> Were you able to test this series with your hardware? Would like to get this into v5.2-rc1 if possible

   Not yet, and I still haven't ported my driver to use your HyperBus code.

> Regards
> Vignesh

MBR, Sergei
