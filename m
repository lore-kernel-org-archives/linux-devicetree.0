From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] misc: ezport-firmware: new driver
Date: Fri, 23 Mar 2018 20:13:01 +0800
Message-ID: <201803232023.qttpOUFw%fengguang.wu@intel.com>
References: <20180320172201.2065-2-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180320172201.2065-2-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on v4.16-rc6 next-20180322]
[cannot apply to char-misc/char-misc-testing]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Reichel/GE-Healthcare-PPD-firmware-upgrade-driver-for-ACHC/20180323-144836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/misc/ezport-firmware.c:296:33: sparse: incompatible types in comparison expression (different type sizes)
   drivers/misc/ezport-firmware.c:329:33: sparse: incompatible types in comparison expression (different type sizes)
   In file included from include/linux/delay.h:22:0,
                    from drivers/misc/ezport-firmware.c:12:
   drivers/misc/ezport-firmware.c: In function 'ezport_firmware_flash_data':
   include/linux/kernel.h:792:16: warning: comparison of distinct pointer types lacks a cast
     (void) (&min1 == &min2);   8-                ^
   include/linux/kernel.h:801:2: note: in expansion of macro '__min'
     __min(typeof(x), typeof(y),   11-  ^~~~~
   drivers/misc/ezport-firmware.c:296:19: note: in expansion of macro 'min'
      transfer_size = min((u32) EZPORT_TRANSFER_SIZE, size - address);
                      ^~~
   drivers/misc/ezport-firmware.c: In function 'ezport_firmware_verify_data':
   include/linux/kernel.h:792:16: warning: comparison of distinct pointer types lacks a cast
     (void) (&min1 == &min2);   18-                ^
   include/linux/kernel.h:801:2: note: in expansion of macro '__min'
     __min(typeof(x), typeof(y),   21-  ^~~~~
   drivers/misc/ezport-firmware.c:329:19: note: in expansion of macro 'min'
      transfer_size = min((u32) EZPORT_TRANSFER_SIZE, size - address);
                      ^~~

vim +296 drivers/misc/ezport-firmware.c

   259	
   260	static int ezport_firmware_flash_data(struct spi_device *spi,
   261					      const u8 *data, size_t size)
   262	{
   263		int ret;
   264		u32 address = 0;
   265		u32 transfer_size;
   266	
   267		ret = ezport_get_status_register(spi);
   268		if (ret < 0)
   269			return ret;
   270	
   271		if (ret & EZPORT_STATUS_FS) {
   272			dev_dbg(&spi->dev, "bulk erase");
   273			ret = ezport_bulk_erase(spi);
   274			if (!ezport_ready(ret, false))
   275				return ret;
   276		}
   277	
   278		ret = ezport_get_status_register(spi);
   279		if (!ezport_ready(ret, false)) {
   280			dev_err(&spi->dev, "flash memory is not ready!");
   281			return ret;
   282		}
   283	
   284		while (address < size) {
   285			if (!(address & EZPORT_SECTOR_MASK)) {
   286				dev_dbg(&spi->dev, "section erase: %x", address);
   287				ret = ezport_section_erase(spi, address);
   288				if (!ezport_ready(ret, false))
   289					return ret;
   290			}
   291	
   292			ret = ezport_write_enable(spi);
   293			if (!ezport_ready(ret, true))
   294				return ret;
   295	
 > 296			transfer_size = min((u32) EZPORT_TRANSFER_SIZE, size - address);
   297	
   298			dev_dbg(&spi->dev, "transfer: %x", address);
   299			ret = ezport_flash_transfer(spi, address,
   300						    data+address, transfer_size);
   301			if (!ezport_ready(ret, false))
   302				return ret;
   303	
   304			address += transfer_size;
   305		}
   306	
   307		return 0;
   308	}
   309	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
