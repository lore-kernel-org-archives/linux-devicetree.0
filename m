From: David Daney <david.daney@cavium.com>
Subject: Re: [PATCH v7 3/4] MIPS: Octeon: Add device tree source files.
Date: Tue, 27 Mar 2012 11:45:12 -0700
Message-ID: <4F720AB8.7030508@cavium.com>
References: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com> <1332790281-9648-4-git-send-email-ddaney.cavm@gmail.com> <4F71282D.9060305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F71282D.9060305@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/26/2012 07:38 PM, Rob Herring wrote:
> On 03/26/2012 02:31 PM, David Daney wrote:
>> From: David Daney<david.daney@cavium.com>
[...]
>> +++ b/Documentation/devicetree/bindings/gpio/cavium-octeon-gpio.txt
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
>> +   1 - edge triggered on the rising edge.
>> +   2 - edge triggered on the falling edge
>> +   4 - level triggered active high.
>> +   8 - level triggered active low.
>> +
>> +- interrupts: Interrupt routing for pin 0.  The remaining pins are
>> +  also routed, but in a manner that can be derived from the pin0
>> +  routing, so they are not specified.
>> +
>> +Example:
>> +
>> +	gpio-controller@1070000000800 {
>> +		#gpio-cells =<2>;
>> +		compatible = "cavium,octeon-3860-gpio";
>> +		reg =<0x10700 0x00000800 0x0 0x100>;
>> +		gpio-controller;
>> +		/* Interrupts are specified by two parts:
>> +		 * 1) GPIO pin number (0..15)
>> +		 * 2) Triggering (1 - edge rising
>> +		 *		  2 - edge falling
>> +		 *		  4 - level active high
>> +		 *		  8 - level active low)
>> +		 */
>> +		interrupt-controller;
>> +		#interrupt-cells =<2>;
>> +		/* The GPIO pin connect to 16 consecutive CUI bits */
>> +		interrupts =<0 16>;
>
> I think this should really be:
>
> interrupts =<0 16  0 17  0 18  0 19 ... 0 31>;


Yes, probably it should be, I will try it.  I was having trouble getting 
the dtc to accept it when I originally came up with the binding.  I will 
try again.

[...]
>> diff --git a/Documentation/devicetree/bindings/mips/cavium/bootbus.txt b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
>> new file mode 100644
>> index 0000000..6581478
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/cavium/bootbus.txt
>> @@ -0,0 +1,126 @@
>> +* Boot Bus
>> +
>> +The Octeon Boot Bus is a configurable parallel bus with 8 chip
>> +selects.  Each chip select is independently configurable.
>> +
>> +Properties:
>> +- compatible: "cavium,octeon-3860-bootbus"
>> +
>> +  Compatibility with all cn3XXX, cn5XXX and cn6XXX SOCs.
>> +
>> +- reg: The base address of the Boot Bus' register bank.
>> +
>> +- #address-cells: Must be<2>.  The first cell is the chip select
>> +   within the bootbus.  The second cell is the offset from the chip select.
>> +
>> +- #size-cells: Must be<1>.
>> +
>> +- ranges: There must be one one triplet of (child-bus-address,
>> +  parent-bus-address, length) for each active chip select.  If the
>> +  length element for any triplet is zero, the chip select is disabled,
>> +  making it inactive.
>> +
>> +The configuration parameters for each chip select are stored in child
>> +nodes.
>> +
>> +Configuration Properties:
>> +- compatible:  "cavium,octeon-3860-bootbus-config"
>> +
>> +- cavium,cs-index: A single cell indicating the chip select that
>> +  corresponds to this configuration.
>> +
>> +- cavium,t-adr: A cell specifying the ADR timing (in nS).
>
> Add -ns to these time values.

I would prefer not to.  There is already firmware in the field with 
these bindings.  They were discussed here:

http://www.linux-mips.org/archives/linux-mips/2011-06/msg00338.html

Also there is precedence:  Few, if any, of the clock rate and frequency 
properties end in '-hz'

[...]
