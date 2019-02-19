From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Tue, 19 Feb 2019 09:56:51 -0800
Message-ID: <20190219175651.GN15711@atomide.com>
References: <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
 <20190214174612.GF5720@atomide.com>
 <171e8597-2156-747d-d024-7b4bfc6f9186@ti.com>
 <20190215161629.GK5720@atomide.com>
 <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
 <20190218143245.GC15711@atomide.com>
 <84b3ec21-9ce9-b9a8-80a9-75001db43a90@ti.com>
 <20190219153537.GJ15711@atomide.com>
 <6aa37276-0833-fdf5-575b-c3ca14f776a6@ti.com>
 <20190219171104.GM15711@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219171104.GM15711@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, Peter Ujfalusi <peter.ujfalusi@ti.com>, marc.zyngier@arm.com, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190219 17:11]:
> * Lokesh Vutla <lokeshvutla@ti.com> [190219 16:19]:
> > yes. How different is this from any of the above mentioned drivers using
> > firmware specific ids. Like sci pm domain[1] driver utilizes the same
> > device id for enabling any device in the system. Similarly clock
> > driver[2] uses the same device ids and clock ids specified by firmware.
> > There are more which similarly represents firmware ids from DT.
> > 
> > [1] Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
> > [2] Documentation/devicetree/bindings/clock/ti,sci-clk.txt
> 
> That's horrible. We really must not use any firmware invented
> numbers in the device as they do not describe hardware.

No firmware invented numbers in the device tree I mean naturally.
Drivers do whatever they need to do to deal with the firmware.

Regards,

Tony
