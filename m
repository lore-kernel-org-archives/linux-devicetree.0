From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
Date: Tue, 31 Jul 2018 17:38:01 -0700
Message-ID: <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180731165712.GA2521@lst.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Christoph Hellwig <hch@lst.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "anup@brainfault.org" <anup@brainfault.org>, "palmer@sifive.com" <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shorne@gmail.com" <shorne@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 7/31/18 9:52 AM, Christoph Hellwig wrote:
> On Mon, Jul 30, 2018 at 08:21:33PM -0700, Atish Patra wrote:
>> I found the issue. As per PLIC documentation, a hart context is a given
>> privilege mode on a given hart. Thus, cpu context ID & cpu numbers are not
>> same. Here is the PLIC register Maps in U54 core:
>>
>> Ref: https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf
>>
>> Memory address for Interrupt enable
>> Address
>> 0x0C00-2080   Hart 1 M-mode enables
>> 0x0C00 2094   End of Hart 1 M-mode enables
>>
>> 0x0C00-2100   Hart 1 S-mode enables
>> 0x0C00-2114   End of Hart 1 S-mode enables
>>
>> Memory map Claim/Threshold
>> Address
>> 0x0C20-1000 4B 	 M-mode priority threshold
>> 0x0C20-1004 4B   M-mode claim/complete
>> 0x0C20-2000 4B   S-mode priority threshold
>> 0x0C20-2004 4B   S-mode claim/complete
>>
>> The original PLIC patch was calculating based on handle->contextid which
>> will assume numbers on a HighFive Unleashed board as 2 4 6 8.
>>
>> In this patch, context id is assigned as cpu numbers which will be 1 2 3 4.
>> Thus it will lead to incorrect plic address access as shown below.
> 
> Indeed.  Can you try this branch, which puts back the OF contextid
> parsing from the original code:
> 
>     git://git.infradead.org/users/hch/riscv.git riscv-irq-simple.2
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-irq-simple.2
> 
> 

Some typos in the above repo in the PLIC driver patch. The following 
changes are required. Inline patch below

diff --git a/drivers/irqchip/irq-riscv-plic.c 
b/drivers/irqchip/irq-riscv-plic.c
index 0e524e3e..9dbaca47 100644
--- a/drivers/irqchip/irq-riscv-plic.c
+++ b/drivers/irqchip/irq-riscv-plic.c
@@ -79,7 +79,7 @@ static DEFINE_SPINLOCK(plic_toggle_lock);
  static inline void plic_toggle(int ctxid, int hwirq, int enable)
  {
         u32 __iomem *reg = plic_regs + ENABLE_BASE +
-               ctxid * ENABLE_PER_HART + (hwirq / 32);
+               ctxid * ENABLE_PER_HART + (hwirq / 32) * 4;
         u32 hwirq_mask = 1 << (hwirq % 32);

         spin_lock(&plic_toggle_lock);
@@ -166,7 +166,7 @@ static void plic_handle_irq(struct pt_regs *regs)
  static int __init plic_init(struct device_node *node,
                 struct device_node *parent)
  {
-       int error = 0, nr_mapped = 0, cpu, i;
+       int error = 0, nr_mapped = 0, i;
         u32 nr_irqs;

         if (plic_regs) {
@@ -211,8 +211,7 @@ static int __init plic_init(struct device_node *node,
                         pr_err("invalid OF parent, skipping context 
%d.\n", i);
                         continue;
                 }
-
-               if (riscv_of_processor_hart(parent.np->parent < 0))
+               if (riscv_of_processor_hart(parent.np->parent) < 0)
                         continue;

                 plic_handler_present[i] = true;


With the above changes, I am able to boot quite far. But it still 
crashes which may be a driver issue. I might have missed something while 
merging all the out-of-tree drivers from riscv-all branch.

Here is my git repo.
https://github.com/atishp04/riscv-linux/tree/master_chris_cleanup_v4

crash details are at
https://paste.debian.net/1036078/

Regards,
Atish
