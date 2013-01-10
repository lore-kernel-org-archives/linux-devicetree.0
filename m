From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: RFC: Static memory controller node description
Date: Thu, 10 Jan 2013 16:40:09 +0100
Message-ID: <CAHTX3dJ+ii9dP7w860Or80NWOAPoYZt8ftUwNfAe6WkEoeQJXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi guys,

we want to add static memory controller driver for xilinx zynq to the
linux kernel. (It will go to drivers/memory/ folder)
Just need to clear dts fragment which describe it.

It is compatible with pl353 with 2 interfaces when only one interface
can be used.
Nand, nor and sram memories are supported. Driver will do additional
setup for NAND and power management.

I am using extended compatible property based on
Documentation/devicetree/bindings/arm/primecell.txt. Is it correct?

Nand case (we have special driver for nand) - interrupts are used only
in connection with nand.

smc@0xe000e000 {
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "xlnx,ps7-smc", "arm,pl353", "arm,primecell";
	reg = <0xe000e000 0x1000>;
	interrupts = <0 18 4>;
	interrupt-parent = <&ps7_scugic_0>;
	ranges;
	nand@e1000000 {
		compatible = "xlnx,ps7-nand-1.00.a";
		reg = <0xe1000000 0x1000000>;
		xlnx,nand-width = <16>;
	}
}

or this one for NOR

smc@0xe000e000 {
	#address-cells = <1>;
	#size-cells = <1>;
	compatible = "xlnx,ps7-smc", "arm,pl353", "arm,primecell";
	reg = <0xe000e000 0x1000>;
	ranges;
	nor: nor@e2000000 {
		compatible = "cfi-flash";
		reg = <0xE2000000 0x2000000>;
		bank-width = <1>;
	}
}

Can you see any problem with these dts fragments?

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian
