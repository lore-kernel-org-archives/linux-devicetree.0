From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] of: Specify initrd location using 64-bit
Date: Fri, 28 Jun 2013 09:54:13 +0200
Message-ID: <51CD4125.5060305@linutronix.de>
References: <1371775956-16453-1-git-send-email-santosh.shilimkar@ti.com> <51C4171C.9050908@linutronix.de> <51C48B5A.2040404@ti.com> <51CCA67C.2010803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51CCA67C.2010803@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <a-jacquiot@ti.com>, James Hogan <james.hogan@imgtec.com>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, x86@kernel.org, arm@kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.orgli
List-Id: devicetree@vger.kernel.org

On 06/27/2013 10:54 PM, Rob Herring wrote:

>> Rob,
>> Are you ok with phys_addr_t since your concern was about rest
>> of the memory specific bits of the device-tree code use u64 ?
> 
> No. I still think it should be u64 for same reasons I said originally.

The physical address space is represented by phys_addr_t and not u64
within the kernel. If you go for u64 you may waste 32bit and you need
to check if the running kernel can deal with this.
Why was u64 such a good thing?

> Rob

Sebastian
