From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] RISC-V: simplify software interrupt / IPI code
Date: Thu, 26 Jul 2018 10:10:15 +0200
Message-ID: <20180726081015.GA22702@lst.de>
References: <20180725093649.32332-2-hch@lst.de> <mhng-03f673cd-5779-44c6-98b3-657e5c4b9d39@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <mhng-03f673cd-5779-44c6-98b3-657e5c4b9d39@palmer-si-x1c4>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Christoph Hellwig <hch@lst.de>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 02:44:32PM -0700, Palmer Dabbelt wrote:
> I think it's probably easier to have the whole patch set go through the IRQ
> tree, so I won't put these in the RISC-V tree unless someone says something.

No matter where it goes it probably makes sense to keep the whole
series together..
