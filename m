From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 09/10] irqchip: ti-sci-inta: Add support for Interrupt
 Aggregator driver
Date: Thu, 1 Nov 2018 09:55:12 +0200
Message-ID: <49029695-79a0-141b-a9da-9764cb0ed60f@ti.com>
References: <20181018154017.7112-1-lokeshvutla@ti.com>
 <20181018154017.7112-10-lokeshvutla@ti.com>
 <b20127dc-be43-3b00-9960-663738df0069@arm.com>
 <9969f24c-cdb0-1f5c-d0f4-b1c1f587325c@ti.com>
 <86va5ssrfm.wl-marc.zyngier@arm.com>
 <b3a71622-7734-04be-0b0c-38e9dc6542d4@ti.com>
 <63ba5353-8470-b4c1-64a8-a1df5bf48614@ti.com>
 <86va5myz7t.wl-marc.zyngier@arm.com>
 <81136b74-4b45-f44b-0168-23d191a4fb5e@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <81136b74-4b45-f44b-0168-23d191a4fb5e@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, jason@lakedaemon.net, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Lokesh,

On 10/29/18 3:04 PM, Lokesh Vutla wrote:
>>> With the above information, linux should send a message to
>>> system-controller using TISCI protocol. After policing the given
>>> information, system-controller does the following:
>>> - Attaches the interrupt(INTA input) to the device resource index
>>> - Muxes the interrupt(INTA input) to corresponding vint(INTA output)
>>> - Muxes the vint(INTR input) to GIC irq(INTR output).
>>
>> Isn't there a 1:1 mapping between *used* INTR inputs and outputs?
>> Since INTR is a router, there is no real muxing. I assume that the
>> third point above is just a copy-paste error.
> 
> Right, my bad. INTR is just a router and no read muxing.

INTR can mux M interrupt inputs to N interrupt outputs.
One selects which interrupt input is outputted on the given interrupt
output.
It is perfectly valid (but not sane) to select the same interrupt input
to be routed to _all_ interrupt output for example.

Not sure if we are going to use this for anything but 1:1 mapping, but
might worth keeping in mind...


- Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
