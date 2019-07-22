From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Date: Mon, 22 Jul 2019 10:43:18 +0900
Message-ID: <CAK7LNAT2p8LjMJMAM9WMZymUXPVyDXDtXL094WHFhHamhShzEg@mail.gmail.com>
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
 <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com> <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 12:38 AM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> Hi Masahiro,
>
> On Sat, 2019-07-20 at 11:40 +0900, Masahiro Yamada wrote:
> > On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
> > <Eugeniy.Paltsev@synopsys.com> wrote:
> > > As of today we are able to pass custom flags to dtc compiler but not
> > > to dtc preprocessor.
> > > This ability is required for including some board-specific header files.
> > > It allows us to pass defined constants to dts without their duplication
> > > in several places.
> >
> > How to use this option in a useful way?
> >
> > I see a bunch of defined constants under include/dt-bindings/.
> >
> > If you are talking about code duplication across architectures,
> > you can include arm dtsi from arm64 dts, or vice versa.
> > This was made possible by the symbolic links
> > in scripts/dtc/include-prefixes/.
> >
> > Could you please elaborate your issues if you cannot solve them
> > by the current strategy?
> >
>
> Here is the example:
>
> We have several FPGA-based boards (haps_hs, haps_hs_idu,...) which are involved
> in SW and HW automated verification. For some tests we randomize physical memory
> location so we patch 'CONFIG_LINUX_RAM_BASE' kconfig variable and 'memory' node in
> device tree. We want to keep number of patches as less as possible (to avoid
> conflicts on their applying) so we want to avoid duplication and pass
> 'CONFIG_LINUX_RAM_BASE' directly to dts by including it from
> 'include/generated/autoconf.h':
>
> ----------------------------->8------------------------------------
> memory {
>         device_type = "memory";
> -               /* CONFIG_LINUX_RAM_BASE needs to match low mem start */
> -               reg = <0x80000000 0x20000000>;  /* 512 */
> +               reg = <CONFIG_LINUX_RAM_BASE 0x20000000>;      /* 512 */



So, we need the kernel configuration to build DT?

I am scared with this idea.

I believe DT files should be able to be compiled
irrespective of the .config because they are
re-used for other projects.

devicetree-rebasing is a subset of the kernel tree
that collects DT.

If you upstream that patch, this will be broken, at least.

git://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git



-- 
Best Regards
Masahiro Yamada
