From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] rtc: sd3078: new driver.
Date: Sat, 10 Nov 2018 23:57:19 +0800
Message-ID: <201811102357.OsWIpHwn%fengguang.wu@intel.com>
References: <1541839433-28811-2-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541839433-28811-2-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zoro <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

Hi zoro,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v4.20-rc1 next-20181109]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/zoro/dt-bindings-define-vendor-prefix-for-whwave-Inc/20181110-205048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/rtc/rtc-sd3078.c:248:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
