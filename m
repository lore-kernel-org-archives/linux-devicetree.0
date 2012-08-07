From: Hui Wang <jason77.wang@gmail.com>
Subject: [PATCH 0/2] Input: egalax_ts: parse devicetree to get gpio
Date: Tue, 7 Aug 2012 17:39:30 +0800
Message-ID: <1344332372-9287-1-git-send-email-jason77.wang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, jiejing.zhang@freescale.com
Cc: linux-input@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

eeti touch screen controller is an external chip for most platforms,
it connect to CPU via i2c bus, and it has a irq request pin need to be
connected to a gpio of the CPU, this irq request pin also act as a
wake up signal for touch screen controller, we need to get this gpio
number and operate it to wake up the controller, the old way to get
gpio is irq_to_gpio(), this API is dying and most platforms don't support
it, we change it to a more generic way to use devcietree.


Hui Wang (2):
  Input: egalax_ts: get gpio from devicetree node
  Input: add devicetree binding note for egalax_ts

 .../bindings/input/touchscreen/egalax-ts.txt       |   17 +++++++++++++++++
 drivers/input/touchscreen/egalax_ts.c              |   12 ++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt

-- 
1.7.6

