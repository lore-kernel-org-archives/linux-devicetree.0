From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v7 3/7] cpu-topology: Move cpu topology code to common
 code.
Date: Sun, 23 Jun 2019 10:51:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906231045280.13854@viisi.sifive.com>
References: <20190617185920.29581-1-atish.patra@wdc.com>
 <20190617185920.29581-4-atish.patra@wdc.com>
 <20190619173801.GB20916@kroah.com>
 <91559562f2958fa904b53e621e596d6216efa9fb.camel@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <91559562f2958fa904b53e621e596d6216efa9fb.camel@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "rafael@kernel.org" <rafael@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "palmer@sifive.com" <palmer@sifive.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "morten.rasmussen@arm.com" <morten.rasmussen@arm.com>, "jhugo@codeaurora.org" <jhugo@codeaurora.org>, "anup@brainfault.org" <anup@brainfault.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "mingo@kernel.org" <mingo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "robh+dt@kernel.org" <robh+dt@kern>
List-Id: devicetree@vger.kernel.org

Hi Atish, Russell,

On Fri, 21 Jun 2019, Atish Patra wrote:

> On Wed, 2019-06-19 at 19:38 +0200, Greg Kroah-Hartman wrote:
> > On Mon, Jun 17, 2019 at 11:59:16AM -0700, Atish Patra wrote:
> > > Both RISC-V & ARM64 are using cpu-map device tree to describe
> > > their cpu topology. It's better to move the relevant code to
> > > a common place instead of duplicate code.

[ ... ]

> I guess Greg has acked the series assuming that it will go through some
> other tree. Can you take it through RISC-V tree ?
> 
> Sorry for the confusion.
> 
> Note: We are still waiting for RMK's ACK on arm patch before it can be
> sent as a PR.

I'm fine to take it through the RISC-V tree, once Russell acks the 
arch/arm patch.


- Paul
