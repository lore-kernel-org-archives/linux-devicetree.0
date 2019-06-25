From: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] riscv: dts: Re-organize SPI DT nodes
Date: Tue, 25 Jun 2019 09:01:33 +0530
Message-ID: <CAAhSdy0Z_uGMYqC+6yRPFzEBDGi+SHkrvhe2+1ZMt9heHhJ0=g@mail.gmail.com>
References: <1561375453-3135-1-git-send-email-yash.shah@sifive.com> <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906241421550.22820@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 2:53 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Mon, 24 Jun 2019, Yash Shah wrote:
>
> > As per the General convention, define only device DT node in SOC DTSi
> > file with status = "disabled" and enable device in Board DTS file with
> > status = "okay"
> >
> > Reported-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> This is a good start, but should also cover the other I/O devices in the
> chip DT file.  The mandatory internal devices, like the PRCI and PLIC, can
> stay the way they are.

Yes, this convention only applies to SoC devices with external connections
so PRCI, PLIC, and CLINT DT nodes are not required to follow this.

Eventually, this convention helps when we have multiple boards of same
SOC and each board having different set of peripherals connections.

Regards,
Anup
