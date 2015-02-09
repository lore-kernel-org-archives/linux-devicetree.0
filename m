From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH 0/3] ARM: at91: at91sam9n12ek: enable usb gadget support
Date: Mon, 9 Feb 2015 17:02:49 +0800
Message-ID: <1423472572-19824-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, nicolas.ferre@atmel.com
Cc: devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series enable the usb gadget support on at91sam9n12ek
board. On at91sam9n12 SoC which integrate the full speed udc device.


Bo Shen (3):
  USB: gadget: at91_udc: add at91sam9n12 support
  ARM: at91: dt: at91sam9n12: add udp device node
  ARM: at91: dt: at91sam9n12ek: enable udp

 arch/arm/boot/dts/at91sam9n12.dtsi  | 9 +++++++++
 arch/arm/boot/dts/at91sam9n12ek.dts | 5 +++++
 drivers/usb/gadget/udc/at91_udc.c   | 9 ++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.3.0.rc0
