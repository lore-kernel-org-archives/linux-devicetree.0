From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] phy-core: Don't allow building phy-core as a module
Date: Tue, 11 Feb 2014 17:03:51 +0100
Message-ID: <1392134631-32030-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB3UT5GLQKGQEWAPBOBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

include/phy/phy.h has stub code in there for when building without the
phy-core enabled. This is useful for generic drivers such as ahci-platform,
ehci-platoform and ohci-platform which have support for driving an optional
phy passed to them through the devicetree.

Since on some boards this phy functionality is not needed, being able to
disable the phy subsystem without needing a lot of #ifdef magic in the
driver using it is quite useful.

However this breaks when the module using the phy subsystem is build-in and
the phy-core is not, which leads to the build failing with missing symbol
errors in the linking stage of the zImage.

Which leads to gems such as this being added to the Kconfig for achi_platform:

	depends on GENERIC_PHY || !GENERIC_PHY

Rather then duplicating this code in a lot of places using the phy-core,
I believe it is better to simply not allow the phy-core to be built as a
module. The phy core is quite small and has no external dependencies, so
always building it in when enabling it should not be an issue.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 6070c99..6e336b4 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -5,7 +5,7 @@
 menu "PHY Subsystem"
 
 config GENERIC_PHY
-	tristate "PHY Core"
+	bool "PHY Core"
 	help
 	  Generic PHY support.
 
-- 
1.8.5.3
