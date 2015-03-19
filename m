From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] st33zp24 fix when using irq mode
Date: Thu, 19 Mar 2015 22:15:08 +0100
Message-ID: <1426799709-9696-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Please find in this patch a fix that fix an improper command completion wait.
This patch apply on top of for-james branch 
tpm/tpm_infineon: Use struct dev_pm_ops for power management 6b37729bd184fdd44f144c6cc4951b06b55bcf4b

*** Note: This bug is also present in kernel 4.0 but will not apply as the driver structure changed between
kernel 4.0 and kernel 4.1.

A backported version is also going to be sent to <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> ?

Best Regards
Christophe

Christophe Ricard (1):
  tpm/st33zp24: Add proper wait for ordinal duration in case of irq mode

 drivers/char/tpm/st33zp24/st33zp24.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
