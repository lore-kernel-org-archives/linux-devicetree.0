From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: Correct RISC-V's timebase-frequency
Date: Wed, 8 Aug 2018 08:44:41 -0600
Message-ID: <CAL_JsqLq_JqjbnjSz7+72ssZH1deKU7iCxofn_bLhiKpCEXD=w@mail.gmail.com>
References: <20180802115008.4031-1-hch@lst.de> <20180802115008.4031-2-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802115008.4031-2-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@wdc.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Stafford Horne <shorne@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 2, 2018 at 5:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Palmer Dabbelt <palmer@sifive.com>
>
> Someone must have read the device tree specification incorrectly,
> because we were putting timebase-frequency in the wrong place.  This
> corrects the issue, moving it from
>
> / {
>         cpus {
>                 timebase-frequency = X;
>         }
> }
>
> to
>
> / {
>         cpus {
>                 cpu@0 {
>                         timebase-frequency = X;
>                 }
>         }
> }
>
> This is great, because the timer's frequency should really be a per-cpu
> quantity on RISC-V systems since there's a timer per CPU.  This should
> lead to some cleanups in our timer driver.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
