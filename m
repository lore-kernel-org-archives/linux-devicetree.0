From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 06/10] irqchip: ti-sci-intr: Add support for Interrupt
 Router driver
Date: Tue, 19 Mar 2019 18:14:27 +0530
Message-ID: <799cd61d-e73b-d979-f5e0-9f4ce1de7d03@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-7-lokeshvutla@ti.com>
 <20190218155217.5195f118@why.wild-wind.fr.eu.org>
 <1c2f2610-2be4-c145-4786-eabf3a07bc47@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1c2f2610-2be4-c145-4786-eabf3a07bc47@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

[..snip..]

> 
>> suggested to investigate the x86 two phase allocation mechanism for the
>> INTA driver.
> 
> Sorry, Ill try to explore this path. Any pointers to the doc/code will be really
> helpful :)

I have been trying hard to get some information on this for past few days but I
can't find anything in kernel. Can you point me to some doc/code for the x86 two
phase allocation of irqs?

Thanks and regards,
Lokesh
