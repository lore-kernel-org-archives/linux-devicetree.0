From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] ARM: sunxi: Enable syscon for the system controller
Date: Sun,  4 May 2014 16:02:38 +0200
Message-ID: <1399212160-26934-1-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDWJTUUC5UCBBBMRTGNQKGQEUZCLO6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The so called "system controller" in Allwinner A20 and A31 SoCs is
multi-purpose controller that tries to add misc functionality to one
memory region.
In these SoCs it controls the internal SRAM partitioning but it also
includes registers for chip versioning and NMI control.
This patch adds the proper nodes in the DTS files and enable the syscon
in the defconfig files.

Even though the system controller includes also register for managing the
NMI controller, these register are not mapped in the syscon since they
are directly used and mapped by the NMI controller itself.

Carlo Caione (2):
  ARM: sunxi: dts: Enable syscon in DTSI
  ARM: sunxi: Add syscon support in defconfig

 arch/arm/boot/dts/sun6i-a31.dtsi    | 5 +++++
 arch/arm/boot/dts/sun7i-a20.dtsi    | 5 +++++
 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/sunxi_defconfig    | 1 +
 4 files changed, 12 insertions(+)

-- 
1.8.3.2
