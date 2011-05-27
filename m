From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH v4 3/6] MIPS: Octeon: Add device tree source files.
Date: Fri, 27 May 2011 10:00:02 -0700
Message-ID: <4DDFD892.1040309@caviumnetworks.com>
References: <1305930343-31259-1-git-send-email-ddaney@caviumnetworks.com>
	<1305930343-31259-4-git-send-email-ddaney@caviumnetworks.com>
	<20110527015618.GC5032@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110527015618.GC5032-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/26/2011 06:56 PM, Grant Likely wrote:
> On Fri, May 20, 2011 at 03:25:40PM -0700, David Daney wrote:
>> Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>   .../devicetree/bindings/mips/cavium/bootbus.txt    |   37 ++
>>   .../devicetree/bindings/mips/cavium/ciu.txt        |   26 ++
>>   .../devicetree/bindings/mips/cavium/gpio.txt       |   48 +++
>>   .../devicetree/bindings/mips/cavium/mdio.txt       |   27 ++
>>   .../devicetree/bindings/mips/cavium/mix.txt        |   40 ++
>>   .../devicetree/bindings/mips/cavium/pip.txt        |   98 +++++
>>   .../devicetree/bindings/mips/cavium/twsi.txt       |   34 ++
>>   .../devicetree/bindings/mips/cavium/uart.txt       |   19 +
>>   .../devicetree/bindings/mips/cavium/uctl.txt       |   47 +++
>>   arch/mips/cavium-octeon/.gitignore                 |    2 +
>>   arch/mips/cavium-octeon/Makefile                   |   13 +
>>   arch/mips/cavium-octeon/octeon_3xxx.dts            |  375 ++++++++++++++++++++
>>   12 files changed, 766 insertions(+), 0 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/bootbus.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/ciu.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/gpio.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/mdio.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/mix.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/pip.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/twsi.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/uart.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/cavium/uctl.txt
>>   create mode 100644 arch/mips/cavium-octeon/.gitignore
>>   create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
>
> Looks pretty good to me.  A few comments below, but I'm okay with this
> one being picked up (Ralf, or if you prefer then I can merge it via my
> tree) as long as you follow it up with a fixup patch.

This was only an RFC.  The whole patch set needs at least one more 
revision to synchronize it with my boards' u-boot changes.

I will post another set soon, and perhaps that can go via Ralf's tree.

[...]
>> +++ b/Documentation/devicetree/bindings/mips/cavium/ciu.txt
>> @@ -0,0 +1,26 @@
>> +* Central Interrupt Unit
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-ciu"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn63XX SOCs.
>> +
>> +- interrupt-controller:  This is an interrupt controller.
>> +
>> +- reg: The base address of the CIU's register bank.
>> +
>> +- #interrupt-cells: Must be<2>.  The first cell is the bank within
>> +   the CIU and may have a value of 0 or 1.  The second cell is the bit
>> +   within the bank and may have a value between 0 and 63.
>> +
>> +Example:
>> +	interrupt-controller@1070000000000 {
>> +		compatible = "cavium,octeon-3860-ciu";
>> +		interrupt-controller;
>> +		/* Interrupts are specified by two parts:
>> +		 * 1) Controller register (0 or 1)
>> +		 * 2) Bit within the register (0..63)
>> +		 */
>
> Are there any configuration parameters for these irq inputs?  Edge vs.
> Level? Active high or active low?  If so, then you'll probably want to
> have a flags cell.

No.  They are all internal to the SOC and cannot be changed.  The chip 
IRQ code knows how to deal with them.

>
> Also, how are the irqs typically documented in the hardware reference
> manual?  Are they documented a irqs 0-63 in bank 1 and 0-63 in bank 2?

Yes, they are clearly documented as two banks.

> Or are is a flat 0-127 number range?  If it is the later, then you may
> want to consider just using a single cell to specify the irq number,
> and handle the bank calculation in the irq driver.
>
>> +		#interrupt-cells =<2>;
>> +		reg =<0x10700 0x00000000 0x0 0x7000>;
>> +	};
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/gpio.txt b/Documentation/devicetree/bindings/mips/cavium/gpio.txt
>> new file mode 100644
>> index 0000000..72853d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/gpio.txt
>> @@ -0,0 +1,48 @@
>> +* General Purpose Input Output (GPIO) bus.
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-gpio"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
>> +
>> +- reg: The base address of the GPIO unit's register bank.
>> +
>> +- gpio-controller: This is a GPIO controller.
>> +
>> +- #gpio-cells: Must be<2>.  The first cell is the GPIO pin.
>> +
>> +- interrupt-controller: The GPIO controller is also an interrupt
>> +  controller, any of its pins may be configured as an interrupt
>> +  source.
>> +
>> +- #interrupt-cells: Must be<2>.  The first cell is the GPIO pin
>> +   connected to the interrupt source.  The second cell is the interrupt
>> +   triggering protocol and may have one of four values:
>> +   0 - level triggered active high.
>> +   1 - level triggered active low
>> +   2 - edge triggered on the rising edge.
>> +   3 - edge triggered on the falling edge.
>
> Since you're choosing arbitrary values here anyway, it's convenient to
> follow the lead of include/linux/irq.h and using 1->edge rising,
> 2->edge falling, 4->level high, 8->level low.  In the past every irq
> controller kind of did it's own thing, but that's not very scalable.
>

OK.  I will use those still somewhat arbitrary values instead.


[...]

Thanks,
David Daney
