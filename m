From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: P4080: attempting to use the uio_pdrv to attach FPGA on localbus ...
Date: Wed, 16 Nov 2011 16:19:51 -0500
Message-ID: <2DD52030B5146141BEB762A11AE97C4C010A0519@SPQCEXC05.exfo.com>
References: <mailman.2323.1320874671.15294.devicetree-discuss@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-reply-to: <mailman.2323.1320874671.15294.devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I have succeeded in using the i2c bus with GPIO expander to access the programming pins of my FPGA devices, but the data port uses the localbus.  I had initially thought that the uio platform driver would be the ideal approach to creating a device which would allow configuration from userland via the /dev/uio[0|1] device interface, but apparently the device binding is not being accomplished as expected.  

	localbus@ffe124000 {
		compatible = "fsl,p4080-elbc", "fsl,elbc", "simple-bus";
		reg = <0xf 0xfe124000 0 0x1000>;
		interrupts = <25 2 0 0>;
		interrupt-parent = <&mpic>;
		#address-cells = <2>;
		#size-cells = <1>;

                /* Local bus region mappings */
                ranges = <0 0 0xf 0xe8000000 0x08000000 	/* CS0: Boot flash */
                          1 0 0xf 0xd0000000 0x8000 		/* CS1: FPGA0 */
                          2 0 0xf 0xd1000000 0x8000 >; 	/* CS2: FPGA1 */

		flash@0,0 {
		  ........
            }; 

		lim: fpga@1,0 {
			compatible = "uio_pdrv";
			pin-handle=<&lim_ctrl>;
		}; 

		nitro: fpga@2,0 {
			compatible = "uio_pdrv";
			pin-handle=<&fpe0_ctrl &fpe1_ctrl>;
		}; 
	};

I have aliases pointing to the localbus nodes lim and nitro, but it appears that the uio_pdrv driver does not bind to the device based upon the compatible property of the tree.  I'm hoping to be able to mmap the localbus port memory (0xf_d000_0000 and 0xf_d100_0000) respectively when I open /dev/uio[0|1].  Is there additional driver registration needed in order to use the uio_pdrv driver?  What am I missing??

Any pointers would be appreciated.

Cheers,
Rob
