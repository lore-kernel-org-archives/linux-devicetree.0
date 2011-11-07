From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: RE: fpga driver on custom PPC target platform (P4080) ...
Date: Mon, 7 Nov 2011 16:50:34 -0500
Message-ID: <2DD52030B5146141BEB762A11AE97C4C0100CB8E@SPQCEXC05.exfo.com>
References: <2DD52030B5146141BEB762A11AE97C4C0100C735@SPQCEXC05.exfo.com>
 <CAOZdJXWjS4t9cOKRB3rxy0iCFAYRyEgg6kfQwvydUQSyO1ttoA@mail.gmail.com>
 <2DD52030B5146141BEB762A11AE97C4C0100C8C1@SPQCEXC05.exfo.com>
 <20111105004050.GA1384@truffala.fritz.box>
 <2DD52030B5146141BEB762A11AE97C4C0100CB3D@SPQCEXC05.exfo.com>
 <4EB84E24.9000000@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-reply-to: <4EB84E24.9000000-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Mitch Bradley [mailto:wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org]
> 
> I would be tempted to add another level of hierarchy as a container for
> the two FPEs on CS2.
> 

Hi, Mitch.

As a long time Forth(er), I'm somewhat honoured to have this exchange with you 8-)


Do you mean something like this????

        localbus@ffe124000 {
                compatible = "fsl,p4080-elbc", "fsl,elbc", "simple-bus";
                reg = <0xf 0xfe124000 0 0x1000>;
                interrupts = <25 2 0 0>;
                interrupt-parent = <&mpic>;
                #address-cells = <2>;
                #size-cells = <1>;

                /* Local bus region mappings */
                ranges = <0 0 0xf 0xe8000000 0x08000000         /* CS0: Boot flash */
                          1 0 0xf 0xd0000000 0x7fff             /* CS1: FPGA0 -  LIM */
                          2 0 0xf 0xd1000000 0x7fff             /* CS2: FPGA1 -  FPE1 */
                          2 1 0xf 0xd2000000 0x7fff >;          /* CS2: FPGA2 -  FPE2 */

                flash@0,0 {
                        compatible = "cfi-flash";
                        reg = <0 0 0x08000000>;
                        bank-width = <2>;
                        device-width = <2>;
                        #size-cells = <1>;
                        #address-cells = <1>;

                        partition@0 {
                                label = "rcw";
                                reg = <0x0 0x20000>;
                                read-only;
                        };
                        partition@40000 {
                                label = "saveenv";
                                reg = <0x40000 0x20000>;
                        };
                        partition@7000000 {
                                label = "fman-firmware";
                                reg = <0x7000000 0x20000>;
                                read-only;
                        };
                        partition@7f80000 {
                                label = "u-boot";
                                reg = <0x7f80000 0x80000>;
                                read-only;
                        };
                };

                lim: fpga@1, {
                }

			nitro: daughtercard@2 {
                	fpe1: fpga@2,0 {
                	}

                	fpe2: fpga@2,1 {
				}
			}
	}
