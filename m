Return-Path: <SRS0=g2bY=FN=intel.com=fengguang.wu@kernel.org>
Date: Mon, 19 Feb 2018 15:45:38 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] phy: mapphone-mdm6600: Add USB PHY driver for MDM6600 on
 Droid 4
Message-ID: <201802191503.yJma6SYG%fengguang.wu@intel.com>
References: <20180217210723.7013-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180217210723.7013-1-tony@atomide.com>
To: Tony Lindgren <tony@atomide.com>
Cc: kbuild-all@01.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marcel Partap <mpartap@gmx.net>, Michael Scott <michael.scott@linaro.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on phy/next]
[also build test WARNING on v4.16-rc2 next-20180216]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Tony-Lindgren/phy-mapphone-mdm6600-Add-USB-PHY-driver-for-MDM6600-on-Droid-4/20180219-131127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/phy/motorola/phy-mapphone-mdm6600.c:354:24: sparse: incompatible types for operation (>=)
   drivers/phy/motorola/phy-mapphone-mdm6600.c:354:24: left side has type struct gpio_desc
   drivers/phy/motorola/phy-mapphone-mdm6600.c:354:24: right side has type int
>> drivers/phy/motorola/phy-mapphone-mdm6600.c:354:24: sparse: incorrect type in conditional
   drivers/phy/motorola/phy-mapphone-mdm6600.c:354:24: got bad type

vim +354 drivers/phy/motorola/phy-mapphone-mdm6600.c

   340	
   341	/**
   342	 * phy_mdm6600_device_power_off() - power off mdm6600 device
   343	 * @ddata: device driver data
   344	 */
   345	static void phy_mdm6600_device_power_off(struct phy_mdm6600 *ddata)
   346	{
   347		struct gpio_desc *reset_gpio =
   348			ddata->gpio[PHY_MDM6600_RESET];
   349	
   350		ddata->enabled = false;
   351		phy_mdm6600_cmd(ddata, AP_STATUS_BP_SHUTDOWN_REQ);
   352		msleep(100);
   353	
 > 354		if (reset_gpio >= 0)
   355			gpiod_set_value_cansleep(reset_gpio, 1);
   356	
   357		dev_info(ddata->dev, "Waiting for power down request to complete.. ");
   358		if (wait_for_completion_timeout(&ddata->ack,
   359						msecs_to_jiffies(5000))) {
   360			dev_info(ddata->dev, "Powered down OK\n");
   361		} else {
   362			dev_err(ddata->dev, "Timed out powering down\n");
   363		}
   364	}
   365	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
