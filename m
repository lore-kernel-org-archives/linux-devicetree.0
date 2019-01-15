From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v10 06/12] peci: Add a PECI adapter driver for Aspeed AST24xx/AST25xx
Date: Wed, 16 Jan 2019 10:14:26 +1100
Message-ID: <CACPK8XdBSYHB+S8Sp8Y=J0cK9D=coa+coQj3S7TEFs9DJ8Ljxg@mail.gmail.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com> <CACPK8XfMyXfomepZEPJCr=A-cCPw-CVAZ0B2CuKn7oXCNz6LbQ@mail.gmail.com>
 <abaef001-a769-ec5d-45f0-02a994fdbee6@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <abaef001-a769-ec5d-45f0-02a994fdbee6@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, Robin Murphy <robin.murphy@arm.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, 15 Jan 2019 at 09:49, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >> +       /**
> >> +        * We check that the regmap works on this very first access,
> >> +        * but as this is an MMIO-backed regmap, subsequent regmap
> >> +        * access is not going to fail and we skip error checks from
> >> +        * this point.
> >
> > Why do you use a regmap for this driver? AFAICT it has exclusive
> > ownership over the register range it uses, which is sometimes a reason
> > to use a regmap over a mmio region.
> >
> > I'm not sure if you've ever disassembled drivers/base/regmap/regmap.o,
> > but if you do you will find that a single mmio read turns into
> > hundreds of instructions.
> >
>
> No specific reason. regmap makes some overhead as you mentioned but it
> also provides some advantages on access simplification, endianness
> handling and register dump at run time. I would not insist using of
> regmap if you prefer using of raw readl and writel. Do you want replace
> regmap with readl and writel in this driver?

I think that would be best.

You raise some good points about the regmap API, and you're not alone
in using it for these reasons. We should look in to providing a
suitable API without the overhead, or making regmap more efficient for
the mmio case.
