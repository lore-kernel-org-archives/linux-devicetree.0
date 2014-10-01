From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Bug in selftest code
Date: Wed, 1 Oct 2014 13:56:07 +0100
Message-ID: <CACxGe6sVyw6ProHihtHTX0n+bnC_vzy2wg6rYx-s-W4RoQ3NAg@mail.gmail.com>
References: <CACxGe6v3beXUfKVWdS3U7NkYM9q+gc=W8iugstfW96OGdG+dpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6v3beXUfKVWdS3U7NkYM9q+gc=W8iugstfW96OGdG+dpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 1, 2014 at 1:53 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Gaurav,
>
> I found a bug in the selftest code today. If you apply this patch:
>
> diff --git a/drivers/of/testcase-data/testcases.dts
> b/drivers/of/testcase-data/testcases.dts
> index 219ef9324e9c..9dd482c02357 100644
> --- a/drivers/of/testcase-data/testcases.dts
> +++ b/drivers/of/testcase-data/testcases.dts
> @@ -8,6 +8,8 @@
>                         };
>                 };
>         };
> +       another-node{
> +       };
>  };
>  #include "tests-phandle.dtsi"
>  #include "tests-interrupts.dtsi"
>
> The I get the following oops on boot. The code doesn't properly handle
> more than one root node to be added. I've not tried to debug it yet.

It's not merely that NO_OF_NODES is only 2 either. Making it larger
still causes the oops.

g.

>
> ### dt-test ### end of selftest - 91 passed, 0 failed
> Unable to handle kernel NULL pointer dereference at virtual address 0000001c
> pgd = c0004000
> [0000001c] *pgd=00000000
> Internal error: Oops: 17 [#1] ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 3.17.0-rc7+ #40
> task: c782bb20 ti: c782c000 task.ti: c782c000
> PC is at detach_node_and_children+0x8/0x4c
> LR is at of_selftest+0x15e8/0x1644
> pc : [<c025bce0>]    lr : [<c042208c>]    psr: 20000013
> sp : c782de78  ip : 00000065  fp : 00000000
> r10: c03a1b90  r9 : c03a1b90  r8 : c032e19c
> r7 : c0471a54  r6 : 00000000  r5 : c714afdc  r4 : 00000000
> r3 : 0000006e  r2 : 0000006c  r1 : c03bdbaf  r0 : 00000000
> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> Control: 00093177  Table: 07114000  DAC: 00000017
> Process swapper (pid: 1, stack limit = 0xc782c1c0)
> Stack: (0xc782de78 to 0xc782e000)
> de60:                                                       00000000 c042208c
> de80: c782de90 c039961e 0000000c c7148000 c7148d80 00000001 0000000f 00000002
> dea0: 0000000c 0000000c c7138c00 c0420aa4 00000000 c782c000 00000000 c01ade54
> dec0: c0471678 c782def0 c0458ce0 c042f4b0 00000007 c04278f0 c0439b38 c0439b38
> dee0: c7138c00 c0458ce0 c0420aa4 00000000 c782c000 c0008aa0 c0448ce0 c039b300
> df00: c045e76c c784e100 c0314000 00000032 00000000 00000000 00000000 c00dc5a8
> df20: 00000000 c784e160 c7ffc9ec c03223c0 0000005e c0034b90 c03ea090 00000007
> df40: c7ffc9fc 00000007 00000000 c042f4b0 00000007 c04278f0 c0458ce0 c0409514
> df60: 0000005e c04278f8 00000000 c0409c90 00000007 00000007 c0409514 00000000
> df80: 00000000 00000000 00000000 c030adbc 00000000 00000000 00000000 00000000
> dfa0: 00000000 c030adc4 00000000 c0013fd0 00000000 00000000 00000000 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [<c025bce0>] (detach_node_and_children) from [<c042208c>]
> (of_selftest+0x15e8/0x1644)
> [<c042208c>] (of_selftest) from [<c0008aa0>] (do_one_initcall+0x80/0x1c8)
> [<c0008aa0>] (do_one_initcall) from [<c0409c90>]
> (kernel_init_freeable+0xec/0x1b4)
> [<c0409c90>] (kernel_init_freeable) from [<c030adc4>] (kernel_init+0x8/0xec)
> [<c030adc4>] (kernel_init) from [<c0013fd0>] (ret_from_fork+0x14/0x24)
> Code: c032dfac c03be438 e92d4010 e1a04000 (e590001c)
> ---[ end trace a8fecae0e53fc1be ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
