Return-Path: <SRS0=dP36=WL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57858 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfHOECz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Aug 2019 00:02:55 -0400
Date: Wed, 14 Aug 2019 21:02:48 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/6] Configure sgx interconnect data for some omap
 variants
Message-ID: <20190815040248.GF52127@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
 <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7x+p5+XoRHJP--mZ0QcP0FzpYK+pRj7d8Y-js6a8z=p_7A@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, Filip =?utf-8?Q?Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, Philipp Rossak <embed3d@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-clk <linux-clk@vger.kernel.org>, moaz korena <moaz@korena.xyz>
List-ID: <devicetree@vger.kernel.org>

* Adam Ford <aford173@gmail.com> [190814 19:14]:
> echo on > /sys/bus/platform/devices/5000fe00.target-module/power/control
> # devmem 0x5000fe00 32
> 0x40000000
> 
> and
> 
> echo auto > /sys/bus/platform/devices/5000fe00.target-module/power/control
> # devmem 0x5000fe00 32
> [  776.373504] 8<--- cut here ---
> [  776.376617] Unhandled fault: external abort on non-linefetch (0x1018) at 0xb6
> f76e00
> [  776.384338] pgd = bde98bb0
> [  776.387054] [b6f76e00] *pgd=8cb61831, *pte=5000f383, *ppte=5000fa33
> [  776.393402] In-band Error seen by MPU  at address 0
> 
> Then
> 
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

Thanks for testing, yes that's all there is to it for the SoC glue in
this case. The child device driver(s) can be just generic sgx driver(s)
that just do pm_runtime_get_sync() to access the registers and that
enables the parent interconnect target module as needed.

> I do wonder if an omap34xx or omap36xx should use
> compatible = "ti,sysc-omap4", "ti,sysc";
> 
> should it use an omap3 equivalent?

We named the old hwmod type1 as ti,sysc-omap2, type2 as ti,sysc-omap4,
and type3 as ti,sysc-omap4-simple based on where we thought they
appeared. Based on the sysconfig register bit layout, sgx on omap36xx
seems to have a subset of ti,sysc-omap4 and we can recycle it. If we
used a wrong type, the module would not get enabled or disabled as
the register bits would not match.

How about let's add a comment like:

Yes sg has a subset of ti,sysc-omap4 type sysconfig register

Regards,

Tony
