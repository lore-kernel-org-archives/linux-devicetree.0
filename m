From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: [PATCH 2/9] drivers/scsi/qla2xxx/qla_init.c: Drop unnecessary null
	test
Date: Tue, 3 Aug 2010 23:33:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1008032331360.20393@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Andrew Vasquez <andrew.vasquez-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>, linux-driver-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org, "J, ames E.J. Bottomley" <James.Bottomley-l3A5Bk7waGM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-scsi-u79uwXL29TZNg+MwTxZMZA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E;
@@

I(x,...) { <...
- (x != NULL) &&
  E
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

---
 drivers/scsi/qla2xxx/qla_init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index d863ed2..9c6af9c 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -3796,7 +3796,7 @@ qla2x00_update_fcports(scsi_qla_host_t *base_vha)
 	/* Go with deferred removal of rport references. */
 	list_for_each_entry_safe(vha, tvp, &base_vha->hw->vp_list, list)
 		list_for_each_entry(fcport, &vha->vp_fcports, list)
-			if (fcport && fcport->drport &&
+			if (fcport->drport &&
 			    atomic_read(&fcport->state) != FCS_UNCONFIGURED)
 				qla2x00_rport_del(fcport);
 }
