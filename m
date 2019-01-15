From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH v4 12/13] irqchip: ti-sci-inta: Add support for
 Interrupt Aggregator driver
Date: Tue, 15 Jan 2019 08:04:51 -0600
Message-ID: <20190115140451.fnmvqm5kcfgt7rh2@kahuna>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
 <20181227061313.5451-12-lokeshvutla@ti.com>
 <9efbb01b-2ef9-13e7-f871-8db2c92844ee@ti.com>
 <50da7038-9b1c-6910-2cf1-78fa98ddc3bd@ti.com>
 <ad43911d-78b2-6ed0-31c2-8361b5f4911f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ad43911d-78b2-6ed0-31c2-8361b5f4911f@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, marc.zyngier@arm.com, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 14:38-20190115, Tero Kristo wrote:
[...]
> 
> The mentioned failure only happens with a specific .config. Not sure what is
> the actual Kconfig that masks the failure though, but anyway it looks like
> interrupt.h gets included via some indirect path with arm64 defconfig making
> it pass.

I am able to reproduce the build fail as well:
.config: -> Notice that all v8 arch other than K3 is disabled, expert
mode is enabled and few ancillary "optimization" of config
	  https://pastebin.ubuntu.com/p/w5t9Wvp2jJ/
Here is what I did:
 git checkout next-20190115
 wget -O inta.mbox https://lore.kernel.org/patchwork/series/377815/mbox/
 git am inta.mbox
 I put the above .config as my .config
 make oldconfig
 make drivers/irqchip/irq-ti-sci-inta.o

I got the exact failure as well..
 https://pastebin.ubuntu.com/p/JzFXGz7Gh9/

I agree with peter than this should be fixed. randconfig would have
caught this anyways.. I did'nt bother looking further in the config to
figure out why the side effect, but glad it got caught early enough.

Thanks Peter.

Lokesh, I know you are out this week, will appreciate if you could post
a v5 once you are back?

-- 
Regards,
Nishanth Menon
