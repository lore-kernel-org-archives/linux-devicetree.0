From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/14] dt-bindings: dma: ti: Add document for K3 UDMA
Date: Thu, 10 Oct 2019 12:52:32 -0500
Message-ID: <20191010175232.GA24556@bogus>
References: <20191001061704.2399-1-peter.ujfalusi@ti.com>
 <20191001061704.2399-8-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001061704.2399-8-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, Oct 01, 2019 at 09:16:57AM +0300, Peter Ujfalusi wrote:
> New binding document for
> Texas Instruments K3 NAVSS Unified DMA – Peripheral Root Complex (UDMA-P).
> 
> UDMA-P is introduced as part of the K3 architecture and can be found in
> AM654 and j721e.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  .../devicetree/bindings/dma/ti/k3-udma.txt    | 185 ++++++++++++++++++
>  include/dt-bindings/dma/k3-udma.h             |  10 +
>  2 files changed, 195 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-udma.txt
>  create mode 100644 include/dt-bindings/dma/k3-udma.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/ti/k3-udma.txt b/Documentation/devicetree/bindings/dma/ti/k3-udma.txt
> new file mode 100644
> index 000000000000..3a8816ec9ce0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/k3-udma.txt
> @@ -0,0 +1,185 @@
> +* Texas Instruments K3 NAVSS Unified DMA – Peripheral Root Complex (UDMA-P)
> +
> +The UDMA-P is intended to perform similar (but significantly upgraded) functions
> +as the packet-oriented DMA used on previous SoC devices. The UDMA-P module
> +supports the transmission and reception of various packet types. The UDMA-P is
> +architected to facilitate the segmentation and reassembly of SoC DMA data
> +structure compliant packets to/from smaller data blocks that are natively
> +compatible with the specific requirements of each connected peripheral. Multiple
> +Tx and Rx channels are provided within the DMA which allow multiple segmentation
> +or reassembly operations to be ongoing. The DMA controller maintains state
> +information for each of the channels which allows packet segmentation and
> +reassembly operations to be time division multiplexed between channels in order
> +to share the underlying DMA hardware. An external DMA scheduler is used to
> +control the ordering and rate at which this multiplexing occurs for Transmit
> +operations. The ordering and rate of Receive operations is indirectly controlled
> +by the order in which blocks are pushed into the DMA on the Rx PSI-L interface.
> +
> +The UDMA-P also supports acting as both a UTC and UDMA-C for its internal
> +channels. Channels in the UDMA-P can be configured to be either Packet-Based or
> +Third-Party channels on a channel by channel basis.
> +
> +All transfers within NAVSS is done between PSI-L source and destination threads.
> +The peripherals serviced by UDMA can be PSI-L native (sa2ul, cpsw, etc) or
> +legacy, non PSI-L native peripherals. In the later case a special, small PDMA is
> +tasked to act as a bridge between the PSI-L fabric and the legacy peripheral.
> +
> +PDMAs can be configured via UDMAP peer registers to match with the configuration
> +of the legacy peripheral.
> +
> +Required properties:
> +--------------------
> +- compatible:		Should be
> +			"ti,am654-navss-main-udmap" for am654 main NAVSS UDMAP
> +			"ti,am654-navss-mcu-udmap" for am654 mcu NAVSS UDMAP
> +			"ti,j721e-navss-main-udmap" for j721e main NAVSS UDMAP
> +			"ti,j721e-navss-mcu-udmap" for j721e mcu NAVSS UDMAP
> +- #dma-cells:		Should be set to <3>.
> +			- The first parameter is a phandle to the remote PSI-L
> +			  endpoint
> +			- The second parameter is the thread offset within the
> +			  remote thread ID range
> +			- The third parameter is the channel direction.
> +- reg:			Memory map of UDMAP
> +- reg-names:		"gcfg", "rchanrt", "tchanrt"
> +- msi-parent:		phandle for "ti,sci-inta" interrupt controller
> +- ti,ringacc:		phandle for the ring accelerator node
> +- ti,psil-base:		PSI-L thread ID base of the UDMAP channels
> +- ti,sci:		phandle on TI-SCI compatible System controller node
> +- ti,sci-dev-id:	TI-SCI device id
> +- ti,sci-rm-range-tchan: UDMA tchan resource list in pairs of type and subtype
> +- ti,sci-rm-range-rchan: UDMA rchan resource list in pairs of type and subtype
> +- ti,sci-rm-range-rflow: UDMA rflow resource list in pairs of type and subtype
> +
> +For PSI-L thread management the parent NAVSS node must have:
> +- ti,sci:		phandle on TI-SCI compatible System controller node
> +- ti,sci-dev-id:	TI-SCI device id of the NAVSS instance
> +
> +Remote PSI-L endpoint
> +
> +Required properties:
> +--------------------
> +- ti,psil-base:		PSI-L thread ID base of the endpoint
> +
> +Within the PSI-L endpoint node thread configuration subnodes must present with:
> +psil-configX naming convention, where X is the thread ID offset.
> +
> +Configuration node Optional properties:
> +--------------------
> +- ti,pdma-statictr-type:In case the remote endpoint (PDMAs) requires StaticTR
> +			configuration:
> +			- PSIL_STATIC_TR_XY (1): XY type of StaticTR
> +			For endpoints without StaticTR the property is not
> +			needed or to be set PSIL_STATIC_TR_NONE (0).
> +- ti,pdma-enable-acc32:	Force 32 bit access on peripheral port. Only valid for
> +			XY type StaticTR, not supported on am654.
> +			Must be enabled for threads servicing McASP with AFIFO
> +			bypass mode.
> +- ti,pdma-enable-burst:	Enable burst access on peripheral port. Only valid for
> +			XY type StaticTR, not supported on am654.
> +- ti,channel-tpl:	Channel Throughput level:
> +			0 / or not present - normal channel
> +			1 - High Throughput channel
> +			2 - Ultra High Throughput channel (j721e only)
> +- ti,needs-epib:	If the endpoint require EPIB to be present in the
> +			descriptor.
> +- ti,psd-size:		Size of the Protocol Specific Data section of the
> +			descriptor.
> +- ti,notdpkt:		The Teardown Completion Message on the thread must be
> +			suppressed.
> +
> +Example:
> +
> +main_navss: main_navss {
> +	compatible = "simple-bus";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	dma-coherent;
> +	dma-ranges;
> +	ranges;
> +
> +	ti,sci = <&dmsc>;
> +	ti,sci-dev-id = <118>;
> +
> +	main_udmap: dma-controller@31150000 {
> +		compatible = "ti,j721e-navss-main-udmap";
> +		reg =	<0x0 0x31150000 0x0 0x100>,
> +			<0x0 0x34000000 0x0 0x100000>,
> +			<0x0 0x35000000 0x0 0x100000>;
> +		reg-names = "gcfg", "rchanrt", "tchanrt";
> +		#dma-cells = <3>;
> +
> +		ti,ringacc = <&main_ringacc>;
> +		ti,psil-base = <0x1000>;
> +
> +		interrupt-parent = <&main_udmass_inta>;
> +
> +		ti,sci = <&dmsc>;
> +		ti,sci-dev-id = <212>;
> +
> +		ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
> +					<0x0f>, /* TX_HCHAN */
> +					<0x10>; /* TX_UHCHAN */
> +		ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
> +					<0x0b>, /* RX_HCHAN */
> +					<0x0c>; /* RX_UHCHAN */
> +		ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
> +	};
> +};
> +
> +psilss@340c000 {
> +	/* PSILSS1 AASRC */
> +	compatible = "ti,j721e-psilss";
> +	reg = <0x0 0x0340c000 0x0 0x1000>;
> +	reg-names = "config";
> +
> +	pdma_main_mcasp_g0: pdma_main_mcasp_g0 {
> +		/* PDMA6 (PDMA_MCASP_G0) */
> +		ti,psil-base = <0x4400>;
> +
> +		/* psil-config0 */
> +		psil-config0 {
> +			ti,pdma-statictr-type = <PDMA_STATIC_TR_XY>;
> +			ti,pdma-enable-acc32;
> +			ti,pdma-enable-burst;
> +		};
> +	};
> +};
> +
> +mcasp0: mcasp@02B00000 {
> +...
> +	/* tx: PDMA_MAIN_MCASP_G0-0, rx: PDMA_MAIN_MCASP_G0-0 */
> +	dmas = <&main_udmap &pdma_main_mcasp_g0 0 UDMA_DIR_TX>,
> +	       <&main_udmap &pdma_main_mcasp_g0 0 UDMA_DIR_RX>;
> +	dma-names = "tx", "rx";
> +...
> +};
> +
> +crypto: crypto@4E00000 {
> +	compatible = "ti,sa2ul-crypto";
> +...
> +
> +	/* tx: crypto_pnp-1, rx: crypto_pnp-1 */
> +	dmas = <&main_udmap &crypto 0 UDMA_DIR_TX>,
> +	       <&main_udmap &crypto 0 UDMA_DIR_RX>,
> +	       <&main_udmap &crypto 1 UDMA_DIR_RX>;

I asked before if the first cell is the client and you said no. But this 
shows it clearly is. Or '...' omits a lot more than just some node 
properties and 'dmas' is not a property in 'crypto' node.

Having the consumer phandle here looks like a hack to me and I can't 
think of ever seeing such a case before. I don't think we want to start 
now. 

First, it's redundant. The code parsing 'dmas' already knows what node 
it is in. I guess this is lost in Linux when the args are passed to 
main_udmap's translate function, but that's Linux's problem and not a DT 
problem. I haven't looked at the code, but I'm guessing you want crypto 
phandle to go read these psil-config nodes.

Second, If we ever rev the FDT format to have type information 
maintained, we could find each phandle and not have to parse #*-cells to 
walk these properties.


> +	dma-names = "tx", "rx1", "rx2";
> +...
> +	psil-config0 {
> +		ti,needs-epib;
> +		ti,psd-size = <64>;
> +		ti,notdpkt;
> +	};

I still don't like this either. Your choices are:

Put into dma cells. Yes, that's not easily expanded as you said, but 
your bindings shouldn't really be expanding either.

Don't put into DT. Not everything has to go into DT. What changes per 
board/customer? Limit DT data to that. What data is fixed based on the 
client or SoC? That can reside in the drivers. There's less value in 
that data being in DT unless it is standard like interrupts, clocks, 
etc. Maybe the DMA api needs some way for clients to provide the 
provider with additional configuration information.

Or do some combination of the above. 


Sorry I don't have specific suggestions, but I just see lots of properties 
and complexity, and I don't really understand the h/w here. Putting the 
complexity in what is an ABI is generally not a good plan. And I don't 
have the bandwidth to study and understand the complexities of your h/w 
(and everyone elses), so just more explanations are not likely to really 
help. 

Rob
