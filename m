From: Madhu Iyengar <madhu.iyengar@qlogic.com>
Subject: RE: [patch] qla2xxx: locking problem in qla2x00_init_rings()
Date: Tue, 14 Sep 2010 16:52:15 -0700
Message-ID: <5E4F49720D0BAD499EE1F01232234BA8712925CF9B@AVEXMB1.qlogic.org>
References: <20100912214033.GF25351@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <20100912214033.GF25351@bicker>
Content-Language: en-US
Sender: linux-scsi-owner@vger.kernel.org
To: Dan Carpenter <error27@gmail.com>, Andrew Vasquez <andrew.vasquez@qlogic.com>
Cc: Linux Driver <Linux-Driver@qlogic.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Giridhar Malavali <giridhar.malavali@qlogic.com>, Lalit Chandivade <lalit.chandivade@qlogic.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Arun Easi <arun.easi@qlogic.com>, Madhu Iyengar <madhu.iyengar@qlogic.com>
List-Id: devicetree@vger.kernel.org

Dan,

Thanks. We'll test this patch.

Patch-reviewed-by: Giridhar Malavali <giridhar.malavali@qlogic.com>
Acked-by: Madhu Iyengar <madhu.iyengar@qlogic.com>

Cheers,
Madhu

-----Original Message-----
From: linux-scsi-owner@vger.kernel.org [mailto:linux-scsi-owner@vger.kernel.org] On Behalf Of Dan Carpenter
Sent: Sunday, September 12, 2010 2:41 PM
To: Andrew Vasquez
Cc: Linux Driver; James E.J. Bottomley; Giridhar Malavali; Lalit Chandivade; Grant Likely; linux-scsi@vger.kernel.org; devicetree-discuss@lists.ozlabs.org; kernel-janitors@vger.kernel.org; Arun Easi
Subject: [patch] qla2xxx: locking problem in qla2x00_init_rings()

IRQs are already disabled here so we don't need to disable them again.
But more importantly, the spin_lock_irqsave() overwrites "flags" and
that breaks things when we want to re-enable the IRQs when we call
spin_unlock_irqrestore(&ha->hardware_lock, flags);

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This seems like an important bug.  I don't have this hardware but could
someone from QLogic test this out and maybe queue it up for 2.6.36?

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 9c383ba..9f4ba28 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -1787,14 +1787,14 @@ qla2x00_init_rings(scsi_qla_host_t *vha)
 		qla2x00_init_response_q_entries(rsp);
 	}
 
-	spin_lock_irqsave(&ha->vport_slock, flags);
+	spin_lock(&ha->vport_slock);
 	/* Clear RSCN queue. */
 	list_for_each_entry(vp, &ha->vp_list, list) {
 		vp->rscn_in_ptr = 0;
 		vp->rscn_out_ptr = 0;
 	}
 
-	spin_unlock_irqrestore(&ha->vport_slock, flags);
+	spin_unlock(&ha->vport_slock);
 
 	ha->isp_ops->config_rings(vha);
 
--
To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

