From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] ARM: sun7i/sun6i: Fix broken kernel on sun6i/A31
Date: Thu, 27 Mar 2014 18:02:37 +0100
Message-ID: <1395939759-11135-1-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBANT2GMQKGQEDF67DAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These fixes are proposed by Hans de Goede to fix the broken kernel on
sun6i/A31. The major problem is that the IRQ number for NMI on sun6i is wrong.
Besides that, Hans proposed a fix to avoid having sporious interrupts when the
NMI line is asserted but no driver has claimed the downstream interrupt of the
NMI.

Hans de Goede (2):
  ARM: sun7i/sun6i: dts: Fix IRQ number for sun6i NMI controller
  ARM: sun7i/sun6i: irqchip: Disable NMI before registering the handler

 arch/arm/boot/dts/sun6i-a31.dtsi | 2 +-
 drivers/irqchip/irq-sunxi-nmi.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.8.4.1
