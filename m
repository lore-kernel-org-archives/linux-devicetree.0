From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/9] nios2: build .dtb files in dts directory
Date: Fri, 7 Sep 2018 13:09:34 -0500
Message-ID: <CAL_Jsq+ocQEUsm-JBEeMfnkKRSRO3-UrvA7no+c3Cmp44c0OGg@mail.gmail.com>
References: <20180905235327.5996-1-robh@kernel.org> <20180905235327.5996-3-robh@kernel.org>
 <1536286895.6128.4.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536286895.6128.4.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ley.foon.tan@intel.com
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, nios2-dev@lists.rocketboards.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 6, 2018 at 9:21 PM Ley Foon Tan <ley.foon.tan@intel.com> wrote:
>
> On Wed, 2018-09-05 at 18:53 -0500, Rob Herring wrote:
> > Align nios2 with other architectures which build the dtb files in the
> > same directory as the dts files. This is also in line with most other
> > build targets which are located in the same directory as the source.
> > This move will help enable the 'dtbs' target which builds all the
> > dtbs
> > regardless of kernel config.
> >
> > This transition could break some scripts if they expect dtb files in
> > the old location.
> >
> > Cc: Ley Foon Tan <lftan@altera.com>
> > Cc: nios2-dev@lists.rocketboards.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack so I can take the whole series via the DT tree.
> >
> >  arch/nios2/Makefile          | 4 ++--
> >  arch/nios2/boot/Makefile     | 4 ----
> >  arch/nios2/boot/dts/Makefile | 1 +
> >  3 files changed, 3 insertions(+), 6 deletions(-)
> >  create mode 100644 arch/nios2/boot/dts/Makefile
> >
> > diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
> > index 8673a79dca9c..50eece1c6adb 100644
> > --- a/arch/nios2/Makefile
> > +++ b/arch/nios2/Makefile
> > @@ -59,10 +59,10 @@ archclean:
> >         $(Q)$(MAKE) $(clean)=$(nios2-boot)
> >
> >  %.dtb: | scripts
> > -       $(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
> > +       $(Q)$(MAKE) $(build)=$(nios2-boot)/dts $(nios2-boot)/dts/$@
> >
> >  dtbs:
> > -       $(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
> > +       $(Q)$(MAKE) $(build)=$(nios2-boot)/dts
> >
> >  $(BOOT_TARGETS): vmlinux
> >         $(Q)$(MAKE) $(build)=$(nios2-boot) $(nios2-boot)/$@
> > diff --git a/arch/nios2/boot/Makefile b/arch/nios2/boot/Makefile
> > index 2ba23a679732..007586094dde 100644
> > --- a/arch/nios2/boot/Makefile
> > +++ b/arch/nios2/boot/Makefile
> > @@ -47,10 +47,6 @@ obj-$(CONFIG_NIOS2_DTB_SOURCE_BOOL) +=
> > linked_dtb.o
> >
> >  targets += $(dtb-y)
> >
> > -# Rule to build device tree blobs with make command
> > -$(obj)/%.dtb: $(src)/dts/%.dts FORCE
> > -       $(call if_changed_dep,dtc)
> > -
> >  $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
> >
> >  install:
> > diff --git a/arch/nios2/boot/dts/Makefile
> > b/arch/nios2/boot/dts/Makefile
> > new file mode 100644
> > index 000000000000..f66554cd5c45
> > --- /dev/null
> > +++ b/arch/nios2/boot/dts/Makefile
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > --
> > 2.17.1
> >
> Hi Rob
>
> I have synced your all-dtbs branch from here: https://git.kernel.org/pu
> b/scm/linux/kernel/git/robh/linux.git/log/?h=all-dtbs
>
> It shows error when compile kernel image and also when "make
> dtbs_install".

Can you fetch the branch again and try it. I fixed a few dependency issues.

> make dtbs_install
> make[1]: *** No rule to make target
> 'arch/nios2/boot/dts/arch/nios2/boot/dts/10m50_devboard.dtb', needed by
> 'arch/nios2/boot/dts/arch/nios2/boot/dts/10m50_devboard.dtb.S'.  Stop.

What is the value of CONFIG_NIOS2_DTB_SOURCE? As patch 3 notes, it now
should not have any path.

If that's a problem, I could take the basename to strip the path, but
then sub directories wouldn't work either.

BTW, next up, I want to consolidate the config variables for built-in dtbs.

Rob
