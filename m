MIME-Version: 1.0
Date: Tue, 2 Jul 2019 07:30:57 -0600
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
	<CAL_JsqJOc+tkFEGcc+KN0RE8Xjg_i9icPWZ37Ynk_9sR2X1Uwg@mail.gmail.com>
	<20190627195817.211ab4bea422f37e539e47e8@kernel.org>
	<20190702184730.b0247eb780ffa48d40a61a81@kernel.org>
In-Reply-To: <20190702184730.b0247eb780ffa48d40a61a81@kernel.org>
Message-ID: <CAL_JsqKmfQVOCpg8pg5kpSCMWJmmJPEfSbBn=4FWqvv8geVnEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] tracing: of: Boot time tracing using devicetree
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Frank Rowand <frowand.list@gmail.com>, Tom Zanussi <tom.zanussi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 2, 2019 at 3:47 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hello,
>
> On Thu, 27 Jun 2019 19:58:17 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> > Hi Rob,
> >
> > On Wed, 26 Jun 2019 15:58:50 -0600
> > Rob Herring <robh+dt@kernel.org> wrote:
> >
> > > On Fri, Jun 21, 2019 at 10:18 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > Here is an RFC series of patches to add boot-time tracing using
> > > > devicetree.
> > > >
> > > > Currently, kernel support boot-time tracing using kernel command-line
> > > > parameters. But that is very limited because of limited expressions
> > > > and limited length of command line. Recently, useful features like
> > > > histogram, synthetic events, etc. are being added to ftrace, but it is
> > > > clear that we can not expand command-line options to support these
> > > > features.
> > > >
> > > > Hoever, I've found that there is a devicetree which can pass more
> > > > structured commands to kernel at boot time :) The devicetree is usually
> > > > used for dscribing hardware configuration, but I think we can expand it
> > > > for software configuration too (e.g. AOSP and OPTEE already introduced
> > > > firmware node.) Also, grub and qemu already supports loading devicetree,
> > > > so we can use it not only on embedded devices but also on x86 PC too.
> > >
> > > Do the x86 versions of grub, qemu, EFI, any other bootloader actually
> > > enable DT support? I didn't think so. Certainly, an x86 kernel doesn't
> > > normally (other than OLPC and ce4100) have a defined way to even pass
> > > a dtb from the bootloader to the kernel and the kernel doesn't
> > > unflatten the dtb.
> >
> > Sorry, the grub part, I just found this entry. I need to check this
> > can work on x86 too.
>
> I've confirmed that grub-x86 doesn't support devicetree option. I tried
> to add it, and tested it.
>
> https://github.com/mhiramat/grub/commit/644c35bfd2d18c772cc353b74215344f8264923a
>
> This works if there is ACPI, if it includes /chosen/linux,ftrace node only.
> (Anyway, we don't need other nodes on x86)
>
> At this moment, grub doesn't support DT overlay, so on arm/arm64 user must
> decompile DTB, add linux,ftrace node for tracing and compile it again.
> But if it supports overlay, I think we can give an overlay for tracer setting
> on boot up, that will be handy on arm/arm64 too. :)


>
> Thank you,
>
> --
> Masami Hiramatsu <mhiramat@kernel.org>
