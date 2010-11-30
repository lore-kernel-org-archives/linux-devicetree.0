From: "Alexander V. Lukyanov" <lav-WwxVAQYGyOA@public.gmane.org>
Subject: [PATCH] fix hang in dmfe driver on sending of big packet
	(linux-2.6.35)
Date: Tue, 30 Nov 2010 16:46:26 +0300
Message-ID: <20101130134626.GA1856__10419.1528204412$1293143845$gmane$org@lw.yar.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-ID: <20101130135520.GB1883-7Hr7M4FKxbWHXe+LvDLADg@public.gmane.org>
Resent-To: Kyle McMartin <kyle-pfcGkIkfWfAsA/PxXw9srA@public.gmane.org>,
	Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
	devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tori-fPKbtz8S1WlZUfdmCwBGVg@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

This patch fixes hang in dmfe driver on attempt of sending a big packet.
Without this patch the code stops the queue and never wakes it again.

Signed-off-by: Alexander V. Lukyanov <lav-WwxVAQYGyOA@public.gmane.org>

-- 
   Alexander.

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmfe.patch"

--- dmfe.c.1	2010-11-30 16:21:52.758465207 +0300
+++ dmfe.c	2010-11-30 16:24:45.301468601 +0300
@@ -687,18 +687,18 @@
 	unsigned long flags;
 
 	DMFE_DBUG(0, "dmfe_start_xmit", 0);
 
-	/* Resource flag check */
-	netif_stop_queue(dev);
-
 	/* Too large packet check */
 	if (skb->len > MAX_PACKET_SIZE) {
 		pr_err("big packet = %d\n", (u16)skb->len);
 		dev_kfree_skb(skb);
 		return NETDEV_TX_OK;
 	}
 
+	/* Resource flag check */
+	netif_stop_queue(dev);
+
 	spin_lock_irqsave(&db->lock, flags);
 
 	/* No Tx resource check, it never happen nromally */
 	if (db->tx_queue_cnt >= TX_FREE_DESC_CNT) {

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--AhhlLboLdkugWU4S--
