From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Fri, 30 Oct 2015 20:18:15 +0000
Message-ID: <20151030201815.GA818@leverpostej>
References: <20151030150025.GF31073@leverpostej>
 <CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
 <5633B207.5030505@codeaurora.org>
 <CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
 <20151030182537.GB30791@leverpostej>
 <CAHp75Vd-z22XJboxQ=CMxDQ9UaTatbCmpAPLO0jPM0FwJadBOg@mail.gmail.com>
 <5633BB66.3070505@codeaurora.org>
 <20151030190106.GC30791@leverpostej>
 <5633CE23.7060303@linaro.org>
 <CAHp75VcQ6r2FGqsP2mtnv95etCGJmeQ=T7aKSB5H3cvwhdSbDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcQ6r2FGqsP2mtnv95etCGJmeQ=T7aKSB5H3cvwhdSbDw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Al Stone <al.stone@linaro.org>, Sinan Kaya <okaya@codeaurora.org>, dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, leif.lindholm@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 10:15:09PM +0200, Andy Shevchenko wrote:
> On Fri, Oct 30, 2015 at 10:08 PM, Al Stone <al.stone@linaro.org> wrote:
> > On 10/30/2015 01:01 PM, Mark Rutland wrote:
> >> On Fri, Oct 30, 2015 at 02:48:06PM -0400, Sinan Kaya wrote:
> 
> >> The CSRT is listed under "Want", not "Never" or "Don't Care", so Linaro
> >> have certainly not said that CSRT will not be supported. If anything,
> >> they have stated that the table should be supported.
> >
> > "Want" means interesting, and probably useful, but no clear indication that
> > anyone actually needs it.  At one point, we thought we might use the CSRT
> > for describing DMA, but it turns out we have not needed to.
> 
> Then you are going to have either 1 or 0 DMAC for slave devices, right?

I suspect that the currently supported platforms have 0. If not, we have
problems.

> The CSRT, unfortunately, the only way how to enumerate DMAC to be used
> by slave devices.
> You may look into drivers/dma/acpi-dma.c for usage in Linux.
> 
> Yes, I know about _DSD, but I don't think it will provide soon any
> other official mechanisms to what we have now. Better to ask Rafael
> and Mika.

_DSD is insufficient here, given that there is no prescribed way to use
it to describe DMA. Anything for that would have to go through ASWG
before we could use it.

Thanks,
Mark.
