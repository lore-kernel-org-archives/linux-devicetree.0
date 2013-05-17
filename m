From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 0/5 v3] ARM: at91: dt: add USBA support
Date: Fri, 17 May 2013 16:14:43 +0200
Message-ID: <20130517141443.GB16804@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

HI,

	v3:
	rebase againt 3.10-rc1 + dt macro cleanup

	This patch serie finish to add the usb device support to dt for at91
	with the usba support present on the last at91 generation since sam9g45

The following changes since commit b3f442b0eedbc20b5ce3f4a96530588d14901199:

  ARM: at91: udpate defconfigs (2013-05-17 15:05:08 +0200)

are available in the git repository at:

  git://github.com/at91linux/linux-at91.git j/for-3.11-usba

for you to fetch changes up to f24c9792c29803420a7bf7204223ef028191d449:

  ARM: at91: sam9m10g45ek add udc DT support (2013-05-17 22:05:46 +0800)

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (5):
      usb: add Atmel USBA UDC DT support
      ARM: at91: sam9x5 add udc DT support
      ARM: at91: sam9x5ek add udc DT support
      ARM: at91: sam9g45 add udc DT support
      ARM: at91: sam9m10g45ek add udc DT support

 Documentation/devicetree/bindings/usb/atmel-usb.txt |   82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9g45.dtsi                  |   62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9m10g45ek.dts              |    5 +++++
 arch/arm/boot/dts/at91sam9x5.dtsi                   |   62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9x5ek.dtsi                 |    5 +++++
 arch/arm/mach-at91/at91sam9g45.c                    |    2 ++
 arch/arm/mach-at91/at91sam9x5.c                     |    2 ++
 drivers/usb/gadget/Kconfig                          |    2 +-
 drivers/usb/gadget/atmel_usba_udc.c                 |  214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------
 drivers/usb/gadget/atmel_usba_udc.h                 |    1 +
 10 files changed, 382 insertions(+), 55 deletions(-)

Best Regards,
J.
