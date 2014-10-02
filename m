From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: ath10k: calibration data through Device Tree?
Date: Thu, 2 Oct 2014 16:14:43 +0300
Message-ID: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Device Tree gurus,

ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
located in drivers/net/wireless/ath/ath10k/. Currently it only supports
PCI devices.

Some of the devices store the calibration data to the host flash and the
bootloader reads the data from the flash. And now we need a method to
deliver the calibration data from bootloader to ath10k. Basically our
requirements are:

* ath10k must support any number of radios (one radio per PCI device).

* The calibration data is now 2116 bytes, in the future it might be
  longer. The data is unique for each radio and is created at the
  factory.

* ath10k must be able to reliably map the PCI device (=radio) to the
  correct calibration data. Maybe with using PCI bus and slot numbers?

We have been trying to find similar cases from other drivers but no
luck. Basically my question is how to do this properly with Device Tree?
Especially how to map the calibration data to correct PCI device? Are
there any examples which would help us to implement this?

-- 
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
