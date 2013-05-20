From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/7 v4] ARM: at91: dt: add USBA support
Date: Mon, 20 May 2013 18:21:49 +0200
Message-ID: <20130520162149.GC9937@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

HI,

	v4:
	fix multi instance support

	v3:
	rebase againt 3.10-rc1 + dt macro cleanup

	This patch serie finish to add the usb device support to dt for at91
	with the usba support present on the last at91 generation since sam9g45

The following changes since commit b3f442b0eedbc20b5ce3f4a96530588d14901199:

  ARM: at91: udpate defconfigs (2013-05-17 15:05:08 +0200)

are available in the git repository at:

  git://github.com/at91linux/linux-at91.git j/for-3.11-usba

for you to fetch changes up to 910026a08e2c2205953f2507cc11f4822998989b:

  ARM: at91: sam9m10g45ek add udc DT support (2013-05-20 23:52:17 +0800)

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (7):
      USB: gadget: atmel_usba: move global struct usba_ep usba_ep to struct usba_udc
      USB: gadget: atmel_usba: allow multi instance
      USB: gadget: atmel_usba: add DT support
      ARM: at91: sam9x5 add udc DT support
      ARM: at91: sam9x5ek add udc DT support
      ARM: at91: sam9g45 add udc DT support
      ARM: at91: sam9m10g45ek add udc DT support

 Documentation/devicetree/bindings/usb/atmel-usb.txt |   82 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9g45.dtsi                  |   62 +++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9m10g45ek.dts              |    5 ++
 arch/arm/boot/dts/at91sam9x5.dtsi                   |   62 +++++++++++++++++++++++
 arch/arm/boot/dts/at91sam9x5ek.dtsi                 |    5 ++
 arch/arm/mach-at91/at91sam9g45.c                    |    2 +
 arch/arm/mach-at91/at91sam9x5.c                     |    2 +
 drivers/usb/gadget/Kconfig                          |    2 +-
 drivers/usb/gadget/atmel_usba_udc.c                 |  264 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------
 drivers/usb/gadget/atmel_usba_udc.h                 |    2 +
 10 files changed, 407 insertions(+), 81 deletions(-)

Best Regards,
J.
