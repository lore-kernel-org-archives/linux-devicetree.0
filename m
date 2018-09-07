From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of/fdt: Allow architectures to override
 CONFIG_CMDLINE logic
Date: Fri, 7 Sep 2018 15:29:03 -0500
Message-ID: <CAL_Jsq+n4e5_ptuh89CJibViGS_bgHz0A+Ki-uwtcGU38+mHXQ@mail.gmail.com>
References: <20180907185414.2630-1-paul.burton@mips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907185414.2630-1-paul.burton@mips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Jaedon Shin <jaedon.shin@gmail.com>, Mathieu Malaterre <malat@debian.org>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 7, 2018 at 1:55 PM Paul Burton <paul.burton@mips.com> wrote:
>
> The CONFIG_CMDLINE-related logic in early_init_dt_scan_chosen() falls
> back to copying CONFIG_CMDLINE into boot_command_line/data if the DT has
> a /chosen node but that node has no bootargs property or a bootargs
> property of length zero.

The Risc-V guys found a similar issue if chosen is missing[1]. I
started a patch[2] to address that, but then looking at the different
arches wasn't sure if I'd break something. I don't recall for sure,
but it may have been MIPS that worried me.

> This is problematic for the MIPS architecture because we support
> concatenating arguments from either the DT or the bootloader with those
> from CONFIG_CMDLINE, but the behaviour of early_init_dt_scan_chosen()
> gives us no way of knowing whether boot_command_line contains arguments
> from DT or already contains CONFIG_CMDLINE. This can lead to us
> concatenating CONFIG_CMDLINE with itself, duplicating command line
> arguments which can be problematic (eg. for earlycon which will attempt
> to register the same console twice & warn about it).

If CONFIG_CMDLINE_EXTEND is set, you know it contains CONFIG_CMDLINE.
But I guess part of the problem is MIPS using its own kconfig options.

> Move the CONFIG_CMDLINE-related logic to a weak function that
> architectures can provide their own version of, such that we continue to
> use the existing logic for architectures where it's suitable but also
> allow MIPS to override this behaviour such that the architecture code
> knows when CONFIG_CMDLINE is used.

More arch specific functions is not what I want. Really, all the
cmdline manipulating logic doesn't belong in DT code, but it shouldn't
be in the arch specific code either IMO. Really it should be some
common kernel function which calls into the DT code to retrieve the DT
bootargs and that's it. Then you can skip calling that kernel function
if you really need non-standard handling.

Perhaps you should consider filling DT bootargs with the cmdline from
bootloader. IOW, make the legacy case look like the non-legacy case
early, and then the kernel doesn't have to deal with both cases later
on.

Rob

[1] https://lkml.org/lkml/2018/3/14/701
[2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/cmdline
