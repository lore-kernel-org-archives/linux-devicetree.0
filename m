From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/8] Reconfigurable FPGAs over PCIe.
Date: Fri, 16 Jul 2010 11:13:33 -0700
Message-ID: <97058007-dca9-479d-b51f-87c369666e5e@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This sequence of patches has the goal of enabling an FPGA connected
over PCIe to have multiple internal devices specified in a device
tree..  Of course, such a device should work in any machine, in
addition to those architectures which use device trees to describe the
basic platform functionality: In particular, x86.  This requires some
basic support on x86 in order to make device trees work, and small
amount of driver code to light everything up.

This has been tested on a Virtex5 board plugged into the PCIe slot of
an x86 machine.  The device tree used looks like:

/dts-v1/;
/ {
	#address-cells = <1>;
	#size-cells = <1>;
   compatible = "simple-bus";
	mb_plb: plb@0 {
		#address-cells = <1>;
		#size-cells = <1>;
		compatible = "xlnx,plb-v46-1.03.a", "xlnx,plb-v46-1.00.a", "simple-bus";
		xps_hwicap_0: xps-hwicap@80030000 {
			compatible = "xlnx,xps-hwicap-1.00.a";
			reg = < 0x80030000 0x10000 >;
			xlnx,family = "virtex5";
			xlnx,simulation = "false";
		} ;
   } ;
}  ;

Note that the bulk of the code is work in progress.  In particular,
exactly how the device tree support should get extended to X86 is
still up for grabs.  In addition, there are certain aspects of the
device tree used which are suboptimal: The PCIe bridge translation
range is currently hardcoded into the driver, and there is no
provision for connecting interrupt lines into the PCIe bridge.
Comments greatly appreciated...

Grant: I've thrown in two hwicap patches, which should be final, if
you want to pick them up that would be great.

Steve


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
