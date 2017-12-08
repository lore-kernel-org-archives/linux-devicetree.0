From: Sven Eckelmann <sven.eckelmann-lv6y7wLVQPlWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] ath10k: DT support for ath10k calibration variant
Date: Fri,  8 Dec 2017 11:37:40 +0100
Message-ID: <20171208103742.3181-1-sven.eckelmann@openmesh.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ext.waldemar.rymarkiewicz-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Sven Eckelmann <sven-KaDOiPu9UxWEi8DpZVb4nw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sven Eckelmann <sven-KaDOiPu9UxWEi8DpZVb4nw@public.gmane.org>

Hi,

here is the second version of the qcom,ath10k-calibration-variant support
patchset. I think the ath10k patch describes these changes the best:

Board Data File (BDF) is loaded upon driver boot-up procedure. The right
board data file is identified on QCA4019 using bus, bmi-chip-id and
bmi-board-id.

The problem, however, can occur when the (default) board data file cannot
fulfill with the vendor requirements and it is necessary to use a different
board data file.

This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
Something similar has to be provided for systems without SMBIOS but with
device trees. No solution was specified by QCA and therefore a new one has
to be found for ath10k.

The device tree requires addition strings to define the variant name

    wifi@a000000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

    wifi@a800000 {
    	status = "okay";
    	qcom,ath10k-calibration-variant = "RT-AC58U";
    };

This would create the boarddata identifiers for the board-2.bin search

 *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
 *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U


The discussions to the old submissions can be found in:

RFC:
====

* https://patchwork.kernel.org/patch/9613615/

v1:
===

* https://patchwork.kernel.org/patch/9615183/
* https://patchwork.kernel.org/patch/9615185/

Changes since v1:
=================

* check the return value of strscpy and print debug message when buffer
  was not big enough (I would have preferred ath10k_warn but
  ath10k_core_check_bdfext disagreed)

Changes since RFC:
==================

* Split patch in DT doc and ath10k part (thanks Christian Lamparter)
* Remove the words "bmi-chip-id" and "bmi-board-id" and replace them with
  more generic "device specific ids"

Kind regards,
	Sven


Sven Eckelmann (2):
  dt: bindings: add new dt entry for ath10k calibration variant
  ath10k: search DT for qcom,ath10k-calibration-variant

 .../bindings/net/wireless/qcom,ath10k.txt          |  3 ++
 drivers/net/wireless/ath/ath10k/core.c             | 40 ++++++++++++++++++----
 2 files changed, 36 insertions(+), 7 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
