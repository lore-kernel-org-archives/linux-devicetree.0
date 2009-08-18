From: "Herzig, Christian" <Christian.Herzig-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: Device Tree configuration for I2C-Multiplexer and its Clients
Date: Tue, 18 Aug 2009 10:31:38 +0200
Message-ID: <D839955AA28B9A42A61B9181506E27C401B337A5@SRVCHBER1212.ch.keymile.net>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: chris-jmrfutXsf6TiB9QmIjCX8w@public.gmane.org, "Herzig, Christian" <Christian.Herzig-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi listmembers!

I'm working on a MPC8360 (powerpc) based target. I'd like to implement
the facility loading drivers for clients behind a I2C multiplexer. 
A driver for the I2C multiplexer family PCA954x is already written by
Rodolfo Giometti.

Let's assume, my hardware looks like that:

                                   ------  ------
                                   |LM75|  |AT24|
                                   |    |  |    |
                       PCA9542     |0x48|  |0x50|
     MPC8360          ---------    ------  -----
    ---------         | MUX   |   2   |      |
    |       |     2   |      0|--/------------
    | I2C-0 |----/----|       |   2
    |       |         |      1|--/------------
    ---------         | 0x70  |              |
                      ---------            ------
                                           |AT24|
                                           |    |
                                           |0x50|
                                           ------

Describing hardware in the traditional style isn't possible any more:


i2c at 3000 {
        #address-cells = <1>;
        #size-cells = <0>;
        cell-index = <0>;
        compatible = "fsl-i2c";
        reg = <0x3000 0x100>;
        interrupts = <43 2>;
        interrupt-parent = <&mpic>;
        dfsrr;

        mux at 70 { 
                #address-cells = <1>;
                #size-cells = <0>;
                compatible = "philips, pca9542";
                reg = <0x70>;

		/* and now the clients behind the multiplexer: */

                /* channel 0 */
                dtt at 48 {
                        compatible = "national, lm75";
                        reg = <0x48>;
                };	
                at24 at 50 {
                        compatible = "atmel, at24c08";
		        reg = <0x50>;
                };

                /* channel 1 */
                at24 at 50 {
                        compatible = "atmel, at24c08"; 
		        reg = <0x50>;
                };
        };
};

That can't work for reasons of naming and allocation. My proposal to
describe the hardware:

i2c at 3000 {
        #address-cells = <1>;
        #size-cells = <0>;
        cell-index = <0>;
        compatible = "fsl-i2c";
        reg = <0x3000 0x100>;
        interrupts = <43 2>;
        interrupt-parent = <&mpic>;
        dfsrr;

        mux at 70 { 
                #address-cells = <1>;
                #size-cells = <0>;
                compatible = "philips, pca9547";
                reg = <0x70>;
		
		/* and now the clients behind the multiplexer: */

                /* channel 0 */
                0-dtt at 48 {
                        mux-channel = <0>;
                        compatible = "national, lm75";
                        reg = <0x48>;
                }	
		0-at24 at 50 {
                        mux-channel = <0>;
                        compatible = "atmel, at24c08";
		        reg = <0x50>;
                }

                /* channel 1 */
                1-at24 at 50 {
                        mux-channel = <1>;
                        compatible = "atmel, at24c08";
		        reg = <0x50>;
                }
        }		
}

maybe that's absolute nonsense. I'd like to obtain other opinions and
suggestions.

Christian
