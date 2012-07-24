From: Attila Kinali <attila-HB9FjVmMKa7tRgLqZ5aouw@public.gmane.org>
Subject: specifying two conflicting configs
Date: Tue, 24 Jul 2012 11:34:50 +0200
Message-ID: <20120724113450.328c27430ebc4438d0048346@kinali.ch>
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
List-Id: devicetree@vger.kernel.org

Hi,

I have here an embedded system where i use a serial port as SD Card
interface as well as SPI interface. I select what i want to use
by setting a GPIO pin high or low.

Currently i'm using two different dts files, one that specifies the
serial port as SD Card interface and one that specifies the serial
port as SPI interface.

Now i would like to merge them into one file so that i can select
which mode to use at runtime. The documentation gave me the impression
that this should be possible, but i was not able to figure out how
to do it.

Would someone be so kind and point me to the documentation/example
i've missed?

The current configuration i use is either:

ssp0: ssp@80010000 {
        compatible = "fsl,imx23-mmc";
        pinctrl-names = "default";
        pinctrl-0 = <&mmc0_8bit_pins_a &mmc1_pins_fixup>;
        bus-width = <8>;
        status = "okay";
};

or:

ssp0: ssp@80010000 {
        #address-cells = <1>;
        #size-cells = <0>;
        compatible = "fsl,imx23-spi";
        fsl,ssp-dma-channel = <1>;
        pinctrl-names = "default";
        pinctrl-0 = <&spi_pins_a>;
        status = "okay";

};


Thanks in advance

			Attila Kinali
-- 
It is upon moral qualities that a society is ultimately founded. All 
the prosperity and technological sophistication in the world is of no 
use without that foundation.
                 -- Miss Matheson, The Diamond Age, Neil Stephenson
