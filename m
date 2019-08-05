Return-Path: <SRS0=+XKd=WB=gimpelevich.san-francisco.ca.us=daniel@kernel.org>
Message-ID: <1565026743.10475.24.camel@chimera>
Subject: Re: [PATCH v2] of/fdt: implement a "merge-cmdline" property
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Date: Mon, 05 Aug 2019 10:39:03 -0700
In-Reply-To: <CAL_JsqLobsATYbKR0Rx8kpS3i+hHqsqibYn9h5Xi1T=DVwRF1g@mail.gmail.com>
References: 
	<1565020400-25679-1-git-send-email-daniel@gimpelevich.san-francisco.ca.us>
	 <CAL_JsqLobsATYbKR0Rx8kpS3i+hHqsqibYn9h5Xi1T=DVwRF1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Paul Burton <paul.burton@mips.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, 2019-08-05 at 10:29 -0600, Rob Herring wrote:
> On Mon, Aug 5, 2019 at 9:53 AM Daniel Gimpelevich
> <daniel@gimpelevich.san-francisco.ca.us> wrote:
> >
> > Currently, "bootargs" supplied via the "chosen" node can be used only to
> > supply a kernel command line as a whole. No mechanism exists in DT to add
> > bootargs to the existing command line instead. This is needed in order to
> > avoid having to update the bootloader or default bootloader config when
> > upgrading to a DTB and kernel pair that requires bootargs not previously
> > needed.
> 
> The DTB and kernel are not a pair. Or at least they shouldn't be. If
> anything, the bootloader and DTB are a pair as those are the h/w
> specific parts. If the DTB and kernel are a pair, then anything you
> want to put into DTB can just be in the kernel.

They would only be a pair in the sense that DTB changes using newer
bindings would also require a newer kernel.

> There's been some
> attempts to rework the command line handling to be common and support
> prepending and appending which could be useful here.

Sounds good. Can you reference any commit hash for this?

> > One example use case is that OpenWrt currently supports four ARM devices by
> > means of locally applying the previously rejected edition of this patch. So
> > far, the patch has been used in production only on ARM, but architecture is
> > not a distinction in the design.
> 
> Other distros support dozens of boards, so why haven't they ever
> needed such a change?

IMHO, each of those four boards could be supported in some other way.
That said, some other devices have bootloaders implementing dual boot
with fallback on failure, and the kernel should always have access to
any bootarg that reflects which one is being booted.

> > On MIPS, Commit 951d223 ("MIPS: Fix CONFIG_CMDLINE handling") currently
> > prevents support of such a mechanism, so I am including a workaround, in
> > anticipation of upcoming changes.
> 
> Like I said on irc, mixing this with the mess that is MIPS
> bootloader-kernel interface generally and command line handling
> specifically is not a path to upstream.

The DT proposal can be separated from the MIPS mess.

> This is worse than the original proposal because 'merge' is not clear
> what it does compared to 'append' and how does 'cmdline' relate to
> 'bootargs'.

Can there be a different property name that would be better instead of
worse?
