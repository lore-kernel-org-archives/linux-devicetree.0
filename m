From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] iio: chemical: add support for Sensirion SPS30
 sensor
Date: Mon, 10 Dec 2018 12:23:12 +0800
Message-ID: <201812101217.mLlmhLgt%fengguang.wu@intel.com>
References: <20181206210443.21052-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206210443.21052-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, jic23@jic23.retrosnub.co.uk, a.brauchli@elementarea.net, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on iio/togreg]
[also build test WARNING on v4.20-rc6 next-20181207]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Tomasz-Duszynski/add-support-for-Sensirion-SPS30-PM-sensor/20181209-204432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg


coccinelle warnings: (new ones prefixed by >>)

>> drivers/iio/chemical/sps30.c:115:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
