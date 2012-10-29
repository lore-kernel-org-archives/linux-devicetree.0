From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Representation of external memory-mapped devices in DT (gpmc)
Date: Mon, 29 Oct 2012 10:09:54 -0500
Message-ID: <508E9C42.10907@gmail.com>
References: <508E9513.7050106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <508E9513.7050106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori,
 Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/29/2012 09:39 AM, Daniel Mack wrote:
> Hi,
> 
> we're currently working on a DT binding for the GPMC bus that is found
> on SoCs by TI. The implementation is based on CS lines and an 8, 16 or
> 32 bit parallel interface. That IP is quite flexible, and it can for
> example be used for physmap flash, external peripherals or even NAND.
> 
> Depending on which CS is used to control the device, different memory
> regions are reserved, and there's code to calculate the location and
> size of them, given a CS number (see arch/arm/mach-omap2/gpmc.c).

I don't know the details of the h/w, but I would think the DT core code
should be able work out the addresses. This can be done using ranges
property which defines the mapping of a child bus into the parent bus
addresses.

> The binding will use one top-level node to describe the GPMC controller
> itself and register the actual devices as sub-nodes to it. The NAND type
> is the only one that is currently supported. This is how it currently looks:
> 
> 	gpmc: gpmc@50000000 {
> 		compatible = "ti,gpmc";
> 		ti,hwmods = "gpmc";
> 		reg = <0x50000000 0x2000>;
> 		interrupt-parent = <&intc>;
> 		interrupts = <100>;
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		nand@0 {

You may want a CS0 node with nand as a child node of that.

Rob

> 			reg = <0>; /* CS0 */
> 			nand-bus-width = <16>;
> 			nand-ecc-mode = "soft";
> 
> 			gpmc,sync-clk = <0>;
> 			gpmc,cs-on = <0>;
> 			gpmc,cs-rd-off = <44>;
> 			gpmc,cs-wr-off = <44>;
> 			gpmc,adv-on = <6>;
> 			gpmc,adv-rd-off = <34>;
> 			gpmc,adv-wr-off = <44>;
> 			gpmc,we-off = <40>;
> 			gpmc,oe-off = <54>;
> 			gpmc,access = <64>;
> 			gpmc,rd-cycle = <82>;
> 			gpmc,wr-cycle = <82>;
> 			gpmc,wr-access = <40>;
> 			gpmc,wr-data-mux-bus = <0>;
> 
> 			#address-cells = <1>;
> 			#size-cells = <1>;
> 
> 			partition@0 {
> 				label = "1st";
> 				reg = <0x0 0x20000>;
> 			};
> 			/* more partitions ... */
> 		};
> 	};
> 
> The question is where the resource location and sizes should be
> described so that the code that does the magic run-time calculations can
> be removed eventually. I would clearly prefer not to have them in the
> child, as the only thing these nodes really care about is the chip
> select index the hardware is wired to.
> 
> Should the "reg" property in the parent be augmented to hold such details?
> 
> Once we got that sorted out, I'll do a re-spin of the series and copy
> devicetree-discuss on the patch that adds the bindings.
> 
> 
> Thanks,
> Daniel
> 
