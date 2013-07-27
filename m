Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:49575 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751759Ab3G0NYD (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Sat, 27 Jul 2013 09:24:03 -0400
Received: from ax5200p.localnet ([217.229.199.90]) by mail.gmx.com (mrgmx103)
 with ESMTPSA (Nemesis) id 0Mhhr5-1UgCGZ34p1-00Mt4q for
 <devicetree@vger.kernel.org>; Sat, 27 Jul 2013 15:24:01 +0200
From: Marc Dietrich <marvin24@gmx.de>
Subject: [RFC] binding for nvec mfd device
Date: Sat, 27 Jul 2013 15:23:20 +0200
Message-ID: <1416005.VvfEeGuSWa@ax5200p>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Andrey Danin <danindrey@mail.ru>
List-ID: <devicetree@vger.kernel.org>

Hi,

this is an RFC for an mfd device introduced here [1]. I didn't got much 
response, except from Stephen, but that bothered me enough already ;-)

I'm going describe the hw again shortly, for a more complete description, see 
[1]. What we have here is an EC which communicates to the host cpu (NVIDIA 
Tegra) via I2C. The unusual part is that the EC is I2C master while the host 
cpu is the slave. The EC has several ports to connect peripherals like 
keyboard, mouse, ... and also to control some system states (suspend, low bat, 
power key, ...). Ok, so much for the hardware description, now the binding. I 
think I integrated all comments made by Stephen in [2].

i2c-slave@7000c500 { 
	compatible = "nvidia,tegra20-i2c-slave", "simple-bus"; 
	reg = <0x7000c500 0x100>; 
	interrupts = <0 92 0x04>; 
	#address-cells = <1>; 
	#size-cells = <0>; 
	clock-frequency = <80000>; 
	clocks = <&tegra_car 67>, <&tegra_car 124>; 
	clock-names = "div-clk", "fast-clk"; 

	nvec@87 { 
		compatible = "nvidia,nvec", "simple-bus"; 
		reg = <0x87>;
		request-gpios = <&gpio 170 0>; /* gpio PV2 */ 

		keyboard { 
			compatible = "nvidia,nvec-keyboard";
			...
			<insert key mappings here>
			...
		}; 

		ps2 {
			compatible = "nvidia,nvec-ps2";
			packet-size = 6; /* for the ac100 tp */
		};

		events {
			compatible = "nvidia,nvec-events";
			...
			<add some system events here, 
				e.g. lid switch, power button>
			...
		};

		charger: ac {
			compatible = "nvidia,nvec-ac";
		};

		battery {
			compatible = "nvidia,nvec-battery";
			charger = <&charger>;
       };

		oem {
			compatible = "compal,nvec-paz00";
			/* ac100 specific extentions to the protocol */
		};
	}; 
}; 

For multi-slave capable SoCs, there can be more than one master connected to 
the i2c slave controller of the host cpu. Therefore I added "simple-bus" 
property here. Does "simple-bus" imply bus addresses? The EC registers with 
the slave controller by supplying the protocol (e.g. smbus or i2c) and an 
optional gpio.

I left out the binding description for now because the properties are pretty 
much self-describing. The current driver is in staging so everything is still 
in flux.

Marc


[1] http://www.mail-archive.com/devicetree-
discuss@lists.ozlabs.org/msg35636.html
[2] http://u-boot.10912.n7.nabble.com/PATCH-0-3-ARM-tegra-add-nvec-keyboard-
support-for-paz00-td159690.html
