From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Date: Sat, 20 Jul 2019 15:37:40 +0000
Message-ID: <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
 <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
Content-Language: en-US
Content-ID: <FF127F5F7C65E642B19BDE983CF152BA@namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.lkml@markovi.net" <michal.lkml@markovi.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

On Sat, 2019-07-20 at 11:40 +0900, Masahiro Yamada wrote:
> On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> > As of today we are able to pass custom flags to dtc compiler but not
> > to dtc preprocessor.
> > This ability is required for including some board-specific header files.
> > It allows us to pass defined constants to dts without their duplication
> > in several places.
> 
> How to use this option in a useful way?
> 
> I see a bunch of defined constants under include/dt-bindings/.
> 
> If you are talking about code duplication across architectures,
> you can include arm dtsi from arm64 dts, or vice versa.
> This was made possible by the symbolic links
> in scripts/dtc/include-prefixes/.
> 
> Could you please elaborate your issues if you cannot solve them
> by the current strategy?
> 

Here is the example:

We have several FPGA-based boards (haps_hs, haps_hs_idu,...) which are involved
in SW and HW automated verification. For some tests we randomize physical memory
location so we patch 'CONFIG_LINUX_RAM_BASE' kconfig variable and 'memory' node in
device tree. We want to keep number of patches as less as possible (to avoid
conflicts on their applying) so we want to avoid duplication and pass
'CONFIG_LINUX_RAM_BASE' directly to dts by including it from
'include/generated/autoconf.h':

----------------------------->8------------------------------------
memory {
	device_type = "memory";
-		/* CONFIG_LINUX_RAM_BASE needs to match low mem start */
-               reg = <0x80000000 0x20000000>;  /* 512 */
+               reg = <CONFIG_LINUX_RAM_BASE 0x20000000>;      /* 512 */
};
----------------------------->8------------------------------------

This patch allows us to extend the search path of include files to
include 'include/generated/autoconf.h'.

> 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > ---
> >  scripts/Makefile.lib | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index f1f38c8cdc74..f2595a608dce 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -166,6 +166,8 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
> >                  $(addprefix -I,$(DTC_INCLUDE))                          \
> >                  -undef -D__DTS__
> > 
> > +dtc_cpp_flags  += $(DTC_CPP_FLAGS_$(basetarget))
> > +
> >  # Useful for describing the dependency of composite objects
> >  # Usage:
> >  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> > --
> > 2.21.0
> > 
> 
> 
-- 
 Eugeniy Paltsev
