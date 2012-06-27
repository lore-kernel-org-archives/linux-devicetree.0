From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Remoteproc device-tree node description proposal
Date: Wed, 27 Jun 2012 07:17:03 +0200
Message-ID: <4FEA974F.9050908@monstr.eu>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I would like to start discussion about remoteproc DTS node description.
Currently we have 2 remoteproc drivers for ARM zynq xilinx platform.
One is for the second ARM and one is for Microblaze in programmable logic
on the same device.

Below is current DTS node description which we are using for ARM and microblaze remoteproc.

ARM remoteproc
		test_zynq: zynq-remoteproc-test@0 {
			compatible = "xlnx,zynq_remoteproc";
			reg = < 0x0 0x8000000 >;
			interrupt-parent = <&ps7_scugic_0>;
			interrupts = < 0 37 0 0 38 0 0 39 0>;
			firmware = "test";
			ipino = <5>;
			vring0 = <2>;
			vring1 = <3>;
		} ;
NOTE:
"reg" - firmware allocates the part of ram - this is specification of that range
"interrupts" - which interrupts are used by firmware - static allocation
              - dynamic allocation via rpmsg won't be describe in DTS node
"firmware" - default firmware name which is loaded by request_firmware().
"ipino"(firmware to Linux), "vring0 vring1"(Linux to firmware) are IPI which are
used for rpmsg communication between Linux and firmware.


Microblaze remoteproc - rpmsg communication is not done yet.
		test_mb: mb-remoteproc-test@0 {
			compatible = "xlnx,mb_remoteproc";
			reg = < 0x0 0x10000000 >;
			firmware = "image.elf";
			reset-gpio = <&axi_gpio_0>;
			reset-gpio-pin = <0>;
		} ;

NOTE:
"reset-gpio" is link to IP which is able to start/stop/reset microblaze + pin number
             Ohad: what reset logic do you use?

Ohad: What properties are required by TI to describe firmware?
I would like to add together all requirements and create any formal remoteproc description.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
