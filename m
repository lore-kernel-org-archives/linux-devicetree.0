From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC v2 PATCH 1/2] memory: davinci - add aemif controller platform
 driver
Date: Thu, 8 Nov 2012 10:46:56 -0500
Message-ID: <509BD3F0.9030409@ti.com>
References: <1352238427-26085-1-git-send-email-m-karicheri2@ti.com>
 <1352238427-26085-2-git-send-email-m-karicheri2@ti.com>
 <509ABF12.5080804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <509ABF12.5080804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Stephen,

Thanks for reviewing this. See my responses below
On 11/07/2012 03:05 PM, Stephen Warren wrote:
> On 11/06/2012 02:47 PM, Murali Karicheri wrote:
>> This is a platform driver for asynchronous external memory interface
>> available on TI SoCs. This driver was previously located inside the
>> mach-davinci folder. As this DaVinci IP is re-used across multiple
>> family of devices such as c6x, keystone etc, the driver is moved to drivers.
>> The driver configures async bus parameters associated with a particular
>> chip select. For DaVinci NAND controller driver and driver for other async
>> devices such as NOR flash, ASRAM etc, the bus confuguration is
>> done by this driver at probe. A set of APIs (set/get) are provided to
>> update the values based on specific driver usage.
>> diff --git a/Documentation/devicetree/bindings/memory/davinci-aemif.txt b/Documentation/devicetree/bindings/memory/davinci-aemif.txt
>> +* Texas Instruments Davinci AEMIF bus interface
>> +
>> +This file provides information for the davinci-emif device and
>> +async bus bindings.
>> +
>> +Required properties:=
>> +- compatible: "ti,davinci-aemif";
>> +- #address-cells : Should be either two or three.  The first cell is the
>> +                   chipselect number, and the remaining cells are the
>> +                   offset into the chipselect.
>> +- #size-cells : Either one or two, depending on how large each chipselect
>> +                can be.
> What about "how large each chipselect can be" determines 2-vs-3
> (address) or 1-vs-2 (size) cells? I assume it's 32-vs-64-bit bus? It
> might be best to make that explicit.
I have re-used the bindings from another patch and don't know why the 
above description is used.
I am using a value of 2 for address cells and 1 for size-cells which I 
believe is how these will be used as shown below.

                         ranges = <2 0 0x70000000 0x08000000
                                 3 0 0x74000000 0x04000000
                                 4 0 0x78000000 0x04000000
                                 5 0 0x7C000000 0x04000000
                                 6 0 0x20c00000 0x100>;

So I will change the description as below.

- compatible: must be "ti,davinci-aemif"
- reg: AEMIF control registers base and size
- #address-cells: must be 2 (chip-select + offset)
- #size-cells: must be 1
- ranges: mapping from EMIF space to parent space. Each range 
corresponds to a single chip select, and covers the entire access window 
as configured.
>> +- reg : contains offset/length value for AEMIF control registers space
>> +- ranges : Each range corresponds to a single chipselect, and cover
> add "s" at the end of that line.
Ok
>> +           the entire access window as configured.
>> +
>> +Child device nodes describe the devices connected to IFC such as NOR (e.g.
>> +cfi-flash) and NAND (ti,davinci-nand, see Documentation/devicetree/bindings/
>> +mtd/davinci-nand.txt). There might be board specific devices like FPGAs.
>> +
>> +In addition, optional child sub nodes contains bindings for the async bus
>> +interface for a given chip select.
> Hmmm. That's two different kinds of children, which appear to use
> different addressing schemes given the examples below; more on that below.
>
>> +Optional cs node properties:-
>> +- compatible: "ti,davinci-cs"
>> +
>> +  All of the params below in nanoseconds and are optional
>> +
>> +- ti,davinci-cs-asize - asynchronous data bus width (0 - 8bit, 1 - 16 bit)
> Perhaps s/asize/bus-width/? Also, directly using values 8 and 16 would
> be a lot more obvious to read than 0 and 1.
Ok. Will fix,
>
>> +- ti,davinci-cs-ta - Minimum turn around time
>> +- ti,davinci-cs-rhold - read hold width
>> +- ti,davinci-cs-rstobe - read strobe width
>> +- ti,davinci-cs-rsetup - read setup width
>> +- ti,davinci-cs-whold - write hold width
>> +- ti,davinci-cs-wstrobe - write strobe width
>> +- ti,davinci-cs-wsetup - write setup width
> The comments in the examples indicate these are in nS. This should be
> mentioned here instead I think.
Ok.
>
> Does there need to be a specification of bus clock rate? How does the
> driver convert nS into number-of-clock-cycles, which I assume is what
> the HW would be programmed with?
aemif driver clk is either specified as a clk device node or as a device 
bindings. Aemif driver gets the clk rate and do the conversion of ns to 
emif clk cycles internally in the driver.
>> +- ti,davinci-cs-ss - enable/disable select strobe (0 - disable, 1 - enable)
>> +- ti,davinci-cs-ew - enable/disable extended wait cycles (0 - disable, 1 - enable)
> Boolean properties are usually represented as present (on/enabled/1) or
> missing (off/disabled/0). Shouldn't these two properties work that way?
> I see the comment below:
>> +if any of the above parameters are absent, hardware register default or that
>> +set by a boot loader are used.
> implied they're really tri-state (explicitly off or on, or just not
> programmed). However, I think it'd be better if the DT always
> represented the complete configuration, since the DT and binding should
> be a full description of the HW rather than just the data you expect a
> particular Linux driver to need after a particular boot loader has
> executed first.
Actually this driver has to work on various platforms some of them set 
values in boot loader, others explicitly specify it in bindings or 
platform data. If set in boot loader, these bindings are not required 
(so that it is compatible with old implementation) to be configured in 
Linux kernel. So I believe I should be using something like

ti,davinci-cs-enable-ss - "on", "off"

As cs node is optional, If not present, hw values will be used. I don't 
think it make sense to make it tri-state based on my explanation above.
>> +Example for aemif, davinci nand and nor flash chip select shown below.
>> +
>> +aemif@60000000 {
>> +	compatible = "ti,davinci-aemif";
>> +	#address-cells = <2>;
>> +	#size-cells = <1>;
>> +	reg = <0x68000000 0x80000>;
>> +	ranges = <2 0 0x60000000 0x02000000
>> +		  3 0 0x62000000 0x02000000
>> +		  4 0 0x64000000 0x02000000
>> +		  5 0 0x66000000 0x02000000
>> +		  6 0 0x68000000 0x02000000>;
>> +
>> +	nand_cs:cs2@60000000 {
> This node has no reg property, but it needs one if you use a unit
> address ("@60000000") in the node name.
So let  me drop the unit address as it is not needed for the cs node. 
The AEMIF control register address is specified by the parent reg 
property and is common to all chip selects.
> The numbering scheme unit address above doesn't seem to match the
> addresses provided to child nodes by the ranges property. Perhaps the
> node layout you want is:
>
>
> aemif {
>      chip-selects {
>          nand_cs:cs2@60000000 {
>          };
>      };
>      devices {
>          nand@3,0 {
>          }
>      };
> };
>
> so that the chip-selects and devices nodes can both set appropriate and
> different #address-cells and #size-cells?
>
> That does feel a bit wierd though, and I imagine writing the ranges
> property in the aemif node would be hard.
>
> Perhaps the chip-select timings should just be written as properties in
> the aemif controller, rather than child nodes?
>
> ti,cs-timings =
>      < ... > /* 0 */
>      < ... > /* 1 */
>      < ... > /* 2 */
>      ;
>
> with each <...> being a list of n cells in a specific order?
>
  To make this simple, I will drop the unit address from cs node and 
represent it as

nand_cs:cs2 {

};

nor_cs:cs3 {

};


+		compatible = "ti,davinci-cs";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		/* all timings in nanoseconds */
+		ti,davinci-cs-ta = <0>;
+		ti,davinci-cs-rhold = <7>;
+		ti,davinci-cs-rstrobe = <42>;
+		ti,davinci-cs-rsetup = <14>;
+		ti,davinci-cs-whold = <7>;
+		ti,davinci-cs-wstrobe = <42>;
+		ti,davinci-cs-wsetup = <14>;
+	};

> ...
>> +	nand@3,0 {
>> +		compatible = "ti,davinci-nand";
>> +		reg = <3 0x0 0x807ff
>> +			6 0x0 0x8000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +
>> +		.. See Documentation/devicetree/bindings/mtd/davinci-nand.txt
>> +	};
>
>
>
