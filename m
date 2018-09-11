From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 2/2] MIPS: Fix CONFIG_CMDLINE handling
Date: Tue, 11 Sep 2018 10:23:38 -0700
Message-ID: <20180911172338.xdqmkmp3brut4ish@pburton-laptop>
References: <20180907185414.2630-1-paul.burton@mips.com>
 <20180907185414.2630-2-paul.burton@mips.com>
 <CA+7wUsx8gmDNh_kYAxx=PUR2gNJFRCLNYq=hZE79jT=yjNrj+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+7wUsx8gmDNh_kYAxx=PUR2gNJFRCLNYq=hZE79jT=yjNrj+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Paul Cercueil <paul@crapouillou.net>, LKML <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Rob Herring <robh+dt@kernel.org>, "# v4 . 11" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Matthieu,

On Mon, Sep 10, 2018 at 02:09:21PM +0200, Mathieu Malaterre wrote:
> On Fri, Sep 7, 2018 at 8:55 PM Paul Burton <paul.burton@mips.com> wrote:
> > Commit 8ce355cf2e38 ("MIPS: Setup boot_command_line before
> > plat_mem_setup") fixed a problem for systems which have
> > CONFIG_CMDLINE_BOOL=y & use a DT with a chosen node that has either no
> > bootargs property or an empty one. In this configuration
> > early_init_dt_scan_chosen() copies CONFIG_CMDLINE into
> > boot_command_line, but the MIPS code doesn't know this so it appends
> > CONFIG_CMDLINE (via builtin_cmdline) to boot_command_line again. The
> > result is that boot_command_line contains the arguments from
> > CONFIG_CMDLINE twice.
> >
> > That commit took the approach of simply setting up boot_command_line
> > from the MIPS code before early_init_dt_scan_chosen() runs, causing it
> > not to copy CONFIG_CMDLINE to boot_command_line if a chosen node with no
> > bootargs property is found.
> >
> > Unfortunately this is problematic for systems which do have a non-empty
> > bootargs property & CONFIG_CMDLINE_BOOL=y. There
> > early_init_dt_scan_chosen() will overwrite boot_command_line with the
> > arguments from DT, which means we lose those from CONFIG_CMDLINE
> > entirely. This breaks CONFIG_MIPS_CMDLINE_DTB_EXTEND. If we have
> > CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER or
> > CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND selected and the DT has a bootargs
> > property which we should ignore, it will instead be honoured breaking
> > those configurations too.
> >
> > Fix this by reverting commit 8ce355cf2e38 ("MIPS: Setup
> > boot_command_line before plat_mem_setup") to restore the former
> > behaviour, and fixing the CONFIG_CMDLINE duplication issue by instead
> > providing a no-op implementation of early_init_dt_fixup_cmdline_arch()
> > to prevent early_init_dt_scan_chosen() from using CONFIG_CMDLINE.
> 
> Sorry I cannot test this patch ATM. I've simply CCed Paul C. just in case.

Thanks - for the record I did test on a Ci20, though I was booting using
my ci20-usb-boot tool which doesn't currently provide a command line to
the kernel. CONFIG_CMDLINE didn't get duplicated though.

I'll get back to a v2 for this & hopefully get it fixed up for 4.19, but
it might take a little while because my son was just born on Saturday :)

Thanks,
    Paul
