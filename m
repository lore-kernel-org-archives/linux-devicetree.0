From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 2/4] RISC-V: Add riscv_isa reprensenting ISA features
 common across CPUs
Date: Wed, 7 Aug 2019 09:42:29 +0530
Message-ID: <CAAhSdy3tJ3RbnyOtKAT4zsjPUxMQkm+UtWa4sTTZxSAsYUBs5g@mail.gmail.com>
References: <20190803042723.7163-1-atish.patra@wdc.com>
 <20190803042723.7163-3-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1908061452570.13971@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908061452570.13971@viisi.sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 3:24 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Hi Anup, Atish,
>
> On Fri, 2 Aug 2019, Atish Patra wrote:
>
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > This patch adds riscv_isa integer to represent ISA features common
> > across all CPUs. The riscv_isa is not same as elf_hwcap because
> > elf_hwcap will only have ISA features relevant for user-space apps
> > whereas riscv_isa will have ISA features relevant to both kernel
> > and user-space apps.
> >
> > One of the use case is KVM hypervisor where riscv_isa will be used
> > to do following operations:
> >
> > 1. Check whether hypervisor extension is available
> > 2. Find ISA features that need to be virtualized (e.g. floating
> >    point support, vector extension, etc.)
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> Do you have any opinions on how this patch might change for the Z-prefix
> extensions?  This bitfield approach probably won't scale, and with the
> EXPORT_SYMBOL(), it might be worth trying to put together a approach that
> would work over the long term?

Our plan is to use bitmap instead of bitfield and all Zxyz extensions will be
assigned bit positions "27 + i" where "i" will be based on order in-which they
are defined in RISC-V spec. In general, "i" is just a unique relative index
(starting from 0).

To summarize, the existing bitfield approach can be naturally extended
using bitmap.

We will update this patch accordingly.

Regards,
Anup
