From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: Tracebacks in -next due to 'of: fix of_node leak caused in
 of_find_node_opts_by_path'
Date: Sat, 11 Feb 2017 09:38:37 -0800
Message-ID: <20170211173837.GA25434@roeck-us.net>
References: <20170211012947.GA3102@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170211012947.GA3102-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qi Hou <qi.hou-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 05:29:47PM -0800, Guenter Roeck wrote:
> Hi,
> 
> I see a number of tracebacks in test runs on qemu-next, all related to omap
> configurations.
> 
> Here is an example:
> 
> [    0.000000] OF: ERROR: Bad of_node_put() on /ocp@68000000
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W 4.10.0-rc7-next-20170210 #1
> [    0.000000] Hardware name: Generic OMAP3-GP (Flattened Device Tree)
> [    0.000000] [<c0310604>] (unwind_backtrace) from [<c030bbf4>] (show_stack+0x10/0x14)
> [    0.000000] [<c030bbf4>] (show_stack) from [<c05add8c>] (dump_stack+0x98/0xac)
> [    0.000000] [<c05add8c>] (dump_stack) from [<c05af1b0>] (kobject_release+0x48/0x7c)
> [    0.000000] [<c05af1b0>] (kobject_release) from [<c0ad6138>] (__of_translate_address+0xb0/0x2cc)
> [    0.000000] [<c0ad6138>] (__of_translate_address) from [<c0ad6388>] (__of_address_to_resource+0x28/0xb4)
> [    0.000000] [<c0ad6388>] (__of_address_to_resource) from [<c0ad66f8>] (of_address_to_resource+0x70/0x80)
> [    0.000000] [<c0ad66f8>] (of_address_to_resource) from [<c08485bc>] (of_syscon_register+0x88/0x22c)
> [    0.000000] [<c08485bc>] (of_syscon_register) from [<c08487f0>] (syscon_node_to_regmap+0x90/0x94)
> [    0.000000] [<c08487f0>] (syscon_node_to_regmap) from [<c1210184>] (omap_control_init+0x50/0xd8)
> [    0.000000] [<c1210184>] (omap_control_init) from [<c1210010>] (omap_clk_init+0x3c/0x70)
> [    0.000000] [<c1210010>] (omap_clk_init) from [<c1210a14>] (__omap_sync32k_timer_init+0x20/0x2b4)
> [    0.000000] [<c1210a14>] (__omap_sync32k_timer_init) from [<c1210f24>] (omap3_secure_sync32k_timer_init+0x3c/0x48)
> [    0.000000] [<c1210f24>] (omap3_secure_sync32k_timer_init) from [<c1200b24>] (start_kernel+0x244/0x38c)
> [    0.000000] [<c1200b24>] (start_kernel) from [<8020807c>] (0x8020807c)
> [    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz
> 
> There are several such messages with different call paths.
> 
> A log with all tracebacks is available at
> http://kerneltests.org/builders/qemu-arm-next/builds/627/steps/qemubuildcommand/logs/stdio
> 
> Bisect points to commit 'of: fix of_node leak caused in
> of_find_node_opts_by_path'. Bisect log is attached.
> 
> It is going to be interesting to learn if the patch introduces a problem
> or if it exposes one.
> 
It exposes a problem. omap3xxx_hwmod_is_hs_ip_block_usable() calls
of_find_node_by_name(bus, ...), which releases 'bus'. The function
is called multiple times with the same 'bus' node, meaning 'bus' is
released multiple times.

There are other instances of the same problem, such as in leon_init_timers()
or _qcom_cc_register_board_clk(). I'll see if I can submit some patches.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
