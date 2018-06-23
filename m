From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/3] RISC-V: Don't include irq-riscv-intc.h
Date: Sat, 23 Jun 2018 00:25:12 -0700
Message-ID: <20180623072512.GB25573@infradead.org>
References: <20180622232006.12158-1-palmer@sifive.com>
 <20180622232006.12158-2-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180622232006.12158-2-palmer@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, shorne@gmail.com, tglx@linutronix.de, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2018 at 04:20:04PM -0700, Palmer Dabbelt wrote:
> This file has never existed in the upstream kernel, but it's guarded by
> an #ifdef that's also never existed in the upstream kernel.  As a part
> of our interrupt controller refactoring this header is no longer
> necessary, but this reference managed to sneak in anyway.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
