From: Simon Desfarges <simon.desfarges-s/S/64wAxt+H1Tvi1vFFB9BPR1lH4CV8@public.gmane.org>
Subject: Interruption on PCI Bus
Date: Thu, 16 Apr 2009 09:58:58 +0200
Message-ID: <49E6E542.5090504@fr.thalesgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everybody,

I am working on a custom board and I started to map the Interruptions of 
the PCI on the dts file as follow:

pci@70000000 {
	compatible = "abac-pci";
	device_type = "pci";

	#size-cells = <2>;
	#address-cells = <3>;
	#interrupt-cells = <1>;
	reg = <0x20021000 0x1000>;
	bus-range = <0 1>;
	ranges = < /*Memory-space 1:1 mapping*/
		0x2000000 0x0 0x90000000 0x90000000 0x0 0x10000000
		/*No IO-space*/
		0x1000000 0x0 0x00000000 0x00000000 0x0 0x00000000
	        >;
	clock-frequency = <66666666>;
	interrupt-parent = <&IT_controller>;

	interrupts = <0xd>;
	interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
			
	interrupt-map = <
		/* IDSEL 15 - only 1 slot with 1 IT*/
		0x7800 0x0 0x0 0x1 &IT_controller  0xd
		>;
		};

I have some questions about interrupt mapping:
- If I understood well, when Linux wants to map its internal 
interruptions, it generates a PCI address, masks it with the 
<interrupt-map-mask> field and compares the result with the 
<interrupt-map> field. But where do this address come from ? When in the 
startup the interrupt mapping is done (in which part of code) ? Is it 
automatic or have I to do that manually during PCI initialization ?

- I have read that in the config. space of PCI device, there is a 
"PCI_INTERRUPT_LINE" which gives to the driver the interrupt number. So 
I wonder who (Linux or U-Boot ?) and when this field is filled ?

Thank you for your attention.

Simon Desfarges
