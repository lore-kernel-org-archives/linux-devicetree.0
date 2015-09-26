From: kbuild test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:610:33: sparse:
 symbol 'pxtal_data' was not declared. Should it be static?
Date: Sat, 26 Sep 2015 09:35:38 +0800
Message-ID: <201509260912.Q0WHr90i%fengguang.wu@intel.com>
References: <1443209368-7135-4-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1443209368-7135-4-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sjoerd.simons@collabora.co.uk, robh+dt@kernel.org, kbuild-all@01.org, galak@codeaurora.org, nathan.chung@mediatek.com, mark.rutland@arm.com, javier@dowhile0.org, dan.carpenter@oracle.com, span@analogixsemi.com
List-Id: devicetree@vger.kernel.org

Hi Enric,

FYI, build test results on v4.3-rc2 (pls ignore if it's inappropriate base for your patch).

reproduce:
  # apt-get install sparse
  make ARCH=x86_64 allmodconfig
  make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:610:33: sparse: symbol 'pxtal_data' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:643:6: sparse: symbol 'sp_tx_initialization' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:2188:6: sparse: symbol 'sp_initialization' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:649:30: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:2129:30: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
>> drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c:2140:38: sparse: cast truncates bits from constant value (ffffff1f becomes 1f)

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
