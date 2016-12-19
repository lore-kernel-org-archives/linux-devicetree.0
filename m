From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Date: Mon, 19 Dec 2016 13:59:16 +0100
Message-ID: <20161219135916.4fd5e546@bbrezillon>
References: <580F5AD2.9020909@sigmadesigns.com>
        <580F5B06.6030608@sigmadesigns.com>
        <1978954.SRtJpfOGp1@wuerfel>
        <d3cbfda6-23bf-4ad1-b1ce-c179b765272f@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d3cbfda6-23bf-4ad1-b1ce-c179b765272f-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 16 Dec 2016 11:56:38 +0100
Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org> wrote:

> On 07/11/2016 10:18, Arnd Bergmann wrote:
> > On Tuesday, October 25, 2016 3:15:50 PM CET Marc Gonzalez wrote:  
> >> Add the tango NAND Flash Controller dt bindings documentation.
> >>
> >> Signed-off-by: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> new file mode 100644
> >> index 000000000000..3cbf95d6595a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
> >> @@ -0,0 +1,38 @@
> >> +Sigma Designs Tango4 NAND Flash Controller (NFC)
> >> +
> >> +Required properties:
> >> +
> >> +- compatible: "sigma,smp8758-nand"
> >> +- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
> >> +- dmas: reference to the DMA channel used by the controller
> >> +- dma-names: "nfc_sbox"  
> > 
> > Drop the "nfc_" prefix here, it seems redundant.  
> 
> I took a closer look at Documentation/devicetree/bindings and
> arch/arm/boot/dts and it seems the overwhelming nomenclature
> is "rx", "tx" (with variants around these two).
> 
> Should I just use "rxtx" for my driver?
> 
> >> +- clocks: reference to the system clock
> >> +- #address-cells: <1>
> >> +- #size-cells: <0>
> >> +
> >> +Children nodes represent the available NAND chips.
> >> +See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
> >> +
> >> +Example:
> >> +
> >> +	nand: nand@2c000 {
> >> +		compatible = "sigma,smp8758-nand";
> >> +		reg = <0x2c000 0x30 0x2d000 0x800 0x20000 0x1000>;  
> > 
> > It would be nicer to write this as
> > 
> > 	reg = <0x2c000 0x30>, <0x2d000 0x800>, <0x20000 0x1000>;
> > 
> > which is identical in binary format.  
> 
> This is indeed a marked improvement. Boris, if I fix these two nits,
> can I submit a single patch, or do you want them split?

Sure, just describe the different binding changes in your commit
message.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
