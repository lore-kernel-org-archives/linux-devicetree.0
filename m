From: Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V4 01/10] bluetooth: hci_bcm: Fix RTS handling during startup
Date: Sun,  6 Oct 2019 17:28:19 +0200
Message-ID: <1570375708-26965-2-git-send-email-wahrenst@gmx.net>
References: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-bluetooth@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The RPi 4 uses the hardware handshake lines for CYW43455, but the chip
doesn't react to HCI requests during DT probe. The reason is the inproper
handling of the RTS line during startup. According to the startup
signaling sequence in the CYW43455 datasheet, the hosts RTS line must
be driven after BT_REG_ON and BT_HOST_WAKE.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
---
 drivers/bluetooth/hci_bcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 7646636..0f73f6a 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -445,9 +445,11 @@ static int bcm_open(struct hci_uart *hu)

 out:
 	if (bcm->dev) {
+		hci_uart_set_flow_control(hu, true);
 		hu->init_speed = bcm->dev->init_speed;
 		hu->oper_speed = bcm->dev->oper_speed;
 		err = bcm_gpio_set_power(bcm->dev, true);
+		hci_uart_set_flow_control(hu, false);
 		if (err)
 			goto err_unset_hu;
 	}
--
2.7.4
