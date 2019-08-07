From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 2/4] RISC-V: Add riscv_isa reprensenting ISA features
 common across CPUs
Date: Wed, 7 Aug 2019 12:25:35 +0530
Message-ID: <CAAhSdy2eP+z28XJmP9O6YPftQ=Rg6AwdSrVwu83igrfvYSRKhw@mail.gmail.com>
References: <20190803042723.7163-1-atish.patra@wdc.com> <20190803042723.7163-3-atish.patra@wdc.com>
 <20190807065119.GA7825@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807065119.GA7825@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Atish Patra <atish.patra@wdc.com>, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Alan Kao <alankao@andestech.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>, Enrico Weigelt <info@metux.net>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 12:21 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Aug 02, 2019 at 09:27:21PM -0700, Atish Patra wrote:
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
>
> Please add this to the kvm series.  Right now this is just dead code.

Sure, I will include this patch in KVM series.

Regards,
Anup
