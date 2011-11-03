From: "Robert Sciuk" <robert.sciuk@exfo.com>
Subject: RE: fpga driver on custom PPC target platform (P4080) ...
Date: Thu, 3 Nov 2011 18:12:01 -0400
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100C735@SPQCEXC05.exfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-class: urn:content-classes:message
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Segher Boessenkool [mailto:segher@kernel.crashing.org]
> Sent: Thursday, November 03, 2011 5:22 PM
> To: Robert Sciuk
> Cc: devicetree-discuss@lists.ozlabs.org; linuxppc-dev@lists.ozlabs.org
> Subject: Re: fpga driver on custom PPC target platform (P4080) ...
> 
> > 	- How does one specify in the device tree an FPGA which uses
> > both I2c bus and localbus for programming?
> 
> You have two device nodes, one on the localbus and one on the IIC bus.
> One of the nodes points to the other, or both do; you point to another
> node by having a property containing the phandle of that other node.
> 
> It's probably easiest to make the IIC node point to the localbus node,
> because you will most likely always have exactly one of those, and you
> could have multiple IIC nodes on your FPGA, or none at all.  But this
> is something you'll have to put in the device binding for your device,
> and it doesn't really matter what you choose -- it will work either
> way,
> some choices are more convenient than others though.
> 
> 
> Segher

Segher,

Actually, I'm just now re-configuring my device-tree i2c nodes to accurately reflect reality.  As the open() will be doing the i2c bit banging, I agree completely with your assessment, and I will access the FPGA's via the I2c bus, and locate the localbus port via the phandle 8-).

dmesg | grep pca

[    2.699342] pca953x 2-00e8: failed reading register
[    2.708444] pca953x: probe of 2-00e8 failed with error -5
[    2.719097] pca953x 2-00e9: failed reading register
[    2.728192] pca953x: probe of 2-00e9 failed with error -5		

	i2c@119000 {
			#address-cells = <1>;
			#size-cells = <0>;
			cell-index = <2>;
			compatible = "fsl-i2c";
			reg = <0x119000 0x100>;
			interrupts = <39 2 0 0>;
			interrupt-parent = <&mpic>;
			dfsrr;

                        lim_r: gpio@e8 {
                                compatible = "nxp,pca9539";
                                reg = <0xe8>;
                                #gpio-cells = <2>;
                                gpio-controller;
                                polarity = <0x00>;
                        };

                        lim_w: gpio@e9 {
                                compatible = "nxp,pca9539";
                                reg = <0xe9>;
                                #gpio-cells = <2>;
                                gpio-controller;
                                polarity = <0x00>;
                        };

		};

It appears that I'm not correctly creating the pca9539 nodes as of yet (I'll be adding the phandles shortly).  Any pointers for pca9539 driver nodes would be appreciated, as I took these from a similar tree, but not the 95xx driver.  I'll match them up with the code in the morning ...


Thanks for your feedback, it was as timely as it was welcomed!

Cheers,
Rob
