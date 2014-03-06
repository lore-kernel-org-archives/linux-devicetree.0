From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH] spi/s3c64xx: Update DT binding documentation to match code
Date: Thu,  6 Mar 2014 17:05:39 +0000
Message-ID: <1394125539-28062-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following patch added support for spi controllers with a dedicated
chip select pin:

commit 3146beec21b64f4551fcf0ac148381d54dc41b1b
spi: s3c64xx: Added provision for dedicated cs pin

It updated the device tree binding to require a "cs-gpio" property to be
specified on the spi controller node if chip selects will be given as
GPIOs per slave, rather than the controller having a dedicated internal
chip select pin.

This patch updates the device tree binding documentation to match this.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

Hi,

Apologies if I missed something but there are a couple of
things I am not sure about in the original patch, there
seems to be no special handling for the dedicated case, like
set a bit that enables this or some such, which implies that
parts with dedicated cs pins will always update them even
if cs-gpio is specified. In which case wasn't what existed
before reasonable?

If the concern is that someone would try to use both the
internal chip select and a GPIO for two slaves on the same
controller, causing the first slave to always get chip
selected wouldn't a better solution be to require all slaves
to give a chip select GPIO if one does?

Finally, if we really want to specify in the DT for the
controller that it has an internal chip select wouldn't it
be better to invert the logic and  call it something like
"dedicated-cs" as then older bindings that currently use
GPIOs wouldn't break.

I thought it better to do a patch to update the
documentation rather than change the binding again, but
personally I would lean on the side of updating the binding
if others are in favour of it?

Thanks,
Charles

 .../devicetree/bindings/spi/spi-samsung.txt        |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-samsung.txt b/Documentation/devicetree/bindings/spi/spi-samsung.txt
index 86aa061..2f0167d 100644
--- a/Documentation/devicetree/bindings/spi/spi-samsung.txt
+++ b/Documentation/devicetree/bindings/spi/spi-samsung.txt
@@ -42,6 +42,11 @@ Optional Board Specific Properties:
 - num-cs: Specifies the number of chip select lines supported. If
   not specified, the default number of chip select lines is set to 1.
 
+- cs-gpio: Specifies that the spi controller will give a chip select gpio
+  for each slave node. Absence of this indicates that the controller has a
+  dedicated chip internal select pin and any GPIOs specified on the slaves
+  will be ignored.
+
 SPI Controller specific data in SPI slave nodes:
 
 - The spi slave nodes should provide the following information which is required
@@ -85,6 +90,7 @@ Example:
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi0_bus>;
+		cs-gpio;
 
 		w25q80bw@0 {
 			#address-cells = <1>;
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
