From: Ian Molton <imolton-eWrdHqwYkRZka/w8u0eVh1pr/1R2p/CL@public.gmane.org>
Subject: Help with bindings for usb251x chips
Date: Thu, 22 Jan 2015 11:00:07 +0000
Message-ID: <54C0D837.6050500@ad-holdings.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi folks,

I'm writing a driver for the usb2514 USB hub chip. It supports a small feature set, mostly:

* Up to 7 ports, with any individual ports disabled
* Ports can be marked as hardwired
* Device may appear as a composite device
* per-port O/C GPIO outputs.

My initial though was to copy the 3503 driver, which is similar, but the fact that ports can be arbitrarily disabled makes me think that a better approach is needed.

Is there a way to specify USB ports in device-tree, similar to how hdmi ports are?

Rather than something messy like this:

         usb2514@2c {
                 compatible = "smsc,usb2514";
                 reg = <0x2c>;
                 disabled-ports = <3>;
                 overcurrent-gpios = <&gpio4 19 0>;   # Which port does this belong to?
                 non-removable-ports = <1>;
                 reset-gpio = <&gpio4 20 0>;
         };

I'd prefer to have something like:

         usb2514@2c {
                 compatible = "smsc,usb2514";
                 reset-gpio = <&gpio4 20 0>;
                 reg = <0x2c>;
		usb-port@0 {
			# No O/C sensing
			hardwired;
			status = "okay";
		};
		usb-port@1 {
			overcurrent-gpio = <&gpio4 19 1>;
			status = "okay";
		};
		usb-port@2 {
			status = "disabled";
		};
		usb-port@3 {
			# No O/C sensing
			status = "okay";
		};
         };

Or would something like:


         usb2514@2c {
                 compatible = "smsc,usb2514";
                 reset-gpio = <&gpio4 20 0>;
                 reg = <0x2c>;
		usb-port@0 {
			# No O/C sensing
			hard-port-no = <0>;
			hardwired;
			status = "okay";
		};
		usb-port@1 {
			hard-port-no = <1>;
			overcurrent-gpio = <&gpio4 19 1>;
			status = "okay";
		};
		usb-port@2 {
			hard-port-no = <3>;
			# No O/C sensing
			status = "okay";
		};
         };

Be better?

Whats the best way to handle this?

-Ian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
