From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: irqchip: Introduce TISCI Interrupt
 router bindings
Date: Wed, 20 Feb 2019 11:23:56 +0530
Message-ID: <884a59a0-81e8-738e-9f26-c2b66ec71af1@ti.com>
References: <b4e821b3-f2fb-41d8-eb8c-8f4e8a19f77c@ti.com>
 <20190214174612.GF5720@atomide.com>
 <171e8597-2156-747d-d024-7b4bfc6f9186@ti.com>
 <20190215161629.GK5720@atomide.com>
 <2369739e-3bc8-257a-99e0-db2951c6777d@ti.com>
 <20190218143245.GC15711@atomide.com>
 <84b3ec21-9ce9-b9a8-80a9-75001db43a90@ti.com>
 <20190219153537.GJ15711@atomide.com>
 <6aa37276-0833-fdf5-575b-c3ca14f776a6@ti.com>
 <20190219171104.GM15711@atomide.com> <20190219175651.GN15711@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190219175651.GN15711@atomide.com>
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
To: Tony Lindgren <tony@atomide.com>
Cc: Nishanth Menon <nm@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, jason@lakedaemon.net, marc.zyngier@arm.com, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, tglx@linutronix.de, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On 19/02/19 11:26 PM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [190219 17:11]:
>> * Lokesh Vutla <lokeshvutla@ti.com> [190219 16:19]:
>>> yes. How different is this from any of the above mentioned drivers using
>>> firmware specific ids. Like sci pm domain[1] driver utilizes the same
>>> device id for enabling any device in the system. Similarly clock
>>> driver[2] uses the same device ids and clock ids specified by firmware.
>>> There are more which similarly represents firmware ids from DT.
>>>
>>> [1] Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
>>> [2] Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>>
>> That's horrible. We really must not use any firmware invented
>> numbers in the device as they do not describe hardware.
> 
> No firmware invented numbers in the device tree I mean naturally.
> Drivers do whatever they need to do to deal with the firmware.

Let's look at these similar other examples available inside Linux:

1: ./Documentation/devicetree/bindings/arm/arm,scmi.txt mentions the following:
- #clock-cells : Should be 1. Contains the Clock ID value used by SCMI commands.
- #power-domain-cells : Should be 1. Contains the device or the power
                                        domain ID value used by SCMI commands.

2: Documentation/devicetree/bindings/arm/arm,scpi.txt mentions the following:
- #power-domain-cells : Should be 1. Contains the device or the power
                             domain ID value used by SCPI commands.

3: Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
the firmware specified identifier are defined in the following header files:
	include/dt-bindings/clock/tegra186-clock.h
	include/dt-bindings/power/tegra186-powergate.h
	include/dt-bindings/reset/tegra186-reset.h

4. Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
mentions the following:
"Output clocks are registered based on clock information received
from firmware. Output clocks indexes are mentioned in
include/dt-bindings/clock/xlnx,zynqmp-clk.h."

5. Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt mentions the
following:
 - #power-domain-cells:  Must be 1. Contains the Resource ID used by
                          SCU commands.
                          See detailed Resource ID list from:
                          include/dt-bindings/firmware/imx/rsrc.h
- The clock consumer should specify the desired clock by having the clock
ID in its "clocks" phandle cell.
See the full list of clock IDs from: include/dt-bindings/clock/imx8qxp-clock.

6. Documentation/devicetree/bindings/arm/psci.txt have the following properties:
- cpu_suspend   : Function ID for CPU_SUSPEND operation
- cpu_off       : Function ID for CPU_OFF operation
- cpu_on        : Function ID for CPU_ON operation
- migrate       : Function ID for MIGRATE operation

All the above examples uses the firmware identifiers for devices/clocks or for
other functionalities and use them directly in DT. These are all somewhat
similar to TI sysfw which runs on a micro-controller and tries to abstract
certain functionalities from HLOS. There are many more such examples but I
listed only a few users. The feedback you are providing is not going to work for
any of the above listed firmware interfaces.

Thanks and regards,
Lokesh
