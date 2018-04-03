From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v1 6/7] Bluetooth: hci_mediatek: Add protocol support for
 MediaTek serial devices
Date: Tue, 3 Apr 2018 20:13:03 +0800
Message-ID: <201804032020.XSC8Oqit%fengguang.wu@intel.com>
References: <f0e0a0b7f1dc3845dc6eafb4ccd60284d1675f8d.1522736996.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <f0e0a0b7f1dc3845dc6eafb4ccd60284d1675f8d.1522736996.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, johan.hedberg@gmail.com, marcel@holtmann.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, kbuild-all@01.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20180329]
[also build test WARNING on v4.16]
[cannot apply to linus/master bluetooth/master bluetooth-next/master v4.16 v4.16-rc7 v4.16-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/add-support-for-Bluetooth-on-MT7622-SoC/20180403-160035
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/bluetooth/hci_mediatek.c:322:5: sparse: symbol 'mtk_recv_frame' was not declared. Should it be static?
>> drivers/bluetooth/hci_mediatek.c:415:57: sparse: Using plain integer as NULL pointer

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
