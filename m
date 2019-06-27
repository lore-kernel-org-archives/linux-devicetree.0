From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [RFC PATCH 00/11] tracing: of: Boot time tracing using
 devicetree
Date: Thu, 27 Jun 2019 19:58:17 +0900
Message-ID: <20190627195817.211ab4bea422f37e539e47e8@kernel.org>
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
        <CAL_JsqJOc+tkFEGcc+KN0RE8Xjg_i9icPWZ37Ynk_9sR2X1Uwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJOc+tkFEGcc+KN0RE8Xjg_i9icPWZ37Ynk_9sR2X1Uwg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Frank Rowand <frowand.list@gmail.com>, Tom Zanussi <tom.zanussi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, 26 Jun 2019 15:58:50 -0600
Rob Herring <robh+dt@kernel.org> wrote:

> On Fri, Jun 21, 2019 at 10:18 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
> >
> > Hi,
> >
> > Here is an RFC series of patches to add boot-time tracing using
> > devicetree.
> >
> > Currently, kernel support boot-time tracing using kernel command-line
> > parameters. But that is very limited because of limited expressions
> > and limited length of command line. Recently, useful features like
> > histogram, synthetic events, etc. are being added to ftrace, but it is
> > clear that we can not expand command-line options to support these
> > features.
> >
> > Hoever, I've found that there is a devicetree which can pass more
> > structured commands to kernel at boot time :) The devicetree is usually
> > used for dscribing hardware configuration, but I think we can expand it
> > for software configuration too (e.g. AOSP and OPTEE already introduced
> > firmware node.) Also, grub and qemu already supports loading devicetree,
> > so we can use it not only on embedded devices but also on x86 PC too.
> 
> Do the x86 versions of grub, qemu, EFI, any other bootloader actually
> enable DT support? I didn't think so. Certainly, an x86 kernel doesn't
> normally (other than OLPC and ce4100) have a defined way to even pass
> a dtb from the bootloader to the kernel and the kernel doesn't
> unflatten the dtb.

Sorry, the grub part, I just found this entry. I need to check this
can work on x86 too.

https://www.gnu.org/software/grub/manual/grub/html_node/devicetree.html

Anyway, I've tested this series on qemu-x86 with --dtb option.
The kernel boot with ACPI and DT (hardware drivers seem initialized
by ACPI), and it seems unflatten the dtb correctly.

> 
> For arm64, the bootloader to kernel interface is DT even for ACPI
> based systems. So unlike Frank, I'm not completely against DT being
> the interface, but it's hardly universal across architectures and
> something like this should be. Neither making DT the universal kernel
> boot interface nor creating some new channel as Frank suggested seems
> like an easy task.

I don't want it making this for all architectures but an option for
architecutres which supports DT already...

Thank you,


> 
> Rob


-- 
Masami Hiramatsu <mhiramat@kernel.org>
