From: Haojian Zhuang <haojian.zhuang@marvell.com>
Subject: [PATCH] tty: serial: check ops before registering console
Date: Fri,  8 Jul 2011 18:20:22 +0800
Message-ID: <1310120428-22700-6-git-send-email-haojian.zhuang@marvell.com>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-3-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-4-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1310120428-22700-5-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, haojian.zhuang@gmail.com, nico@fluxnic.net, samuel.ortiz@intel.com, broonie@opens
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
List-Id: devicetree@vger.kernel.org

Console should be only registered after port->ops assigned. If uart console
doesn't match the current uart, port->ops keeps NULL.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/tty/serial/pxa.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/pxa.c b/drivers/tty/serial/pxa.c
index fb80fb3..b117fab 100644
--- a/drivers/tty/serial/pxa.c
+++ b/drivers/tty/serial/pxa.c
@@ -685,7 +685,7 @@ serial_pxa_console_setup(struct console *co, char *options)
 	if (co->index == -1 || co->index >= serial_pxa_reg.nr)
 		co->index = 0;
 	up = &serial_pxa_ports[co->index];
-	if (!up)
+	if (!up || !up->port.ops)
 		return -ENODEV;
 
 	if (options)
-- 
1.5.6.5
