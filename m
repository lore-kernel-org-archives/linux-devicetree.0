From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Gpio reset handling
Date: Tue, 15 Sep 2009 20:32:49 +0200
Message-ID: <4AAFDDD1.9070702@monstr.eu>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
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
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi All,

I would like to find out proper way how to handle xilinx reset gpio.
We are using gpio for soft reset.

I read led.txt in Documentation and currently are used/supported some triggers
but reset is not there.

Led gpio is clear because example is in kernel (xpedite5301.dts for example)

Here is description for mixed reset/heartbeat/led gpio
1. line - soft reset
2. line - phy reset for example or any different one
3. line - heartbeat
4. line - led


Not sure if is first line from 1 or 0 - but doesn't matter right now.



		gpio_res: gpio@81400000 {
			compatible = "xlnx,xps-gpio-1.00.a";
			interrupt-parent = <&xps_intc_0>;
			interrupts = < 7 2 >;
			reg = < 0x81400000 0x10000 >;
...
			xlnx,gpio-width = <0x8>;
...
		} ;

gpio-leds {
	compatible = "gpio-leds";
	heartbeat {
		label = "Heartbeat";
		gpios = <&gpio_res 4 1>;
		linux,default-trigger = "heartbeat";
	}

	green {
		label = "Green"
		gpios = <&gpio_res 5 1>;
	}
}

Ok and here about description of reset port
I see two option to write new trigger
1. new reset trigger and add it to gpio-leds node - but this should be in gpio-leds node which make
no sense to me

	reset {
		label = "Heartbeat";
		gpios = <&gpio_res 3 1>;
		linux,default-trigger = "reset";
	}

2. create own reset node

reset {
	compatible = "gpio-reset";
	reset0 {
		label "Soft reset";
		gpios = <&gpio_res 1 1>;
	}

	reset1 {
		label "Phy reset";
		gpios = <&gpio_res 2 1>;
	}
}

For this node there should be better reset description not just label with different description.
I expect that it will be useful soft and hard reset and maybe you can find some others.


Thanks for you help,
Michal



-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
