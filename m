From: Stuart Longland <stuartl@vrt.com.au>
Subject: Add device tree support to ISL12022 driver
Date: Wed, 16 Jul 2014 12:28:24 +1000
Message-ID: <1405477705-16885-1-git-send-email-stuartl@vrt.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Roman Fietze <roman.fietze@telemotive.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

The attached patch adds support for configuring the ISL12022 real-time clock
via the Device tree framework.  This is based on what I've seen in the related
ISL12057 driver, it has been tested and works on a Technologic Systems TS-7670
device which uses a ISL12020 RTC device, my device tree looks like this:

	apbx@80040000 {
		i2c0: i2c@80058000 {
			pinctrl-names = "default";
			pinctrl-0 = <&i2c0_pins_a>;
			clock-frequency = <400000>;
			status = "okay";

			isl12022@0x6f {
				compatible = "isl,isl12022";
				reg = <0x6f>;
			};
		};
		... etc
	};

Regards,
Stuart Longland
