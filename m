From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH v3 0/2] support hisilicon i2c
Date: Tue, 11 Jun 2013 10:37:08 +0800
Message-ID: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>, Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

v3:
patch 02, use size instead of threshold

v2:
Suggested by Baruch
Support hisilicon i2c in i2c-designware-platdrv.c, and adding two optional properties

Zhangfei Gao (2):
  i2c: designware: use module_platform_driver
  i2c: designware: add two optional property tx/rx-fifo-size

 .../devicetree/bindings/i2c/i2c-designware.txt     |    7 +++++++
 drivers/i2c/busses/i2c-designware-platdrv.c        |   17 +++++------------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.9.5
