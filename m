From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Fix unsupported isa string info.
Date: Tue, 6 Aug 2019 18:26:08 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
References: <20190801005843.10343-1-atish.patra@wdc.com>  <20190801005843.10343-4-atish.patra@wdc.com>  <alpine.DEB.2.21.9999.1908061625190.13971@viisi.sifive.com> <1e23ef1face9d323fda4b756811f922caa5f7689.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e23ef1face9d323fda4b756811f922caa5f7689.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "info@metux.net" <info@metux.net>, "allison@lohutok.net" <allison@lohutok.net>, "palmer@sifive.com" <palmer@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Anup Patel <Anup.Patel@wdc.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "johan@kernel.org" <johan@kernel.org>, "tiny.windzz@gmail.com" <tiny.windzz@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 7 Aug 2019, Atish Patra wrote:

> On Tue, 2019-08-06 at 16:27 -0700, Paul Walmsley wrote:
> 
> > Seems like the "su" should be dropped from mandatory_ext.  What do you 
> > think?
> > 
> 
> Yup. As DT binding only mention imafdc, mandatory extensions should
> contain only that and just consider "su" extensions are considered as
> implicit as we are running Linux. 

Discussing this with Andrew and Palmer, it looks like "su" is currently 
non-compliant.  Section 22.6 of the user-level specification states that 
the "s" character indicates that a longer standard supervisor extension 
name will follow.  So far I don't think any of these have been defined.

> Do you think QEMU DT should be updated to reflect that ?

Yes.

> > There's no Kconfig option by this name, and we're requiring
> > compressed 
> 
> Sorry. This was a typo. It should have been CONFIG_RISCV_ISA_C.
> 
> > instruction support as part of the RISC-V Linux baseline.  Could you 
> > share the rationale behind this?
> 
> I think I added this check at the config file. Looking at the Kconfig,
> RISCV_ISA_C is always enabled. So we can drop this.

OK great.  Do you want to resend an updated patch, or would you like me to 
fix it up here?

I'll also send a patch to drop CONFIG_RISCV_ISA_C.


- Paul
