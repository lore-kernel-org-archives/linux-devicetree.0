From: Constantine Shulyupin <const@MakeLinux.com>
Subject: Please suggest proper format for DT properties.
Date: Sat, 19 Sep 2015 01:36:43 +0300
Message-ID: <1442615803-17766-1-git-send-email-const@MakeLinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lm-sensors@lm-sensors.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

I am designing DT support for a hwmon chip. 
It has some sensors, each of them can be:
 - "disabled"
 - "thermal diode"
 - "thermistor"
 - "voltage"

Four possible options for DT properties format.

Option 1: Separated property for each sensor.

Example nct7802 node:

nct7802 {
	compatible = "nuvoton,nct7802";
	reg = <0x2a>;
	nuvoton,sensor1-type = "thermistor";
	nuvoton,sensor2-type = "disabled";
	nuvoton,sensor3-type = "voltage";
};

Option 2: Array of strings for all sensors.

nct7802 {
	compatible = "nuvoton,nct7802";
	reg = <0x2a>;
	nuvoton,sensors-types = "thermistor", "disabled", "voltage";
};

Option 3: Sets of 4 cells.

  Borrowed from marvell,reg-init and broadcom,c45-reg-init.

  The first cell is the page address, 
  the second a register address within the page,
  the third cell contains a mask to be ANDed with the existing register
  value, and the fourth cell is ORed with the result to yield the
  new register value. If the third cell has a value of zero,
  no read of the existing value is performed.

Example nct7802 node:

nct7802 {
	compatible = "nuvoton,nct7802";
	reg = <0x2a>;
	nct7802,reg-init =
		<0 0x21 0 0x01 > // START = 1
		<0 0x22 0x03 0x02>; // RTD1_MD = 2
};

Please suggest proper format for DT properties.

Thanks
Constantine

PS:
Datasheet: https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/
