From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCHv2 1/4] ARM: dts: add support for building DT
 overlays
Date: Wed, 5 Sep 2018 16:13:23 -0500
Message-ID: <CAL_JsqLKNnYD_hrpiV+34Mwf6xLfQQWZVJE7nuPYDL3ExDPemw@mail.gmail.com>
References: <1535719666-13595-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-1-git-send-email-t-kristo@ti.com>
 <1536048344-9995-2-git-send-email-t-kristo@ti.com>
 <71d48595-f40f-acce-2660-ce1630ffc398@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <71d48595-f40f-acce-2660-ce1630ffc398@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 5, 2018 at 3:36 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> +cc: devicetree-compiler@vger.kernel.org
>
>      For context on the device-tree compiler list, this patch is for
>      the Linux kernel.
>
> On 09/04/18 01:05, Tero Kristo wrote:
> > Add simple support for building DT overlays. This just compiles any
> > given .dtso file under the base arch/arm/boot/dts directory into
> > a .dtbo.
> >
> > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > ---
> >  arch/arm/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index d1516f8..ab555a0 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -339,7 +339,7 @@ $(BOOT_TARGETS): vmlinux
> >  $(INSTALL_TARGETS):
> >       $(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
> >
> > -%.dtb: | scripts
> > +%.dtb %.dtbo: | scripts

This will need to change with my rework of the DT build rules[1].

> >       $(Q)$(MAKE) $(build)=$(boot)/dts MACHINE=$(MACHINE) $(boot)/dts/$@
> >
> >  PHONY += dtbs dtbs_install
> >
>
> The idea of adding knowledge of .dtso and .dtbo files to the dtc
> compiler, but that idea and the related patches have fallen by
> the wayside.
>
> Current overlay sources and blobs are properly handled by dtc when
> they are .dts and .dtb files.
>
> If the dtc compiler is updated with knowledge of .dtso and .dtbo
> then these changes would be needed.  At the moment the distinction
> of a .dtso and .dtbo is a naming convention that provides a clue
> about the intended use of the file.  But dtc does not know these
> file name extensions, requiring a specific flag to tell dtc to
> treat them as .dts or .dtb files.  I think the negative outweighs
> the positive for this patch.

I don't follow what you are proposing. We should decide on a convention though.

We shouldn't need .dtso because that is identified with the /plugin/
tag. Distinguishing overlay dtbs with .dtbo seems like a good idea
though.

Rob

[1] https://lkml.org/lkml/2018/8/21/770
