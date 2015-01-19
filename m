From: Michal Simek <michals@xilinx.com>
Subject: Re: [PATCH 1/2] remoteproc: microblaze: Document device tree bindings
Date: Mon, 19 Jan 2015 12:55:05 +0100
Message-ID: <75f6ce848b694b7bb5912229f5ab9428@BL2FFO11FD019.protection.gbl>
References: <a458462d2dc6901440bded015608f7a9df9e7942.1421662385.git.michal.simek@xilinx.com>
 <20150119110436.GD21553@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150119110436.GD21553@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 01/19/2015 12:04 PM, Mark Rutland wrote:
> On Mon, Jan 19, 2015 at 10:30:19AM +0000, Michal Simek wrote:
>> Add device tree binding documentation for the Microblaze remoteproc
>> on Xilinx Zynq.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>  .../bindings/remoteproc/mb_remoteproc.txt          | 46 ++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
>> new file mode 100644
>> index 000000000000..a2490eac0208
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/mb_remoteproc.txt
>> @@ -0,0 +1,46 @@
>> +Xilinx ARM-Microblaze remoteproc driver
>> +
>> +This driver requires specific Zynq hardware design where Microblaze is added
>> +to the programmable logic.
> 
> The binding should describe the _hardware_, not the particular driver.
> Please remove any references to the 'driver'.
> 
> What hardware does this binding describe? Please focus on that.

It is Xilinx Zynq with Microblaze in programmable logic which is remote cpu
where Linux on Zynq can load software on Microblaze and communicate with it.

> 
>> +Microblaze is connected with PS block via axi bus connected to PS HP port
>> +to ensure access to PS DDR.
>> +Communication channels are done via soft GPIO IP connected to PS block
>> +and to Microblaze. There are also 2 gpio control signals reset and debug
>> +which are used for resetting Microblaze.
>> +
>> +Required properties:
>> +- compatible : Should be "xlnx,mb_remoteproc"
> 
> s/_/-/ in compatible strings please.

no problem.

> 
>> +- reg : Address and length of the ddr address space
>> +- bram: Phandle to bram controller which can access Microblaze BRAM
>> +- bram-firmware : Microblaze BRAM bootloader name
> 
> Huh? What's this aname used for?
> 
> This looks like a filesystem name, which shouldn't be in the DT.

It is firmware name called via firmware interface. It doesn't need to be on filesystem.
What's the way how to describe default firmware?
Or this should be out of binding at all and just setup default firmware in the driver
and add options to change it via module parameters?

> 
>> +- firmware : Default firmware name which can be override by
>> +	     "firmware" module parameter
> 
> Likewise on all points.
> 
>> +- reset : Gpio phandle which reset Microblaze remoteproc
>> +- debug : Gpio phandle which setup Microblaze to debug state
>> +- ipino : Gpio phandle for Microblaze to ARM communication
>> +- vring0 : Gpio phandle for ARM to Microblaze communication vring 0
>> +- vring1 : Gpio phandle for ARM to Microblaze communication vring 1
> 
> s/phandle/ / -- there's a gpio-specifier too, but we may as well just
> ignore the specifics of the format and leave that to the GPIO bindings.
> 
> These should all have a "-gpio" suffix, too.

ok. Will add.

> 
>> +
>> +Microblaze SoC can be also connected to the PS block via a axi bus.
>> +That's why there is the option to allocate interrupts for Microblaze use only.
>> +The driver will allocate interrupts to itself and Microblaze sw has to ensure
>> +that interrupts are properly enabled and handled by Microblaze interrupt
>> +controller.
> 
> I'm not sure I follow? What is this for?

Microblaze cpu soft core is in programmable logic on Zynq. Zynq is Cortex-a9 dual core.
This binding describes how microblaze is added to PL and how Linux on a9 communicates with
it Microblaze. Interrupts from all IPs on the system can be connected to arm gic and also
to Microblaze SoC interrupt controller that's why this driver provides the option to allocate
all shared interrupts and for example count how many times this interrupt was triggered.
The second use is to monitor if interrupts were properly forwarded to correct CPU and
restrict others drivers not to allocate them.

Thanks,
Michal
