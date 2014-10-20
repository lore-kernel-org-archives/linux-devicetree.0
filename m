From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add extern prototype for early_init_dt_scan_chosen_serial()
Date: Mon, 20 Oct 2014 08:59:40 -0700
Message-ID: <CAJiQ=7BXsQnqigi96OeSxQd7is94xErJrbX0tZqwS8XuYDuExw@mail.gmail.com>
References: <1413706294-12578-1-git-send-email-cernekee@gmail.com> <CAL_JsqKzWfwMRheB0qGhcHFkj9zku2uevX7GF+=U4Qhd9m3VYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKzWfwMRheB0qGhcHFkj9zku2uevX7GF+=U4Qhd9m3VYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 20, 2014 at 2:22 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Oct 19, 2014 at 4:11 PM, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> The original commit that introduced this function (fb11ffe74c794a)
>> indicated that calling it from the architecture code was one possible
>> use case.  Let's declare it in of_fdt.h to make it a public API.
>
> Who is the user for this?

bcm3384 on MIPS, a new target under development.

There are three objectives here:

1) Use the new DT-based earlycon code instead of the old MIPS
EARLY_PRINTK code.  This lets us read the MMIO addresses straight out
of DT instead of hardcoding them.

2) Start earlycon as soon as possible, so if there are errors during
the boot sequence, the user will see some output that helps diagnose
problems.  The MIPS code was ideal as it started printing output
before memory setup or command line parsing.

3) Enable earlycon by default without forcing everyone to tweak their
command lines.  On this system the command line is supplied by another
OS on another CPU, and requiring "earlycon" to be added is
problematic.  The original MIPS EARLY_PRINTK code could be enabled
unconditionally.

> Despite what I said, there would be issues calling this from arch
> code. Doing so would result in 2 calls to this function as the
> early_param call is not disabled.

Good point - it looks like this case will need to be covered in either
scenario (called from early_param() or called from arch code).  If I
add "earlycon earlycon" to the command line, it yields a scary
warning:

bootconsole [uart0] enabled
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/printk/printk.c:2391
register_console+0x244/0x3fc()
console 'uart0' already registered
CPU: 0 PID: 0 Comm: swapper Not tainted 3.17.0+ #97
Stack : 00000000 00000004 80bb0000 80bb0000 00000000 00000000 00000000 00000000
      80b94e12 00000033 00000000 00000000 00010000 80511308 804cff8c 80510f67
      00000000 00000000 80b938d8 80511308 804cebd4 43f42d13 99808621 80445bd4
      80510000 80032574 00000000 00000000 804d4214 804ffc84 804ffc84 804cff8c
      00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
      ...
Call Trace:
[<80019f8c>] show_stack+0x64/0x7c
[<80447a5c>] dump_stack+0xc8/0xfc
[<800327c8>] warn_slowpath_common+0x7c/0xac
[<80032858>] warn_slowpath_fmt+0x2c/0x38
[<80076244>] register_console+0x244/0x3fc
[<8053a7e4>] of_setup_earlycon+0x74/0x98
[<8053d07c>] early_init_dt_scan_chosen_serial+0x110/0x140
[<805281a0>] do_early_param+0xc4/0x13c
[<8004ecc0>] parse_args+0x284/0x444
[<805286cc>] parse_early_options+0x34/0x40
[<80528714>] parse_early_param+0x3c/0x58
[<8052b7b0>] setup_arch+0xec/0x6ac
[<805287d4>] start_kernel+0x94/0x458

---[ end trace dc8fa200cb88537f ]---

I'll send a patch to fix this.

> This could be fixed, but really we
> want an arch to implement one of the other options.

We do have a functioning ioremap when early params are parsed.  But
this doesn't solve objective #3, which is what I was trying to
accomplish by calling early_init_dt_scan_chosen_serial() from the arch
code.

In lieu of my original solution, I can send a patch to add a
CONFIG_EARLYCON_FORCE option to unconditionally call
early_init_dt_scan_chosen_serial() from early_init_dt_scan(), if that
makes sense.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
