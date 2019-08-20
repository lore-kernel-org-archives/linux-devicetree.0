From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 00/49] ath11k: driver for Qualcomm IEEE 802.11ax devices
Date: Tue, 20 Aug 2019 18:47:26 +0300
Message-ID: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ath11k is a new driver for Qualcomm IEEE 802.11ax devices, first
supporting only IPQ8074 SoC using the shared memory AHB bus. ath11k
uses mac80211 and supports AP, Station and Mesh modes.

Even though ath11k has some similar code as with ath10k (especially
the WMI layer) it was concluded to be simpler to have a "clean start"
for ath11k code base and not try to share the code with ath10k. This
makes maintenance easier and avoids major changes in ath10k, which
would have significantly increased the risk of regressions in existing
setups.

Even though the driver is very similar with ath10k but there are major
differences as well. The datapath is completely different. ath11k
supports multiple MACs, called "soc" in the firmware interface. And
there's only one WMI interface to support.

Currently ath11k supports only IEEE 802.11ac mode, but patches for
802.11ax are available and they will be submitted after ath11k is
accepted to upstream.

The firmware images are available from ath11k-firmware repository but
they will be also submitted to linux-firmware:

https://github.com/kvalo/ath11k-firmware

The driver has had multiple authors who are listed in alphabetical
order below.

Signed-off-by: Anilkumar Kolli <akolli-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Ganesh Sesetti <gseset-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Govindaraj Saminathan <gsamin-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Signed-off-by: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Signed-off-by: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Manikanta Pubbisetty <mpubbise-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Miles Hu <milehu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Muna Sinada <msinada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Rajkumar Manoharan <rmanohar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Sathishkumar Muruganandam <murugana-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Shashidhar Lakkavalli <slakkavalli-TRMIxWf3VywAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Sriram R <srirrama-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Sven Eckelmann <seckelmann-TRMIxWf3VywAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Vasanthakumar Thiagarajan <vthiagar-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Venkateswara Naralasetty <vnaralas-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

--------------[cut]-------------------[cut]-----------------

I have split the driver into multiple patches for easier review, but
the final commit will be one big patch and the commit log being the
text before the cut line above.

This version is based on commit b05c1a55a3a566893e15cfc2dc2cc20d476af0d6
from ath11k-bringup branch on my ath.git tree:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-bringup

This patch applies to wireless-drivers-next but needs
CONFIG_COMPILE_TEST, CONFIG_REMOTEPROC AND CONFIG_QCOM_QMI_HELPERS to
be able to compile on x86.

Please review and comment.

Kalle
