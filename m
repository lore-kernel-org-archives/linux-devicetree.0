From: Yossi Mansharoff <yossim@codeaurora.org>
Subject: [PATCH v2] doc: usb: ci-hdrc-usb2: Add property "mux-controls"
Date: Tue, 17 Apr 2018 16:53:25 +0300
Message-ID: <1523973206-2165-1-git-send-email-yossim@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, Yossi Mansharoff <yossim@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The chipidea usb controller may be connected, in some platforms,
to an external mux to toggle between different usb ports for
different roles (host and device).

The mux-controller property, if set, binds the chipidea usb
controller with a mux for this use.

Signed-off-by: Yossi Mansharoff <yossim@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 0e03344..2e93181 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -76,6 +76,10 @@ Optional properties:
   needs to make sure it does not send more than 90%
   maximum_periodic_data_per_frame. The use case is multiple transactions, but
   less frame rate.
+- mux-controls: The mux control for toggling host/device output of this
+  controller. It's expected that a mux state of 0 indicates device mode and a
+  mux state of 1 indicates host mode.
+- mux-control-names: Shall be "usb_switch" if mux-controls is specified.
 
 i.mx specific properties
 - fsl,usbmisc: phandler of non-core register device, with one
@@ -102,4 +106,6 @@ Example:
 		rx-burst-size-dword = <0x10>;
 		extcon = <0>, <&usb_id>;
 		phy-clkgate-delay-us = <400>;
+		mux-controls = <&usb_switch>;
+		mux-control-names = "usb_switch";
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
