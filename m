From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 0/2] Add xo calibration support for wifi rf clock
Date: Mon,  1 Apr 2019 14:49:24 +0530
Message-ID: <20190401091926.19119-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
To: ath10k@lists.infradead.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PMIC XO is the clock source for wifi rf clock in integrated wifi
chipset ex: WCN3990. Due to board layout errors XO frequency drifts
can cause wifi rf clock inaccuracy.
XO calibration test tree in Factory Test Mode is used to find the
best frequency offset(for example +/-2KHz )by programming XO trim
register. This ensure system clock stays within required 20 ppm
WLAN rf clock.

Retrieve the xo trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset (e.g., for integrated Wifi).
Calibrated XO offset is sent to fw, which compensate the clock drift
by programing the XO trim register.

Testing:
        Tested on QCS404 platform(WCN3990 HW)
        Tested FW: WLAN.HL.3.1-00959-QCAHLSWMTPLZ-1

change since v2:
       Added "qcom," prefix in xo cal prop.

change since v1:
        Added return check for case where xo cal dt is not populated.


Govind Singh (2):
  dt: bindings: add dt entry for XO calibration support
  ath10k: Add xo calibration support for wifi rf clock

 .../devicetree/bindings/net/wireless/qcom,ath10k.txt |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/snoc.c               | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/snoc.h               |  2 ++
 4 files changed, 26 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
