From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Device tree FSL description for Microblaze
Date: Wed, 25 May 2011 13:27:15 +0200
Message-ID: <4DDCE793.9080709@monstr.eu>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I would like to check with you proper device tree FSL description for Microblaze 
(PPC can use FSL through IP connected to the bus).

Microblaze supports FSL buses to connect coprocessors or hw accelerators 
directly to the cpu. Cpu has up to 16 fsl bus connections - master and slave 
side. (BTW: in the latest Microblaze with AXI is possible to use AXI stream 
instead of FSL but description should be the same),
FSL bus has one master and in most cases one slave (more point-to-point 
connection than bus) but I think there could be an option to have multiple 
slaves for cases where the same input data goes to n-slaves.
There is also an option to generate interrupt if there is any data on the bus.

FSL devices can have multiple FSL inputs and outputs and they also can generate 
interrupts.

There is also one option to have only loopback which means connect CPU FSL 
master to CPU FSL slave with optional interrupt enabling.

I am also aware of one more option which is possibility to use a bridge instead 
of CPU (this option is not shown below).

Currently I have changed our generator to have the first description which I 
would like to use for our discussion.

Below is the important part which I would like to discuss - it is fake hw design 
but illustrate some important cases.

Here are some my notes:
1. I can't add FSL device directly to the CPU node because connection could be 
from axi IP. And I need to separate interrupt generation if there is any 
activity on a bus. That's why I separate fsl bus and devices out of CPU.
2. I think that shouldn't be a problem to have fsl buses in the root node
3. I think fsl devices should be moved out of root node but the point is where.
It is not bus sub/node because device can be connected to several buses. There 
could be a lot of connections. Any suggestions?
4. Please let me know if there should be any cells properties or similar.
5. There is not any address on the bus. FSL devices has some registers.
6. Should I use different address than 0 for connection from cpu? mfsl@5 instead 
of mfsl5@0?

Thanks,
Michal



/dts-v1/;
/ {
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "xlnx,microblaze";
	model = "axi-loopback";

/* cpu node */
	cpus {
		#address-cells = <1>;
		#cpus = <0x1>;
		#size-cells = <0>;
		microblaze_0: cpu@0 {
... /* some cpu parameters */
			xlnx,use-stack-protection = <0x0>;

		/* fsl_m -> master side, fsl_s -> slave side */
			fsl_m_0: mfsl0@0 {
				link = <&fsl_v20_2>; /* bus connection */
			} ;
...
			fsl_m_5: mfsl5@0 {
				link = <&fsl_v20_9>;
			} ;
			fsl_s_0: sfsl0@0 {
				link = <&fsl_v20_1>;
			} ;
...
			fsl_s_5: sfsl5@0 {
				link = <&fsl_v20_10>;
			} ;
		} ;
	} ;

/* FSL buses - all look the same that's why I keep here only two - I expect you 
will beat me for simple-bus compatible property.  */
/* The first where all interrupts are connected */
	fsl_v20_0: fsl-v20-0@0 {
		compatible = "xlnx,fsl-v1.00.a", "simple-bus";
		interrupt-parent = <&microblaze_0_intc>;
		interrupts = < 11 2 4 2 10 2 >;
		xlnx,async-clks = <0x0>;
		xlnx,ext-reset-high = <0x1>;
		xlnx,fsl-depth = <0x10>;
		xlnx,fsl-dwidth = <0x20>;
		xlnx,impl-style = <0x0>;
		xlnx,read-clock-period = <0x0>;
		xlnx,use-control = <0x1>;
	} ;
/* bus without interrupts */
	fsl_v20_10: fsl-v20-10@0 {
		compatible = "xlnx,fsl-v1.00.a", "simple-bus";
		xlnx,async-clks = <0x0>;
		xlnx,ext-reset-high = <0x1>;
		xlnx,fsl-depth = <0x10>;
		xlnx,fsl-dwidth = <0x20>;
		xlnx,impl-style = <0x0>;
		xlnx,read-clock-period = <0x0>;
		xlnx,use-control = <0x1>;
	} ;

....

/* simple ip - one input and one output + parameters and interrupt */
	axi_stream_test_0: axi-stream-test-0@0 {
		MFSL = <&fsl_v20_3>;
		SFSL = <&fsl_v20_2>;
		interrupt-parent = <&microblaze_0_intc>;
		interrupts = < 3 2 >;
		xlnx,use-rexa = <0x0>;
		xlnx,use-rexam = <0x2>;
		xlnx,use-rexample = <0x4>;
	} ;
...
/* IP with two inputs and one output */
	multiinput_dev_0: multiinput-dev-0@0 {
		MFSL0 = <&fsl_v20_11>;
		SFSL0 = <&fsl_v20_12>;
		SFSL1 = <&fsl_v20_13>;
		xlnx,use-exa = <0x0>;
		xlnx,use-exam = <0x2>;
		xlnx,use-example = <0x4>;
	} ;

/* IP with two inputs and two outputs */
	multiport_fsl_0: multiport-fsl-0@0 {
		MFSL0 = <&fsl_v20_8>;
		MFSL1 = <&fsl_v20_5>;
		SFSL0 = <&fsl_v20_7>;
		SFSL1 = <&fsl_v20_6>;
		xlnx,use-test = <0x3>;
	} ;


/* the rest of IP connected to axi */
	axi4lite_0: axi@0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "xlnx,axi-interconnect-1.03.a", "simple-bus";
		ranges ;
...
		microblaze_0_intc: interrupt-controller@41200000 {
			#interrupt-cells = <0x2>;
			compatible = "xlnx,axi-intc-1.01.a";
			interrupt-controller ;
			reg = < 0x41200000 0x10000 >;
			xlnx,kind-of-intr = <0x144>;
			xlnx,num-intr-inputs = <0xc>;
		} ;
	} ;
} ;





-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
