From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Thu, 14 Feb 2019 07:42:59 -0800
Message-ID: <20190214154259.GC5720@atomide.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
 <20190212074237.2875-6-lokeshvutla@ti.com>
 <20190212163018.GL5720@atomide.com>
 <5b5d86b9-2aa7-718c-c1da-70bbf9bf589e@ti.com>
 <20190213153215.GT5720@atomide.com>
 <821ab540-469a-2166-9346-9cc0dec8ffbe@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <821ab540-469a-2166-9346-9cc0dec8ffbe@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [190214 08:40]:
> On 13/02/19 9:02 PM, Tony Lindgren wrote:
> > OK so maybe update the description along those lines saying it's
> > a shared piece of hardware between various independent SoC
> > clusters which may or may not be running Linux.
> 
> IMHO, SoC integration is out of scope of this document. If you insist I can add
> the details.

Certainly you need to justify how come such a critical piece
of information as interrupt line routing is out of control
of Linux here.

Regards,

Tony
