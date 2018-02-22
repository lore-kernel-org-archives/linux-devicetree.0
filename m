From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI
 bus driver core
Date: Thu, 22 Feb 2018 15:01:10 +0800
Message-ID: <201802221429.9znwFmb7%fengguang.wu@intel.com>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: linux-hwmon@vger.kernel.org, andrew@lunn.ch, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, jdelvare@suse.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kbuild-all@01.org, benh@kernel.crashing.org, linux@roeck-us.net, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

Hi Jae,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.16-rc2 next-20180221]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jae-Hyun-Yoo/PECI-device-driver-introduction/20180222-054545
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/peci/peci-core.c:773:29: sparse: symbol 'peci_match_id' was not declared. Should it be

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
