From: Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>
Subject: Re: Dealing with optional i2c devices in a devicetree
Date: Fri, 5 Jun 2015 10:06:29 +0200
Message-ID: <20150605100629.50f3115c@endymion.delvare>
References: <55713BB1.80004@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55713BB1.80004-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, shardy-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, guillaume.roguez-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, 5 Jun 2015 06:03:30 +0000, Chris Packham wrote:
> I'm working on a new board and one feature it as is a plug-in module 
> with an ADS7830 voltage monitor on it. This will be used during 
> manufacturing to sanity check that various voltage rails are within 
> expected ranges.
> 
> I have a dts entry for the device as below (with some omissions for the 
> sake of clarity)
> 
> 	soc {
> 		internal-regs {
> 			i2c@11000 {
> 				ads7830@48 {
> 					compatible = "ads7830";
> 					reg = <0x48>;
> 				};
> 			};
> 		};
> 	};
> 
> The problem is that when the manufacturing card is not installed the 
> device still shows up in /sys/class/hwmon/hwmon0/ and 
> /sys/bus/i2c/devices/0-0048/ despite it not actually being present. If I 
> was using an old style initialization I could use 
> i2c_new_probed_device() which I think would stop the drivers probe() 
> function from being called

It would prevent the i2c device from being instantiated in the first
place, which in turn indeed means no probe function would be called.

> Looking at the ads7828_probe() function it doesn't actually do anything 
> with the i2c device before calling hwmon_device_register(). Some hwmon 
> drivers like lm73_probe() do attempt to read from the device and bail if 
> the read fails. I can probably fix my problem by doing something similar 
> in the ads7828_probe(), but there are other drivers that have a similar 
> probe function.

The lm73 driver needs to read a register value in order to initialize
the internal device state. If the read fails, something like -EIO will
be returned, not -ENODEV. In other words, the lm73 driver reports that
it failed to initialize the device, NOT that there was no device. And
this will not remove the "lm73" i2c device. Just no hwmon class device
will be created.

> Is there a better way of getting the devicetree machinery to avoid the 
> call to the driver probe function in the first place?

There is nothing hwmon-specific in your question. You need a way to
declare in the device tree devices which may or may not be present. Or
you need a way to modify the device tree at run-time depending on which
hardware plug-in modules are present. I have no idea if either can be
done, this is really a question for people familiar with the device
tree model and infrastructure (which I am not, sorry.)

-- 
Jean Delvare
SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
