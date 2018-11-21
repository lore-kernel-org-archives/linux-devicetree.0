From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v8 04/12] media: staging/imx7: add MIPI CSI-2 receiver
 subdev for i.MX7
Date: Thu, 22 Nov 2018 06:54:14 +0800
Message-ID: <201811220609.MIVjrYZv%fengguang.wu@intel.com>
References: <20181121111558.10838-5-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20181121111558.10838-5-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rui Miguel Silva <rui.silva@linaro.org>, kbuild-all@01.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rui,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v4.20-rc3 next-20181121]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Rui-Miguel-Silva/media-staging-imx7-add-i-MX7-media-driver/20181122-024200
base:   git://linuxtv.org/media_tree.git master


coccinelle warnings: (new ones prefixed by >>)

>> drivers/staging/media/imx/imx7-mipi-csis.c:1125:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
