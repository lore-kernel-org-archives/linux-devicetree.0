From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: binding for nvec mfd device
Date: Thu, 27 Jun 2013 20:26:08 +0200
Message-ID: <1690589.tt8Uan1NDT@ax5200p>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm puzzling for some time now to find a binding for a mfd device. So let's 
start with something I think I have learned already, let's describe the 
hardware.

Here the problem starts, because the nvec (nvidia [protocol] compliant 
embedded controller) isn't a well defined piece of silicon at all, but more a 
protocol which specifies how to communicate with certain devices (keyboard, 
mouse, gpio, system state, battery, oem specific hw ...). Even worse, the 
number of "attached" devices may vary for each implementation and there is no 
way to sanely probe which which devices exist or not.

For example, the "hardware" in my case is an ENE KB926 keyboard controller 
with an additional ps/2 port (for the touchpad) and a number of gpio's for 
connecting leds, spi bus, a charger chip and some other stuff. Most gpio's 
cannot be controlled directly, but only through certain ec commands. The i2c 
protocol used for communication with the host cpu is handled by a good old 
8051 type integrated in the keyboard controller.

Other vendors may implement this in totally different hardware, keeping only 
the protocol. So I think this is a case where the "describe the hardware" 
principle just fails.

So I thought ok - forget this principle for now and describe it from a higher 
protocol point of view. We currently have something like this:

        nvec@7000c500 {
                compatible = "nvidia,nvec";
                reg = <0x7000c500 0x100>;
                interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
                #address-cells = <1>;
                #size-cells = <0>;
                clock-frequency = <80000>;
                request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
                slave-addr = <138>;
                clocks = <&tegra_car TEGRA20_CLK_I2C3>,
                         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
                clock-names = "div-clk", "fast-clk";
        };

which describes how the host cpu should setup the i2c communication. The 
devices are currently hard coded in the driver, but I like to make them more 
flexible through a device tree binding, eg. something like this:

		nvec {
				...
				<properties from above>
				...

				keyboard {
						<add some key bindings here>
				};

				ps2 {
						packet-size = 6; /* for the ac100 tp */
				};

				events {
						<add some system events here, e.g. lid switch,
						power button>
				};

				charger: ac {
						<nothing here>
				};

				battery {
						charger = <&charger>;
				};

				oem {
						name = "paz00"; /* ac100 specific extentions to the
											protocol */
				};
		};

One question is now how to instantiate the mfd children from this. I see three 
different methods used in different drivers:

		a) just add a "compatible =" property to the child nodes and a 
			"simple-bus" property to the the driver
		b) search for sub-nodes and instantiate the children "manually" by
			"guessing" some driver name from the node name and use 
			platform_add_device
		c) use an mfd_cell struct hard coded in the driver and "enable" only
			the children found in the sub-node list and use mfd_add_devices.

All these methods above have their advantages and disadvantages. But lets 
ignore them for now and ask what's the preferred way to do this?

Another question is how the children will get their platform data. I guess 
they will just walk the device tree of their parent node and search for it, 
but maybe there is a better way?

Sorry for the lengthly posting...

Marc
