From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v8 0/7] Unify CPU topology across ARM & RISC-V
Date: Mon, 1 Jul 2019 11:55:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1907011154310.3867@viisi.sifive.com>
References: <20190627195302.28300-1-atish.patra@wdc.com>  <alpine.DEB.2.21.9999.1907011143520.3867@viisi.sifive.com> <5f31cb3c576bdbd89665614582af66d04ece8f29.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f31cb3c576bdbd89665614582af66d04ece8f29.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net" <davem@davemloft.net>, "palmer@sifive.com" <palmer@sifive.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "jeremy.linton@arm.com" <jeremy.linton@arm.com>, "mingo@kernel.org" <mingo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "morten.rasmussen@arm.com" <morten.rasmussen@arm.com>, "ottosabart@seberm.com" <otto>
List-Id: devicetree@vger.kernel.org

On Mon, 1 Jul 2019, Atish Patra wrote:

> On Mon, 2019-07-01 at 11:44 -0700, Paul Walmsley wrote:
> > 
> > Looks like patches 1, 6, and 7 are missing your Signed-off-by:.  Can I 
> > add those?
> > 
> Sure. 
> 
> Is it a common practice to add "Signed-off-by:" the sender even if the
> sender has not touched the patch at all?

Yes, see section 11(c) here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n418

The main factor here is that you collected and resent the patches - thus 
you're in the patch submission chain.


- Paul
