From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: [PATCH v4 0/2] ath10k: device tree support
Date: Thu, 27 Nov 2014 14:08:47 +0200
Message-ID: <20141127120727.17546.61202.stgit@potku.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, toshik-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

here's providing ath10k calibration data via device tree support which
Toshi and me have been working on. Please review.

Device tree maintainers: please review the bindings document
carefully, this is the first time I have written one.

v4:

* use correct devicetree mailing list address

v3:

* add a debug message to ath10k

* write bindings file

* use ar->dev.of_node instead of pci_device_to_OF_node()

v2:

* fixed a bug that returns an uninitialized value if the node is not
  found

---

Kalle Valo (1):
      dt: bindings: add ath10k wireless device

Toshi Kikuchi (1):
      ath10k: read calibration data from Device Tree


 .../bindings/net/wireless/qcom,ath10k.txt          |   30 +++++++++
 drivers/net/wireless/ath/ath10k/core.c             |   70 ++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/core.h             |    3 +
 3 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
