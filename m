From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [RFC/PATCH 1/2] doc: bindings: Add bindings documentation for mtd
 otp nvmem
Date: Thu, 26 May 2016 10:28:48 -0700
Message-ID: <CAAtXAHdxPy5mMjA+9tqjWDYqgpHcycohJHaESwqSE8xd6L4FrQ@mail.gmail.com>
References: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
	<1464211607-8843-2-git-send-email-moritz.fischer@ettus.com>
	<20160526100406.783c6f2d@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160526100406.783c6f2d@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Devicetree List <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Thu, May 26, 2016 at 1:04 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

> I think the MTD partition -> nvmem connection could benefit to non-OTP
> partitions too.

Yeah, I thought about that, too. Would you use the _read, and _write
callbacks in that case?

> So, how about defining the nvmem regions under the partition nodes,
> like that:
>
> flash@0 {
>         partitions {
>                 compatible = "fixed-partitions";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
>                 partition@0 {
>                         label = "uboot-spl";
>                         reg = <0x0 0xe0000>;
>                 };
>
>                 /* ... */
>
>                 partition@X{
>                         label = "factory-data-part";
>                         reg = <0x200000 0x100000>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>
>                         product: nvmem@0 {
>                                 reg = <0x0 0x2>;
>                         };
>
>                         revision: nvmem@3 {
>                                 reg = <0x3 0x2>;
>                         };
>                 };
>         };
>
>         otp-partitions {
>                 compatible = "fixed-partitions";
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>
>                 partition@X{
>                         label = "factory-data-part";
>                         reg = <0x0 0x40>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>
>                         product: nvmem@0 {
>                                 reg = <0x0 0x2>;
>                         };
>
>                         revision: nvmem@3 {
>                                 reg = <0x3 0x2>;
>                         };
>                 };
>         };
> };
>
> I know this requires changing the implementation to select the
> appropriate nvmem wrapper to use depending on whether we're interfacing
> with an OTP area or a regular one, but that should be doable.

The implementation still needs work anyways, so I might as well add
this to my list ...
Would you do the nvmem mapping always, or conditionalize on a flag in
the dt node like 'nvmem-export'?

Thanks for the feedback,

Moritz
