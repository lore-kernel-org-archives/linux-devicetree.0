From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC/PATCH 1/2] doc: bindings: Add bindings documentation for
 mtd otp nvmem
Date: Fri, 27 May 2016 15:26:13 +0200
Message-ID: <20160527152613.2672c0f8@bbrezillon>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
	<1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
	<20160526100406.783c6f2d@bbrezillon>
	<CAAtXAHdxPy5mMjA+9tqjWDYqgpHcycohJHaESwqSE8xd6L4FrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHdxPy5mMjA+9tqjWDYqgpHcycohJHaESwqSE8xd6L4FrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, Rob Herring <robh+dt@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Devicetree List <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Moritz,

On Thu, 26 May 2016 10:28:48 -0700
Moritz Fischer <moritz.fischer@ettus.com> wrote:

> Hi Boris,
> 
> On Thu, May 26, 2016 at 1:04 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> 
> > I think the MTD partition -> nvmem connection could benefit to non-OTP
> > partitions too.  
> 
> Yeah, I thought about that, too. Would you use the _read, and _write
> callbacks in that case?

Yep, this means you'll need a flag to decide what kind of partition is
exposed (OTP or normal), and then adjust the partition
->_read()/->_write() implementations.

Actually, I'm not sure what will happen if you really expose OTP
partitions, since these ones shouldn't implement norma
->_read()/_write(), or they should wrap those calls around their
master ->_read/write_prot_xx().
I must admit I haven't looked at patch 2 yet, so maybe that's what
you're doing.

> 
> > So, how about defining the nvmem regions under the partition nodes,
> > like that:
> >
> > flash@0 {
> >         partitions {
> >                 compatible = "fixed-partitions";
> >                 #address-cells = <1>;
> >                 #size-cells = <1>;
> >
> >                 partition@0 {
> >                         label = "uboot-spl";
> >                         reg = <0x0 0xe0000>;
> >                 };
> >
> >                 /* ... */
> >
> >                 partition@X{
> >                         label = "factory-data-part";
> >                         reg = <0x200000 0x100000>;
> >                         #address-cells = <1>;
> >                         #size-cells = <1>;
> >
> >                         product: nvmem@0 {
> >                                 reg = <0x0 0x2>;
> >                         };
> >
> >                         revision: nvmem@3 {
> >                                 reg = <0x3 0x2>;
> >                         };
> >                 };
> >         };
> >
> >         otp-partitions {
> >                 compatible = "fixed-partitions";
> >                 #address-cells = <1>;
> >                 #size-cells = <1>;
> >
> >                 partition@X{
> >                         label = "factory-data-part";
> >                         reg = <0x0 0x40>;
> >                         #address-cells = <1>;
> >                         #size-cells = <1>;
> >
> >                         product: nvmem@0 {
> >                                 reg = <0x0 0x2>;
> >                         };
> >
> >                         revision: nvmem@3 {
> >                                 reg = <0x3 0x2>;
> >                         };
> >                 };
> >         };
> > };
> >
> > I know this requires changing the implementation to select the
> > appropriate nvmem wrapper to use depending on whether we're interfacing
> > with an OTP area or a regular one, but that should be doable.  
> 
> The implementation still needs work anyways, so I might as well add
> this to my list ...
> Would you do the nvmem mapping always, or conditionalize on a flag in
> the dt node like 'nvmem-export'?

Well, I asked myself the same question when I proposed the binding. You
actually don't need the property since you can detect the presence of
the #address/size-cells properties or the presence of child nodes, but
maybe it's safer to make it dependent on an extra property (or use
compatible = "mtd-to-nvmem").
I honestly don't know what's the best solution. Rob, any suggestion?

Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
