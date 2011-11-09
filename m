From: "Robert Sciuk" <robert.sciuk-AJFDzwRlY/g@public.gmane.org>
Subject: i2c bus gpio expander ...
Date: Wed, 9 Nov 2011 12:39:39 -0500
Message-ID: <2DD52030B5146141BEB762A11AE97C4C01059014@SPQCEXC05.exfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
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
List-Id: devicetree@vger.kernel.org

My problem seems to be evolving, and the localbus issue now seems less
important than correctly mapping the gpio's on the i2c bus.

I have a pca9539 16 pin gpio expander on an i2c bus, and I'm wondering
what the correct way to map each of the pins on the expander might be?
In this case, I am programming FPGAs, and the connections look like
this:

	Pca9539
	Port 0
		0	-> done	FPGA1
		1	-> init
		2	-> cs
		3	-> program

	Port 1
		0	-> done	FPGA2
		1	-> init
		2	-> cs
		3	-> program


                i2c@119000 {
                        #address-cells = <1>;
                        #size-cells = <0>;
                        cell-index = <2>;
                        compatible = "fsl-i2c";
                        reg = <0x119000 0x100>;
                        interrupts = <39 2 0 0>;
                        interrupt-parent = <&mpic>;
                        dfsrr;

                        fpga_ctrl: gpio@ea {
                                compatible = "nxp,pca953x";
                                reg = <0xea>;
                                #gpio-cells = <2>;
                                gpio-controller;
                                polarity = <0x00>;
                        };

                };

My question is, how might one correctly map the gpio pins?  Are they a
subnode of the gpio node, or would each of the two ports on the 9539
constitute a subnode of the gpio, and then the pins be labeled as
subnodes of the port?  How might one represent pins which are not
connected or are only the used pins actually mapped?. Any pointers would
be appreciated.



Robert Sciuk
Senior Designer, R&D.
905.738.3741 xt 22621
