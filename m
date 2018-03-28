From: Li Jun <jun.li@nxp.com>
Subject: [PATCH v4 10/13] usb: typec: tcpm: set cc for drp toggling attach
Date: Thu, 29 Mar 2018 00:06:15 +0800
Message-ID: <1522253178-32414-11-git-send-email-jun.li@nxp.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: robh+dt@kernel.org, gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, peter.chen@nxp.com, linux-usb@vger.kernel.org, a.hajda@samsung.com, linux-imx@nxp.com, jun.li@nxp.com, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

In case of drp toggling, we may need set correct cc value for role control
after attach as it may never been set.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index 218c230..72d4232 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -2126,6 +2126,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	tcpm_set_attached_state(port, false);
 	port->try_src_count = 0;
 	port->try_snk_count = 0;
+	port->cc_req = 0;
 }
 
 static void tcpm_detach(struct tcpm_port *port)
@@ -2361,6 +2362,8 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 
 	case SRC_ATTACHED:
+		if (!port->cc_req)
+			tcpm_set_cc(port, tcpm_rp_cc(port));
 		ret = tcpm_src_attach(port);
 		tcpm_set_state(port, SRC_UNATTACHED,
 			       ret < 0 ? 0 : PD_T_PS_SOURCE_ON);
@@ -2531,6 +2534,8 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, SNK_UNATTACHED, PD_T_PD_DEBOUNCE);
 		break;
 	case SNK_ATTACHED:
+		if (!port->cc_req)
+			tcpm_set_cc(port, TYPEC_CC_RD);
 		ret = tcpm_snk_attach(port);
 		if (ret < 0)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);
-- 
2.7.4
