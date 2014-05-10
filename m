From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Why do we assign a unique (and non-deterministic) name in
 of_device_make_bus_id()
Date: Sat, 10 May 2014 12:32:28 -0300
Message-ID: <20140510153227.GA18722@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>
Cc: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I have a devicetree for a custom board with several nodes with no
applicable reg property, such as:

/ {
	backlight {
		compatible = "pwm-backlight";
	};

	gpio-keys {
		compatible = "gpio-keys";
	};

	rotary-encoder {
		compatible = "rotary-encoder";
	};
};

These nodes are then registered as devices with unique names:

$ ls /sys/devices
gpio_keys.8/	rotary_encoder.9/	backlight.6/

... among others.

The uniqueness is guaranteed by of_device_make_bus_id() which uses a global
counter for all nodes with no reg property. The relevant snippet is:

[..]
/*
 * No BusID, use the node name and add a globally incremented
 * counter (and pray...)
 */
magic = atomic_add_return(1, &bus_no_reg_magic);
dev_set_name(dev, "%s.%d", node->name, magic - 1);

Two nodes can't have the same name and get registered, hence my confusion:
Is the unique number addition absolutely necessary? What am I missing here?

Isn't a bit problematic to register devices with names that depend solely
on probe order (i.e. non-deterministic)?

For instance, hotplug event listeners matching the device name may fail if
the device suddenly change for whatever reason.

Regards,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
