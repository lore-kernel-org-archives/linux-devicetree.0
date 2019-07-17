From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [RFC PATCH 00/11] tracing: of: Boot time tracing using
 devicetree
Date: Wed, 17 Jul 2019 09:57:36 +0900
Message-ID: <20190717095736.c53f0368034a11332346d18e@kernel.org>
References: <156113387975.28344.16009584175308192243.stgit@devnote2>
        <f0cee7b6-b83b-b74c-82f5-f43e39bd391a@gmail.com>
        <20190624115223.db1e53549a15c6548bfa1fa1@kernel.org>
        <e5e3f55b-095b-e6fc-8734-d888ba5c87f3@gmail.com>
        <20190625140004.a74443238596b297a558a66f@kernel.org>
        <c01bd567-0c8b-ec32-773b-fb95bfcdcd50@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c01bd567-0c8b-ec32-773b-fb95bfcdcd50@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh+dt@kernel.org>, Tom Zanussi <tom.zanussi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Mon, 15 Jul 2019 06:55:40 -0700
Frank Rowand <frowand.list@gmail.com> wrote:

> > Hmm, it's a kind of communication with the operator of the boot loader, since there
> > is an admin or developer behind it. I think the comminication is to communicate
> > with that human. Then if they intend to trace boot process, that is a kind of
> > communication.
> 
> The quote from the plumbers 2016 devicetree etherpad ("Operating points are OK ...)
> conveniently ignores a sentence just a few lines later:
> 
>    "If firmware is deciding the operating point, then it's OK to convey it via DT."
> 
> The operating points example is clearly communicating boot loader information to
> the kernel.
> 
> Something the admin or developer wants to communicate is not boot loader
> information.

But the cmdline (bootargs) is already supported, I think this is a kind of bootargs.

> > [...]
> >>>>> - Can we use devicetree for configuring kernel dynamically?
> >>>>
> >>>> No.  Sorry.
> >>>>
> >>>> My understanding of this proposal is that it is intended to better
> >>>> support boot time kernel and driver debugging.  As an alternate
> >>>> implementation, could you compile the ftrace configuration information
> >>>> directly into a kernel data structure?  It seems like it would not be
> >>>> very difficult to populate the data structure data via a few macros.
> >>>
> >>> No, that is not what I intended. My intention was to trace boot up
> >>> process "without recompiling kernel", but with a structured data.
> >>
> >> That is debugging.  Or if you want to be pedantic, a complex performance
> >> measurement of the boot process (more than holding a stopwatch in your
> >> hand).
> > 
> > Yeah, that's right.
> > 
> >> Recompiling a single object file (containing the ftrace command data)
> >> and re-linking the kernel is not a big price in that context).
> > 
> > No, if I can use DT, I can choose one of them while boot up.
> > That will be a big difference.
> > (Of course for that purpose, I should work on boot loader to support
> > DT overlay)
> 
> This is debugging kernel drivers.  I do not think that it is a big cost for
> a kernel developer to re-link the kernel.  On any reasonable modern
> development system this should be a matter of seconds, not minutes.

Tracing is not only debugging the kernel drivers, but also measures
performance or behavior and compare with different settings.
Also, in some case, we can not change the binary, like distro kernel.

> Compiling a devicetree source is not significantly less time.  (To be
> fair, you imply that you would have various compiled devicetrees to
> choose from at boot time.  It may be realistic to have a library of
> ftrace commands, or it may be more realistic that someone debugging
> a kernel driver will create a unique ftrace command set for the
> particular case they are debugging.)

Yeah, devicetree build time may not be matter, decoupling from the
kernel image is, I think, the key point.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
