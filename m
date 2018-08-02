From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC
        documentation
Date: Thu, 2 Aug 2018 11:55:27 +0200
Message-ID: <20180802095527.GD14203@lst.de>
References: <20180725093649.32332-1-hch@lst.de> <20180725093649.32332-7-hch@lst.de> <20180731224630.GB12168@rob-hp-laptop> <20180801071635.GC20224@lst.de> <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 01, 2018 at 12:26:31PM -0600, Rob Herring wrote:
> Not really my problem that they didn't follow the process and upstream
> their binding first. But this alone is just a string identifier, so I
> don't really care that much. If things are really a mess, then the
> next implementations will have to have better compatible strings. More
> likely, I'll just see folks trying to add various properties to deal
> with all the differences.
> 
> You could always define a better compatible and leave 'riscv,plic0' as
> a fallback to avoid breaking things.

Is there any better way to define a compatible other than having
duplicate IRQCHIP_DECLARE() statements?
